import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key, required this.item,
  });

  final Map<String, dynamic> item;

  void onTapItemCard () {
    Get.toNamed('/foodItemScreen', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItemCard,
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 7,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(item
                              ['imageLink']
                          .toString()),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 120,
                child: Text(
                  item['name'].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 100,
                child: Text(
                  "\$${item['price']}",
                  style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}