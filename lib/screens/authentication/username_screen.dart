import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _ussernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ussernameController.addListener(() {
      setState(() {
        _username = _ussernameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SignUp",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              "You can always chage this later.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
              controller: _ussernameController,
            ),
            Gaps.v10,
            FractionallySizedBox(
              widthFactor: 1,
              child: AnimatedContainer(
                padding: const EdgeInsets.all(Sizes.size14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size5),
                  color: _username.isEmpty
                      ? Colors.grey.shade400
                      : Theme.of(context).primaryColor,
                ),
                duration: const Duration(microseconds: 400),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
