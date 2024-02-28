import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$count",
            style: const TextStyle(fontSize: 48),
          ),
          GestureDetector(
            onTap: () => {
              setState(() {
                count += 1;
              })
            },
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}
