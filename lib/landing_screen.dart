import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'components/coin_data.dart';
import 'constants.dart';
import 'components/network.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  Future updateUI() async {
    networkStatus();
    setState(() {
      isLoading = true;
    });
    customContainerList.clear();
    await getCurrentCoinPrice(_selectedCurrency);
    setState(() {
      isLoading = false;
    });
  }

  Future networkStatus() async {
    setState(() {
      networkIsPoor = false;
    });

    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        networkIsPoor = true;
      });
    });
  }

  late bool isLoading;
  bool networkIsPoor = false;
  String _selectedCurrency = 'NGN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRYPTO PRICE CHECKER'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          isLoading
              ? SizedBox(
                  height: 650,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'PLEASE WAIT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          color: Colors.white,
                        ),
                      ),
                      const SpinKitFadingCircle(color: Colors.white, size: 80),
                      Visibility(
                        visible: networkIsPoor,
                        child: const Text(
                          'Poor internet connection. Reloading...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(
                  height: 650, child: Column(children: customContainerList)),
          const SizedBox(height: 60),
          DropdownButton(
            value: _selectedCurrency,
            dropdownColor: kScaffoldColor,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            onChanged: (value) async {
              _selectedCurrency = value!;

              updateUI();
            },
            items: getCurrencies(),
          ),
        ],
      ),
    );
  }
}
