import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NGN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

List<DropdownMenuItem<String>> getCurrencies() {
  List<DropdownMenuItem<String>> dropdownItems = [];
  for (String currency in currenciesList) {
    DropdownMenuItem<String> newItem =
        DropdownMenuItem(value: currency, child: Text(currency));
    dropdownItems.add(newItem);
  }
  return dropdownItems;
}

class CoinData {
  CoinData(
      {required this.color,
      required this.name,
      required this.nameAbbr,
      required this.icon,
      required this.currentPrice});
  final Color color;
  final String name;
  final String nameAbbr;
  final IconData icon;
  final String currentPrice;
}

List<CoinData> coindataList = [
  CoinData(
      color: const Color(0xFFF7931A),
      name: 'Bitcoin',
      nameAbbr: 'BTC',
      icon: CryptoFontIcons.btc,
      currentPrice: 'Unknown'),
  CoinData(
      color: const Color(0xFF12100B),
      name: 'Ethereum',
      nameAbbr: 'ETH',
      icon: CryptoFontIcons.eth,
      currentPrice: 'Unknown'),
  CoinData(
      color: const Color(0xFFADD8E6),
      name: 'Litecoin',
      nameAbbr: 'LTC',
      icon: CryptoFontIcons.ltc,
      currentPrice: 'Unknown'),
  CoinData(
      color: const Color(0xFF00A5DF),
      name: 'Ripple',
      nameAbbr: 'XRP',
      icon: CryptoFontIcons.xrp,
      currentPrice: 'Unknown'),
  CoinData(
      color: const Color(0xFF987F50),
      name: 'Dogecoin',
      nameAbbr: 'DOGE',
      icon: CryptoFontIcons.doge,
      currentPrice: 'Unknown'),
];
