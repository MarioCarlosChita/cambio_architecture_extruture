// podes usar o (quicktype.io) para converteres os teus json

import 'dart:convert';

ResultCoin resultCoinFromJson(String str) => ResultCoin.fromJson(json.decode(str));

String resultCoinToJson(ResultCoin data) => json.encode(data.toJson());

class ResultCoin {
    ResultCoin({
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  });

  String by;
  bool validKey;
  Results results;
  double executionTime;
  bool fromCache;

  factory ResultCoin.fromJson(Map<String, dynamic> json) => ResultCoin(
    by: json["by"],
    validKey: json["valid_key"],
    results: Results.fromJson(json["results"]),
    executionTime: json["execution_time"],
    fromCache: json["from_cache"],
  );

  Map<String, dynamic> toJson() => {
    "by": by,
    "valid_key": validKey,
    "results": results.toJson(),
    "execution_time": executionTime,
    "from_cache": fromCache,
  };
}

class Results {
  Results({
    this.currencies,
    this.stocks,
    this.availableSources,
    this.bitcoin,
    this.taxes,
  });

  Currencies currencies;
  Stocks stocks;
  List<String> availableSources;
  Bitcoin bitcoin;
  List<Tax> taxes;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    currencies: Currencies.fromJson(json["currencies"]),
    stocks: Stocks.fromJson(json["stocks"]),
    availableSources: List<String>.from(json["available_sources"].map((x) => x)),
    bitcoin: Bitcoin.fromJson(json["bitcoin"]),
    taxes: List<Tax>.from(json["taxes"].map((x) => Tax.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currencies": currencies.toJson(),
    "stocks": stocks.toJson(),
    "available_sources": List<dynamic>.from(availableSources.map((x) => x)),
    "bitcoin": bitcoin.toJson(),
    "taxes": List<dynamic>.from(taxes.map((x) => x.toJson())),
  };
}

class Bitcoin {
  Bitcoin({
    this.blockchainInfo,
    this.coinbase,
    this.bitstamp,
    this.foxbit,
    this.mercadobitcoin,
  });

  Bitstamp blockchainInfo;
  Coinbase coinbase;
  Bitstamp bitstamp;
  Coinbase foxbit;
  Bitstamp mercadobitcoin;

  factory Bitcoin.fromJson(Map<String, dynamic> json) => Bitcoin(
    blockchainInfo: Bitstamp.fromJson(json["blockchain_info"]),
    coinbase: Coinbase.fromJson(json["coinbase"]),
    bitstamp: Bitstamp.fromJson(json["bitstamp"]),
    foxbit: Coinbase.fromJson(json["foxbit"]),
    mercadobitcoin: Bitstamp.fromJson(json["mercadobitcoin"]),
  );

  Map<String, dynamic> toJson() => {
    "blockchain_info": blockchainInfo.toJson(),
    "coinbase": coinbase.toJson(),
    "bitstamp": bitstamp.toJson(),
    "foxbit": foxbit.toJson(),
    "mercadobitcoin": mercadobitcoin.toJson(),
  };
}

class Bitstamp {
  Bitstamp({
    this.name,
    this.format,
    this.last,
    this.buy,
    this.sell,
    this.variation,
  });

  String name;
  List<String> format;
  double last;
  double buy;
  double sell;
  double variation;

  factory Bitstamp.fromJson(Map<String, dynamic> json) => Bitstamp(
    name: json["name"],
    format: List<String>.from(json["format"].map((x) => x)),
    last: json["last"].toDouble(),
    buy: json["buy"].toDouble(),
    sell: json["sell"].toDouble(),
    variation: json["variation"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "format": List<dynamic>.from(format.map((x) => x)),
    "last": last,
    "buy": buy,
    "sell": sell,
    "variation": variation,
  };
}

class Coinbase {
  Coinbase({
    this.name,
    this.format,
    this.last,
    this.variation,
  });

  String name;
  List<String> format;
  double last;
  double variation;

