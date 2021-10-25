import 'package:flutter/material.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0))),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.benesse-cms.jp/pet-cat/item/image/normal/3c969d48-15c5-4dcd-b2e2-a41c460db456.jpg?w=576&h=576&resize_type=cover&resize_mode=force&p=true'),
                    fit: BoxFit.contain)),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "ねこの",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {
                            print("tap");
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white38,
                              size: 22,
                            ),
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("price"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "450\$",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Sub Total"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "450.0000\$",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.purple),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Ships Free"),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: () {
                            print("tap");
                          },
                          child: Container(
                            child: Icon(
                              Icons.minimize_outlined,
                              color: Colors.white38,
                              size: 22,
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
