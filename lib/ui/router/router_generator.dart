import 'package:bai_tap_figma1/ui/screen/change_language/change_language.dart';
import 'package:bai_tap_figma1/ui/screen/change_password/change_password_screen.dart';
import 'package:bai_tap_figma1/ui/screen/create_account/create_account.dart';
import 'package:bai_tap_figma1/ui/screen/home/create_folder.dart';
import 'package:bai_tap_figma1/ui/screen/home/home_screen.dart';
import 'package:bai_tap_figma1/ui/screen/login/login_screen.dart';
import 'package:bai_tap_figma1/ui/screen/menu/side_menu_screen.dart';
import 'package:bai_tap_figma1/ui/screen/profile/profile_screen.dart';
import 'package:bai_tap_figma1/ui/screen/setting/setting_screen.dart';
import 'package:bai_tap_figma1/ui/screen/splash/splash_screen.dart';
import 'package:bai_tap_figma1/ui/screen/storage_details/storage_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '404.dart';
import 'package:page_transition/page_transition.dart';

class DataBundle{
String? id ;
DataBundle({this.id});
}

class RouterGenerator{
  static const routeHome = "/home";
  static const routeCreateFolder = '/createFolder';
  static const routeLogin = "/login";
  static const routeCreateAccount = '/createAccount';
  static const routeSplash = "/splash";
  static const routeMenu = "/menu";
  static const routeProfile = "/profile";
  static const routeSetting =  "/settings";
  static const routeStorageDetail = "/storage";
  static const routeChangePassword = "/changepassword";
  static const routeChangeLanguage = "/changelanguage";

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case routeSplash:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case routeCreateAccount:
        return PageTransition(
            child: CreateAccountScreen(),
            type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 300)
        );
      case routeHome:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case routeMenu:
        return PageTransition(
            child: SideMenuScreen(),
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 500)
        );
      case routeProfile:
        return PageTransition(
            child: ProfileScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
      case routeSetting:
        return PageTransition(
            child: SettingScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
      case routeStorageDetail:
        return PageTransition(
            child: StorageScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
      case routeChangePassword:
        return PageTransition(
            child: ChangePasswordScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
      case routeChangeLanguage:
        return PageTransition(
            child: ChangeLanguageScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
      case routeCreateFolder:
        return PageTransition(
            child: CreateFolder(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300)
        );
    }
    return MaterialPageRoute(builder: (_)=> WidgetNotFound() );
  }
}