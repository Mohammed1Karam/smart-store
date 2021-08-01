import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smart_store/screen/auth/login_screen.dart';
import 'package:smart_store/screen/auth/sign_up_screen.dart';
import 'package:smart_store/screen/launch_screen.dart';
import 'package:smart_store/screen/on_boarding/on_boarding_screen.dart';
import 'package:smart_store/stroage/share_pref_controller.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'get/cities_getx_controller.dart';
import 'screen/auth/forget_password_screen.dart';
import 'screen/bottom_nav/card_screen.dart';
import 'screen/bottom_nav/main_screen.dart';
import 'screen/categories/sub_categories_screen.dart';
import 'screen/home/latest_products_screen.dart';
import 'screen/home/products_you_may_like_screen.dart';
import 'screen/notification_screen.dart';
import 'screen/settings/about_screen.dart';
import 'screen/settings/change_password_screen.dart';
import 'screen/settings/settings_screen.dart';
import 'stroage/language_change_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharePreferences();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  // const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        // create: (context) => CategoryProviderNotifier(),
        create: (context) => LanguageChangeNotifier(
          Locale(
            SharedPrefController().currentLanguage(),
          ),
        ),
      ),
    ], child: AppMainMaterial());
  }
}

class AppMainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      locale: Provider.of<LanguageChangeNotifier>(context).locale,
      initialRoute: '/LunchScreen',
      routes: {
        '/LunchScreen': (context) => LaunchScreen(),
        '/OnBoardingScreen': (context) => OnBoardingScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/SignUpScreen': (context) => SignUpScreen(),
        // '/PinScreen': (context) => PinScreen(mobile: mobile),
        // '/ResetPasswordScreen': (context) => ResetPasswordScreen(),
        '/ForgetPasswordScreen': (context) => ForgetPasswordScreen(),
        '/MainScreen': (context) => MainScreen(),
        '/PopularFoodScreen': (context) => LatestProductsScreen(),
        '/SettingsScreen': (context) => SettingsScreen(),
        '/NotificationScreen': (context) => NotificationScreen(),
        '/SubCategoriesScreen': (context) => SubCategoriesScreen(),
        '/ChangePasswordScreen': (context) => ChangePasswordScreen(),
        '/AboutScreen': (context) => AboutScreen(),
        '/ProductsYouMayLikeScreen': (context) => ProductsYouMayLikeScreen(),
        '/CardScreen': (context) => CardScreen(),
      },
    );
  }
}
