import 'package:country_adv/screen/home/model/home_model.dart';
import 'package:country_adv/utils/hepler/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/hepler/api_helper.dart';

class HomeProvider with ChangeNotifier {
  List<CountryModel>? countryModelList = [];

  List<String> likeCountryImg = [];
  List<String> likeCountryName = [];

  Future<void> getCountry() async {
    ApiHelper apiHelper = ApiHelper();

    countryModelList = await apiHelper.getCountryAPI();
    notifyListeners();
  }

  Future<void> setLikeCountry(String name1, String cImg) async {
    List<String>? name = await SharedHelper.helper.getCountryName();
    List<String>? img = await SharedHelper.helper.getCountryImg();
    if (name != null && img != null) {
      name.add(name1);
      img.add(cImg);
      SharedHelper.helper.setCountryName(name);
      SharedHelper.helper.setCountryImg(img);
    } else {
      SharedHelper.helper.setCountryName([name1]);
      SharedHelper.helper.setCountryImg([cImg]);
    }
    SharedHelper.helper.getCountryName();
    SharedHelper.helper.getCountryImg();

    notifyListeners();
  }

  Future<void> getCountryData() async {
    var list2 = await SharedHelper.helper.getCountryName();
    var list = await SharedHelper.helper.getCountryImg();
    if (list2 != null && list != null) {
      likeCountryImg = list;
      likeCountryName = list2;
      notifyListeners();
    }
  }

  Future<void> deleteLikeCountry(int index) async {
    likeCountryName.removeAt(index);
    likeCountryImg.removeAt(index);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    notifyListeners();
  }
}
