class CurrencyModel {
  Currency? usd;
  Currency? eur;
  Currency? gbp;
  Currency? btc;
  Currency? eth;
  Currency? ga;
  Currency? c;
  Currency? gag;
  Currency? xu100;
  List<Currency>? currencyList;

  CurrencyModel(
      {this.usd,
      this.eur,
      this.gbp,
      this.btc,
      this.eth,
      this.ga,
      this.c,
      this.gag,
      this.xu100});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    usd = json['USD'] != null ? Currency.fromJson(json['USD'], "Dolar") : null;
    eur = json['EUR'] != null ? Currency.fromJson(json['EUR'], "Euro") : null;
    gbp = json['GBP'] != null ? Currency.fromJson(json['GBP'], "Pound") : null;
    btc = json['BTC'] != null ? Currency.fromJson(json['BTC'], "BTC") : null;
    eth = json['ETH'] != null ? Currency.fromJson(json['ETH'], "ETH") : null;
    ga =
        json['GA'] != null ? Currency.fromJson(json['GA'], "Gram Altın") : null;
    c = json['C'] != null
        ? Currency.fromJson(json['C'], "Cumhuriyet Altını")
        : null;
    gag = json['GAG'] != null
        ? Currency.fromJson(json['GAG'], "Gram Gümüş")
        : null;
    xu100 = json['XU100'] != null
        ? Currency.fromJson(json['XU100'], "BIST 100")
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usd != null) {
      data['USD'] = usd!.toJson();
    }
    if (eur != null) {
      data['EUR'] = eur!.toJson();
    }
    if (gbp != null) {
      data['GBP'] = gbp!.toJson();
    }
    if (btc != null) {
      data['BTC'] = btc!.toJson();
    }
    if (eth != null) {
      data['ETH'] = eth!.toJson();
    }
    if (ga != null) {
      data['GA'] = ga!.toJson();
    }
    if (c != null) {
      data['C'] = c!.toJson();
    }
    if (gag != null) {
      data['GAG'] = gag!.toJson();
    }
    if (xu100 != null) {
      data['XU100'] = xu100!.toJson();
    }
    return data;
  }
}

class Currency {
  String? isim;
  String? satis;
  String? alis;
  double? degisim;
  bool? degisimYonu;

  Currency({this.satis, this.alis, this.degisim});

  Currency.fromJson(Map<String, dynamic> json, name) {
    isim = name;
    satis = json['satis'];
    alis = json['alis'];
    degisim = double.parse(json['degisim']);
    degisimYonu = degisim! >= 0 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['satis'] = satis;
    data['alis'] = alis;
    data['degisim'] = degisim;
    return data;
  }
}
