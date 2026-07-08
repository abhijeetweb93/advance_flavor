enum CountryCode{IN, NP, BT}

enum Environment{Dev,Prod}

enum Flavor{devIndia,prodIndia,devNepal,prodNepal,devBhutan,prodBhutan}



class FlavourConfigs{

  static late Flavor appFlavor;

  static Environment get getEnvironment{
    switch(appFlavor){
      case Flavor.devIndia:
      case Flavor.devNepal:
      case Flavor.devBhutan:
        return Environment.Dev;
      case Flavor.prodIndia:
      case Flavor.prodNepal:
      case Flavor.prodBhutan:
        return Environment.Prod;
    }
  }

  static CountryCode get getCountryCode{
    switch(appFlavor){
      case Flavor.prodIndia:
      case Flavor.devIndia:
        return CountryCode.IN;
      case Flavor.prodNepal:
      case Flavor.devNepal:
        return CountryCode.NP;
      case Flavor.prodBhutan:
      case Flavor.devBhutan:
        return CountryCode.BT;
    }
  }

}