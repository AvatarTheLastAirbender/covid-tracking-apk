import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_flutter_app/ApiEndPoints/Result.dart';
import 'package:new_flutter_app/CountryListModel/CountryList.dart';

class ApiServices {
  Future<Result> getAllCountries() async {
    try {
      var url = Uri.parse("https://api.first.org/data/v1/countries");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Result<CountryList>.success(countryFromJson(response.body));
      }
    } catch (e) {}
    return Result.error("Something Went Wrong!");
  }
}
