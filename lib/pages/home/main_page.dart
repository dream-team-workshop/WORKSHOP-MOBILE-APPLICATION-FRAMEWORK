import 'package:brk_mobile/pages/home/chat_page.dart';
import 'package:brk_mobile/pages/home/favorite_page.dart';
import 'package:brk_mobile/pages/home/home_page.dart';
import 'package:brk_mobile/pages/home/profile_page.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Floating Action Button Location
    Widget buildLocationButton() {
      return FloatingActionButton(
        onPressed: () {},
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
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 3),
                    child: Icon(
                      Icons.home,
                      color:
                          currentIndex == 0 ? primaryColor : Color(0xff808191),
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
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191),
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
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191),
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
                      color:
                          currentIndex == 3 ? primaryColor : Color(0xff808191),
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
                      color:
                          currentIndex == 4 ? primaryColor : Color(0xff808191),
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
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return HomePage();
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

    return Scaffold(
      floatingActionButton: buildLocationButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildCustomBottomNav(),
      body: body(),
    );
  }
}
