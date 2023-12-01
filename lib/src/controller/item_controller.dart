import 'dart:convert';

import 'package:cred_assignment/src/models/items.dart';
import 'package:http/http.dart' as http;

class ItemController {
  static List<Item> itemList = [];
  Uri uri = Uri.parse("https://api.mocklets.com/p68785/skuSections");

  Item placeholderItem = Item(
    description: "This is a placeholder",
    id: "placeholder",
    name: "Mint Placeholder",
    icon: "assets/mint.png",
    isCoupon: false,
    isNew: false,
  );

  List<String> iconPath = [
    "assets/mint.png",
    "assets/bank_accounts.png",
    "assets/scan_n_pay.png",
    "assets/utility_n_bill_pay.png",
    "assets/house_rent.png",
    "assets/education_fees_test.png",
    "assets/rewards.png",
    "assets/refer_n_earn.png",
    "assets/coins.png",
    "assets/vounchers.png",
    "assets/brand_offers.png",
  ];

  Future<List<Item>> getItemList() async {
    List<Item> item = [];
    int index = 0;
    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    for (Map<String, dynamic> map in json["data"]) {
      for (Map<String, dynamic> items in map["section_properties"]["items"]) {
        if (items["id"] == "scan_n_pay") {
          item.add(Item.fromMap(items, iconPath[index], isNew: true));
        }
        if (items["id"] == "bank_accounts") {
          item.add(Item.fromMap(items, iconPath[index], isCoupon: true));
        } else {
          item.add(Item.fromMap(items, iconPath[index]));
        }
        index++;
      }
    }

    //credit_card_bills is not available in the given api call, that is why added manually
    Item creditCard = Item(
      description: "",
      id: "credit_card_bills",
      name: "credit card and bills",
      icon: "assets/credit_card_bills.png",
    );
    item.add(creditCard);
    return item;
  }
}
