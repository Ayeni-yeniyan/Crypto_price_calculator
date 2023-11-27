import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '/components/coin_data.dart';
import '/components/custom_container.dart';
import '/constants.dart';

Future<double> getLiveData({required coin, required currency}) async {
  try {
    http.Response response = await http.get(
      Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/$coin/$currency',
        {'apikey': apiKey},
      ),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      double decodedData = jsonDecode(data)['rate'];
      return decodedData;
    } else {
      print(response.statusCode);
      return 0;
    }
  } catch (e) {
    print(e);
    return 0;
  }
}

List<CustomContainer> customContainerList = [];
Future getCurrentCoinPrice(String currency) async {
  for (CoinData coinData in coindataList) {
    double coinPrice =
        await getLiveData(coin: coinData.nameAbbr, currency: currency);

    if (coinPrice.toInt() == 0) {
      CustomContainer newCustomContainer = CustomContainer(
        coinColor: coinData.color,
        coinIcon: coinData.icon,
        coinName: coinData.name,
        coinSymbol: coinData.nameAbbr,
        currentPrice: '${NumberFormat('0.##').format(coinPrice)} $currency',
      );
      customContainerList.add(newCustomContainer);
    } else {
      CustomContainer newCustomContainer = CustomContainer(
        coinColor: coinData.color,
        coinIcon: coinData.icon,
        coinName: coinData.name,
        coinSymbol: coinData.nameAbbr,
        currentPrice:
            '${NumberFormat('#,###').format(coinPrice.toInt())} $currency',
      );
      customContainerList.add(newCustomContainer);
    }
  }
}
