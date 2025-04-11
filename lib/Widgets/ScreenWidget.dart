import 'package:flutter/material.dart';
class ScreenWidget extends StatelessWidget {
   ScreenWidget({super.key ,required this.name,

    required this.image,
     required this.email,});
  String name,  image , email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar( radius: 30,
          backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
         // Text(discreption ,  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(email ,  style: const TextStyle(fontWeight: FontWeight.bold)),

        ],
      ),
      ],
      )
    );
  }
}
