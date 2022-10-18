import 'dart:convert';

import 'package:currency_app/models/currency_model.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String url = "https://api.genelpara.com/embed/altin.json";

  Future<List<Currency>?> fetchCurrency() async {
    var res = await http.get(Uri.parse(url));
    List<Currency> currencies = [];
    if (res.statusCode == 200) {
      var jsonBody = CurrencyModel.fromJson(jsonDecode(res.body));
      currencies.add(jsonBody.usd!);
      currencies.add(jsonBody.eur!);
      currencies.add(jsonBody.gbp!);
      currencies.add(jsonBody.ga!);
      currencies.add(jsonBody.gag!);
      currencies.add(jsonBody.c!);
      currencies.add(jsonBody.btc!);
      currencies.add(jsonBody.eth!);
      currencies.add(jsonBody.xu100!);

      return currencies;
    } else {
      //print("Error Code: " + res.statusCode.toString());
    }
    return null;
  }
}
