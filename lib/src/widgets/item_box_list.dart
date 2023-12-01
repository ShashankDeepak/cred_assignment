import 'package:cred_assignment/src/models/items.dart';
import 'package:cred_assignment/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class ItemBoxList extends StatelessWidget {
  const ItemBoxList({
    super.key,
    required this.item,
  });
  final Item item;
  final gradient = const LinearGradient(
      colors: [Colors.yellow, Colors.white, Colors.yellow]);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              item: item,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(167, 35, 26, 23),
                  color: Color.fromARGB(255, 15, 12, 10)),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      item.icon,
                      height: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: item.isCoupon
                        ? const Icon(
                            Icons.discount_outlined,
                            color: Colors.red,
                            size: 12,
                          )
                        : const SizedBox.shrink(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: item.isNew
                        ? ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => gradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: const Text(
                              "New",
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(color: Colors.white24, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
