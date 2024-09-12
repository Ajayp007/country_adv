import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper helper = SharedHelper._();
  SharedHelper._();

  Future<void> setCountryImg(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('country', l1);
  }

  Future<List<String>?> getCountryImg() async {
    List<String>? countryListImg = [];

    SharedPreferences shr = await SharedPreferences.getInstance();

    countryListImg = shr.getStringList('country');
    return countryListImg;
  }

  Future<void> setCountryName(List<String> l2) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('country1', l2);
  }

  Future<List<String>?> getCountryName() async {
    List<String>? countryListName = [];

    SharedPreferences shr = await SharedPreferences.getInstance();

    countryListName = shr.getStringList('country1');
    return countryListName;
  }
}
