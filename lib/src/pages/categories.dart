import 'package:cred_assignment/src/controller/item_controller.dart';
import 'package:cred_assignment/src/models/items.dart';
import 'package:cred_assignment/src/pages/home_page.dart';
import 'package:cred_assignment/src/widgets/item_box_grid.dart';
import 'package:cred_assignment/src/widgets/item_box_list.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isListView = false;
  Alignment switchAlignment = Alignment.centerLeft;
  Icon listIcon = const Icon(
    Icons.menu,
    size: 14,
  );

  Icon gridIcon = const Icon(
    Icons.grid_view_sharp,
    size: 14,
  );

  Icon currentSwitchIcon = const Icon(
    Icons.grid_view_sharp,
    size: 14,
  );

  double h = 100;

  List<Item> item = [];

  ItemController controller = ItemController();
  Future<void> getItemList() async {
    if (ItemController.itemList.isEmpty) {
      ItemController.itemList = await controller.getItemList();
    }
    item = ItemController.itemList;
  }

  late final Future getItems;
  double w = 150;
  @override
  void initState() {
    getItems = getItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(item: controller.placeholderItem),
            ),
            (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: getItems,
            builder: (context, snapshot) {
              if (ItemController.itemList.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.2,
                        ),
                        const Text(
                          "explore",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "CRED",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    isListView = !isListView;
                                    if (switchAlignment ==
                                        Alignment.centerLeft) {
                                      switchAlignment = Alignment.centerRight;
                                    } else {
                                      switchAlignment = Alignment.centerLeft;
                                    }
                                    if (isListView) {
                                      h = 350;
                                      currentSwitchIcon = listIcon;

                                      w = 500;
                                    } else {
                                      currentSwitchIcon = gridIcon;
                                      h = 100;
                                      w = 100;
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: AnimatedAlign(
                                      alignment: switchAlignment,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 25,
                                          width: 22,
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: currentSwitchIcon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "MONEY",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                            height: isListView ? h - 80 : h,
                            width: width,
                            child: Stack(
                              children: [
                                isListView
                                    ? ItemBoxList(
                                        item: item[0],
                                      )
                                    : ItemBoxGrid(
                                        item: item[0],
                                      ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 90,
                                  top: isListView ? 90 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[1],
                                        )
                                      : ItemBoxGrid(
                                          item: item[1],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 180,
                                  top: isListView ? 180 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[2],
                                        )
                                      : ItemBoxGrid(
                                          item: item[2],
                                        ),
                                ),
                              ],
                            )),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "BENEFITS",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                            height: h + 100,
                            width: width,
                            child: Stack(
                              children: [
                                isListView
                                    ? ItemBoxList(
                                        item: item[3],
                                      )
                                    : ItemBoxGrid(
                                        item: item[3],
                                      ),
                                // isListView
                                //     ? ItemBoxList(
                                //         item: item[4],
                                //       )
                                //     : ItemBoxGrid(
                                //         item: item[4],
                                //       ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 90,
                                  top: isListView ? 90 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[4],
                                        )
                                      : ItemBoxGrid(
                                          item: item[4],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 180,
                                  top: isListView ? 180 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[5],
                                        )
                                      : ItemBoxGrid(
                                          item: item[5],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 260,
                                  top: isListView ? 260 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[6],
                                        )
                                      : ItemBoxGrid(
                                          item: item[6],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 0,
                                  top: isListView ? 340 : 100,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[7],
                                        )
                                      : ItemBoxGrid(
                                          item: item[7],
                                        ),
                                ),
                              ],
                            )),
                        const Text(
                          "BILLS",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                            height: h,
                            width: width,
                            child: Stack(
                              children: [
                                isListView
                                    ? ItemBoxList(
                                        item: item[8],
                                      )
                                    : ItemBoxGrid(
                                        item: item[8],
                                      ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 90,
                                  top: isListView ? 90 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[9],
                                        )
                                      : ItemBoxGrid(
                                          item: item[9],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 180,
                                  top: isListView ? 180 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[10],
                                        )
                                      : ItemBoxGrid(
                                          item: item[10],
                                        ),
                                ),
                                AnimatedPositioned(
                                  left: isListView ? 0 : 260,
                                  top: isListView ? 260 : 0,
                                  duration: const Duration(milliseconds: 100),
                                  child: isListView
                                      ? ItemBoxList(
                                          item: item[11],
                                        )
                                      : ItemBoxGrid(
                                          item: item[11],
                                        ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