  factory Coinbase.fromJson(Map<String, dynamic> json) => Coinbase(
    name: json["name"],
    format: List<String>.from(json["format"].map((x) => x)),
    last: json["last"].toDouble(),
    variation: json["variation"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "format": List<dynamic>.from(format.map((x) => x)),
    "last": last,
    "variation": variation,
  };
}

class Currencies {
  Currencies({
    this.source,
    this.usd,
    this.eur,
    this.gbp,
    this.ars,
    this.cad,
    this.aud,
    this.jpy,
    this.cny,
    this.btc,
  });

  String source;
  Ars usd;
  Ars eur;
  Ars gbp;
  Ars ars;
  Ars cad;
  Ars aud;
  Ars jpy;
  Ars cny;
  Ars btc;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    source: json["source"],
    usd: Ars.fromJson(json["USD"]),
    eur: Ars.fromJson(json["EUR"]),
    gbp: Ars.fromJson(json["GBP"]),
    ars: Ars.fromJson(json["ARS"]),
    cad: Ars.fromJson(json["CAD"]),
    aud: Ars.fromJson(json["AUD"]),
    jpy: Ars.fromJson(json["JPY"]),
    cny: Ars.fromJson(json["CNY"]),
    btc: Ars.fromJson(json["BTC"]),
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "USD": usd.toJson(),
    "EUR": eur.toJson(),
    "GBP": gbp.toJson(),
    "ARS": ars.toJson(),
    "CAD": cad.toJson(),
    "AUD": aud.toJson(),
    "JPY": jpy.toJson(),
    "CNY": cny.toJson(),
    "BTC": btc.toJson(),
  };
}

class Ars {
  Ars({
    this.name,
    this.buy,
    this.sell,
    this.variation,
  });

  String name;
  double buy;
  double sell;
  double variation;

  factory Ars.fromJson(Map<String, dynamic> json) => Ars(
    name: json["name"],
    buy: json["buy"].toDouble(),
    sell: json["sell"] == null ? null : json["sell"].toDouble(),
    variation: json["variation"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "buy": buy,
    "sell": sell == null ? null : sell,
    "variation": variation,
  };
}

class Stocks {
  Stocks({
    this.ibovespa,
    this.ifix,
    this.nasdaq,
    this.dowjones,
    this.cac,
    this.nikkei,
  });

  Cac ibovespa;
  Cac ifix;
  Cac nasdaq;
  Cac dowjones;
  Cac cac;
  Cac nikkei;

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
    ibovespa: Cac.fromJson(json["IBOVESPA"]),
    ifix: Cac.fromJson(json["IFIX"]),
    nasdaq: Cac.fromJson(json["NASDAQ"]),
    dowjones: Cac.fromJson(json["DOWJONES"]),
    cac: Cac.fromJson(json["CAC"]),
    nikkei: Cac.fromJson(json["NIKKEI"]),
  );

  Map<String, dynamic> toJson() => {
    "IBOVESPA": ibovespa.toJson(),
    "IFIX": ifix.toJson(),
    "NASDAQ": nasdaq.toJson(),
    "DOWJONES": dowjones.toJson(),
    "CAC": cac.toJson(),
    "NIKKEI": nikkei.toJson(),
  };
}

class Cac {
  Cac({
    this.name,
    this.location,
    this.points,
    this.variation,
  });

  String name;
  String location;
  double points;
  double variation;

  factory Cac.fromJson(Map<String, dynamic> json) => Cac(
    name: json["name"],
    location: json["location"],
    points: json["points"].toDouble(),
    variation: json["variation"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location,
    "points": points,
    "variation": variation,
  };
}

class Tax {
  Tax({
    this.date,
    this.cdi,
    this.selic,
    this.dailyFactor,
    this.selicDaily,
    this.cdiDaily,
  });

  DateTime date;
  double cdi;
  double selic;
  double dailyFactor;
  double selicDaily;
  double cdiDaily;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    date: DateTime.parse(json["date"]),
    cdi: json["cdi"].toDouble(),
    selic: json["selic"].toDouble(),
    dailyFactor: json["daily_factor"].toDouble(),
    selicDaily: json["selic_daily"].toDouble(),
    cdiDaily: json["cdi_daily"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "cdi": cdi,
    "selic": selic,
    "daily_factor": dailyFactor,
    "selic_daily": selicDaily,
    "cdi_daily": cdiDaily,
  };
}
