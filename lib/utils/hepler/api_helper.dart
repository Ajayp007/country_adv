import 'dart:convert';
import '../../screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper{
  Future<List<CountryModel>?> getCountryAPI() async {
    String countryString = "https://restcountries.com/v3.1/all";

    var response = await http.get(Uri.parse(countryString));

    if (response.statusCode == 200) {
      List countryList = jsonDecode(response.body);
      List<CountryModel> c1 = countryList
          .map(
            (e) => CountryModel.mapToModel(e),
      )
          .toList();

      return c1;
    }
    return null;
  }

}