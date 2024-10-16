import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6A0DAD), Color(0xFF800000)], // Purple to maroon gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 24,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
