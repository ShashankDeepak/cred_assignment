import 'package:cred_assignment/src/models/items.dart';
import 'package:cred_assignment/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class ItemBoxGrid extends StatelessWidget {
  const ItemBoxGrid({
    super.key,
    required this.item,
  });
  final Item item;
  final gradient = const LinearGradient(
      colors: [Colors.yellow, Colors.white, Colors.yellow]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        width: 60,
        child: Column(
          children: [
            Container(
              height: 60,
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
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
