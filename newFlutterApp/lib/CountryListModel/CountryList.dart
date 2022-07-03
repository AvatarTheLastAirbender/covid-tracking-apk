import 'dart:convert';

import 'package:new_flutter_app/CountryListModel/country.dart';

CountryList countryFromJson(String response) =>
    CountryList.fromJson(json.decode(response)["data"]);

String CountryToJson(List<CountryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryList {
  List<Country> countryList;

  CountryList({
    required this.countryList,
  });

  Map<String, dynamic> toJson() => {
        "countryList": countryList,
      };

  factory CountryList.fromJson(Map<String, dynamic> json) {
    return CountryList(
      countryList: json.entries
          .map((entry) => Country(
              countryId: entry.key, countryName: entry.value["country"]))
          .toList(),
    );
  }
}
