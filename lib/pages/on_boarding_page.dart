import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/theme.dart';
import 'package:brk_mobile/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      const OnBoardingItem(asset: 'assets/images/splashscreen1.png', onBoardingText: 'Good Coffee Good Moods!'),
                      const OnBoardingItem(asset: 'assets/images/splashscreen2.png', onBoardingText: 'CoffeIn Frappuccino Work can wait!'),
                      Stack(
                        children: [
                          Center(
                            child: Image.asset(
              
                              'assets/images/splashscren3.png',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x00FFFFFF),
                                  Colors.white
                                ],
                                stops: [0.3, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 96),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Morning begins with CoffeIn',
                                  style: blackTextStyle.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    color: Colors.black87
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: buildStartButton()
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                      child: Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (index) {
                              pageViewController!.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: const ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 16,
                              dotColor: Color.fromARGB(147, 32, 32, 32),
                              activeDotColor: Color.fromARGB(255, 0, 0, 0),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  pageViewController!.animateToPage(
                                    pageViewController!.page!.toInt() + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Text(
                                  'Lanjut',
                                  style: blackTextStyle.copyWith(
                                    fontFamily: 'Poppins',
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

Widget buildStartButton() {
      return Container(
        height: 55,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            'Masuk',
            style: subtitleTextStyle.copyWith(
                fontSize: 16, fontWeight: bold, color: Colors.white),
          ),
        ),
      );
    }

}