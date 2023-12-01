import 'package:cred_assignment/src/controller/item_controller.dart';
import 'package:cred_assignment/src/models/items.dart';
import 'package:cred_assignment/src/pages/categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.item});
  final Item item;

  String formatDescription(String description) {
    if (!description.contains(".")) {
      return description;
    }
    List<String> arr = description.split(".");
    String result = "";

    for (int i = 0; i < arr.length; i++) {
      if (i == arr.length - 1) {
      } else {
        result += "${arr[i]}\n";
      }
    }
    return result;
  }

  final ItemController controller = ItemController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.1,
                width: width * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(
                        // color: Colors.red,
                        )),
                child: Image.asset(
                  item.icon,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "CRED ${item.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                    formatDescription(item.description),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Categories(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: width * 0.82,
                    height: 55,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Container(
                            height: 52,
                            width: width * 0.8,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: width * 0.8,
                          color: Colors.white,
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Go to category  "),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
