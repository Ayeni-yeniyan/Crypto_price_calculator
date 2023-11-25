import 'package:flutter/material.dart';

import '../constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.coinName,
    required this.coinSymbol,
    required this.currentPrice,
    required this.coinIcon,
    required this.coinColor,
  });
  final IconData? coinIcon;
  final Color coinColor;
  final String coinName;
  final String coinSymbol;
  final String currentPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                coinIcon,
                color: coinColor,
                size: 40,
              ),
              const SizedBox(width: 10),
              Text(
                coinName,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text.rich(
                textAlign: TextAlign.end,
                TextSpan(
                  text: '1 $coinSymbol\n',
                  style: TextStyle(
                      color: coinColor.withOpacity(0.6),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: currentPrice,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.drag_handle_rounded,
                color: kLightGrey,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
