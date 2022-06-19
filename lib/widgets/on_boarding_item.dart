import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String asset, onBoardingText;
  const OnBoardingItem({Key? key, required this.asset, required this.onBoardingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
                                          height: 220,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding:
          const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 96),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                onBoardingText,
                style: blackTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}