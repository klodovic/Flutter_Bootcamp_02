import '../Model/user.dart';


class Data{
  static List<User> getALlUsers() {
    List<User> people = [
      User(name: "Maja Majić", town: "Rijeka"),
      User(name: "Pero Perić", town: "Kutina"),
      User(name: "Tea Teić", town: "Osijek"),
      User(name: "Marko Marković", town: "Zagreb"),
      User(name: "Mia Mi", town: "Valpovo"),
      User(name: "Ivica Ivić", town: "Zagreb"),
      User(name: "Ana Anić", town: "Zagreb"),
      User(name: "Petra Petrić", town: "Rijeka"),
      User(name: "Renata Končić", town: "Zagreb"),
      User(name: "Maja Blagdan", town: "Split"),
      User(name: "Ante Antovski", town: "Split"),
      User(name: "Zoran Jutrić", town: "Zadar"),
    ];
    return people;
  }
}