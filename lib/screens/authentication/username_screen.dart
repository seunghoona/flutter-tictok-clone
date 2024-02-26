import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/email_screen.dart';
import 'package:tiktok_clone/screens/authentication/widgets/form_button.dart';

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
    super.initState();
    _ussernameController.addListener(() {
      setState(() {
        _username = _ussernameController.text;
      });
    });
  }

  // StatefulWidget을 사용하는 경우 Context를 파라미터를 정의하지 않아도 된다.
  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _ussernameController.dispose();
    super.dispose();
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
            GestureDetector(
                onTap: _onNextTap,
                child: FormButton(disabled: _username.isEmpty))
          ],
        ),
      ),
    );
  }
}
