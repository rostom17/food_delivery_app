import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key, required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
    );
  }
}