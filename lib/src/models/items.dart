class Item {
  String id = "";
  String name = "";
  String description = "";
  String icon = "";
  bool isNew;
  bool isCoupon;
  Item(
      {required this.id,
      required this.name,
      required this.description,
      this.icon = "",
      this.isNew = false,
      this.isCoupon = false});

  factory Item.fromMap(
    Map<String, dynamic> map,
    String icon, {
    bool isNew = false,
    bool isCoupon = false,
  }) {
    return Item(
      id: map['id'] as String,
      name: map['display_data']['name'] as String,
      description: map['display_data']['description'] as String,
      icon: icon,
      isCoupon: isCoupon,
      isNew: isNew,
    );
  }
}
