import 'package:flutter/material.dart';

class WelcomingWidget extends StatelessWidget {
  const WelcomingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 28, top: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Mau kerjakan soal apa hari ini ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/banner.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
