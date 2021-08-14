import 'package:flutter/material.dart';
import 'package:smart_store/model/screen.dart';
import 'package:smart_store/screen/bottom_nav/categories_screen.dart';
import 'package:smart_store/screen/bottom_nav/card_screen.dart';
import 'package:smart_store/screen/bottom_nav/OrdersScreen.dart';
import 'package:smart_store/screen/bottom_nav/home_screen.dart';
import 'package:smart_store/screen/bottom_nav/favorite_screen.dart';
import 'package:smart_store/screen/notification_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/widget/my_text.dart';
import 'package:badges/badges.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _title = 'Home';
  int _currentIndex = 0;

  List<BottomNavigationBarScreen> _screen = <BottomNavigationBarScreen>[
    BottomNavigationBarScreen('Home', HomeScreen()),
    BottomNavigationBarScreen('Categories', CategoriesScreen()),
    BottomNavigationBarScreen('Map', CardScreen()),
    BottomNavigationBarScreen('Favorite', FavoriteScreen()),
    BottomNavigationBarScreen('Orders', OrdersScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
          ],
        ),
      ),
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: AppColors.COLOR,
          elevation: 0,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            side: BorderSide(
              color: AppColors.COLOR,
              width: 1,
            ),
          ),
          title: MyText(
              text: _screen.elementAt(_currentIndex).titel,
              fText: 'Merienda',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.Auth_COLOR),
          actions: [
            Card(
              elevation: 5,
              color: AppColors.COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: AppColors.Auth_COLOR, width: 1.5),
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Badge(
                      badgeColor: AppColors.White_COLOR,
                      badgeContent: Text('3'),
                      child: Icon(Icons.notification_important_outlined),
                    ),
                    color: AppColors.White_COLOR,
                    onPressed: () {
                      Navigator.pushNamed(context, '/NotificationScreen');
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Badge(
                      // badgeColor: AppColors.White_COLOR,
                      // badgeContent: Text('3'),
                      child: Icon(Icons.settings),
                    ),
                    color: AppColors.White_COLOR,
                    onPressed: () {
                      Navigator.pushNamed(context, '/SettingsScreen');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        body: _screen.elementAt(_currentIndex).widget,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color(0xff0D0E56),
          fixedColor: AppColors.Auth_COLOR,
          elevation: 3,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (int selectedIndex) {
            setState(() {
              _currentIndex = selectedIndex;
            });
            switch (selectedIndex) {
              case 0:
                _title = "Home";
                break;
              case 4:
                _title = "Categories";
                break;

              case 2:
                _title = "Map";
                break;
              case 3:
                _title = "Favorite";
                break;
              case 1:
                _title = "Orders";
                break;
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                maxRadius: 25,
                backgroundColor: AppColors.COLOR,
                child: IconButton(
                    icon: Icon(Icons.card_giftcard_sharp,
                        size: 30, color: AppColors.W_COLOR),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/CardScreen');
                      });
                    }),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: 'Orders',
            ),
          ],
        ),
      ),
    );
  }
}
