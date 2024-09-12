class CountryModel {
  List? capital = [];
  List? latlng = [];
  List? continents = [];
  String? region, subregion;
  dynamic area;
  bool? independent;
  NameModel? nameModel;
  FlagsModel? flagsModel;

  CountryModel(
      {this.capital,
        this.latlng,
        this.independent,
        this.continents,
        this.region,
        this.subregion,
        this.area,
        this.nameModel,
        this.flagsModel});

  factory CountryModel.mapToModel(Map m1) {
    return CountryModel(
        independent: m1['independent'],
        region: m1['region'],
        area: m1['area'],
        subregion: m1['subregion'],
        capital: m1['capital'],
        continents: m1['continents'],
        latlng: m1['latlng'],
        flagsModel: FlagsModel.mapToModel(m1['flags']),
        nameModel: NameModel.mapToModel(m1['name']));
  }
}

class NameModel {
  String? common, official;

  NameModel({this.common, this.official});

  factory NameModel.mapToModel(Map m1) {
    return NameModel(common: m1['common'], official: m1['official']);
  }
}

class FlagsModel {
  String? png;

  FlagsModel({this.png});

  factory FlagsModel.mapToModel(Map m1) {
    return FlagsModel(png: m1['png']);
  }
}