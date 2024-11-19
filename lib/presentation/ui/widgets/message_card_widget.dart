
import 'package:flutter/material.dart';

class MessageCardWidget extends StatelessWidget {
  const MessageCardWidget({
    super.key, required this.msg,
  });

  final Map<String, dynamic> msg;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: NetworkImage(msg['image'].toString()),
                    fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg['name'].toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium,
              ),
              const SizedBox(height: 8,),
              Text(
                msg['message'].toString().length > 20 ? msg['message'].toString().substring(0,20) + "..." : msg['message'].toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
