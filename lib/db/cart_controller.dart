import 'package:get/get.dart';
import 'package:smart_store/api/controllers/user_controller.dart';
import 'package:smart_store/db/db.dart';
import 'package:smart_store/model/cart_item.dart';
import 'package:smart_store/model/product/product.dart';

class CartController {
  final db = DB().database;
  final userId = Get.find<UserController>().user.value!.id;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxBool isLoading = false.obs;

  Future<bool> loadCart() async {
    isLoading.value = true;
    final data =
        await db.query('cart', where: 'user_id=?', whereArgs: [userId]);
    isLoading.value = false;
    cartItems.value = data.map((e) => CartItem.fromMap(e)).toList();
    if (cartItems.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addToCart(Product product) async {
    final index = cartItems.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      var temp = cartItems[index].cartQuantity;
      temp = temp + 1;
      if (temp > product.quantity) {
        Get.snackbar('Failed', 'You added maximum quantity available');
        return false;
      }
      cartItems[index].cartQuantity = cartItems[index].cartQuantity + 1;
      cartItems.refresh();
      final result = await db.update("cart", cartItems[index].toMap(),
          where: 'id=? AND user_id=?',
          whereArgs: [cartItems[index].id, userId]);
      if (result > 0) {
        Get.snackbar('Success', 'product quantity increased to $temp in cart');
      }
      return result > 0;
    } else {
      final cartItem = CartItem(
          userId: userId,
          id: product.id,
          nameEn: product.nameEn,
          nameAr: product.nameAr,
          infoEn: product.infoEn,
          infoAr: product.infoAr,
          price: product.price,
          quantity: product.quantity,
          cartQuantity: 1,
          imageUrl: product.imageUrl,

      );

      final result = await db.insert('cart', cartItem.toMap());
      if (result > 0) {
        cartItems.insert(0, cartItem);
        Get.snackbar('Success', 'Product added to cart');
      }
      return result > 0;
    }
  }

  Future<bool> increaseQuantity(CartItem cartItem) async {
    final index = cartItems.indexWhere((element) => element.id == cartItem.id);
    var temp = cartItems[index].cartQuantity;
    temp = temp + 1;
    if (cartItems[index].quantity < temp) {
      Get.snackbar('Failed', 'You added maximum quantity available');
      return false;
    } else {
      cartItems[index].cartQuantity = cartItems[index].cartQuantity + 1;
      cartItems.refresh();
      final result = await db.update("cart", cartItems[index].toMap(),
          where: 'id=? AND user_id=?',
          whereArgs: [cartItems[index].id, userId]);

      return result > 0;
    }
    return true;
  }

  Future<bool> decreaseQuantity(CartItem cartItem) async {
    final index = cartItems.indexWhere((element) => element.id == cartItem.id);
    var temp = cartItems[index].cartQuantity;
    temp = temp - 1;
    if (temp < 1) {
      return false;
    } else {
      CartItem x = cartItems[index];
      x.cartQuantity = x.cartQuantity - 1;
      final result = await db.update("cart", x.toMap(),
          where: 'id=? AND user_id=?', whereArgs: [cartItem.id, userId]);
      if (result > 0) {
        cartItems[index] = x;
        cartItems.refresh();
      }
      return result > 0;
    }
  }

  Future<bool> deleteCartItem(int id) async {
    final result = await db
        .delete('cart', where: 'id=? AND user_id=?', whereArgs: [id, userId]);
    if (result > 0) {
      final index = cartItems.indexWhere((element) => element.id == id);
      cartItems.removeAt(index);
      cartItems.refresh();
    }
    return result > 0;
  }

  int totalItemsCount() {
    int count = 0;
    cartItems.forEach((element) {
      count += element.cartQuantity;
    });
    return count;
  }

  double totalItemsPrice() {
    double count = 0;
    cartItems.forEach((element) {
      count += element.cartQuantity * element.price;
    });
    return count;
  }
}
