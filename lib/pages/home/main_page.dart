import 'package:brk_mobile/pages/home/chat_page.dart';
import 'package:brk_mobile/pages/home/favorite_page.dart';
import 'package:brk_mobile/pages/home/home_page.dart';
import 'package:brk_mobile/pages/home/profile_page.dart';
import 'package:brk_mobile/pages/map_page.dart';
import 'package:brk_mobile/providers/page_provider.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = localStorage.getString('token')!;
    print(token);
  }

  //ON BACK PRESSED
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
        context: context, builder: (context) => _buildExitDialog(context));
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    PageProvier pageProvier = Provider.of<PageProvier>(context);

    // Floating Action Button Location
    Widget buildLocationButton() {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            pageProvier.currentIndex = 2;
          });
        },
        backgroundColor: secondaryColor,
        child: Icon(Icons.location_on),
      );
    }

    // Bottom Navigation Bar
    Widget buildCustomBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor2,
              currentIndex: pageProvier.currentIndex,
              onTap: (value) {
                pageProvier.currentIndex = value;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.home,
                      color: pageProvier.currentIndex == 0
                          ? primaryColor
                          : Color(0xff808191),
                      size: 22,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.chat,
                      color: pageProvier.currentIndex == 1
                          ? primaryColor
                          : Color(0xff808191),
                      size: 22,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.home,
                      color: pageProvier.currentIndex == 2
                          ? primaryColor
                          : Color(0xff808191),
                      size: 22,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.favorite,
                      color: pageProvier.currentIndex == 3
                          ? primaryColor
                          : Color(0xff808191),
                      size: 22,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.person,
                      color: pageProvier.currentIndex == 4
                          ? primaryColor
                          : Color(0xff808191),
                      size: 22,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (pageProvier.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return MapPage();
          break;
        case 3:
          return FavoritePage();
          break;
        case 4:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        floatingActionButton: buildLocationButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildCustomBottomNav(),
        body: body(),
      ),
    );
  }
}
