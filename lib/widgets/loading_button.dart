import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(whiteColor),
              ),
            ),
            const SizedBox(width: 8,),
            Text(
              'Loading',
              style: subtitleTextStyle.copyWith(
                  fontSize: 16, fontWeight: bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
