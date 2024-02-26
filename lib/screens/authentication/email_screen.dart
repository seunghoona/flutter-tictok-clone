import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/password_scrrent.dart';
import 'package:tiktok_clone/screens/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";
  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  ///  super.dispose 마지막에 선언하여 처리
  ///  선언을 통해 코드의 가독성을 높임
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailvalid() {
    if (_email.isEmpty) return null;

    if (!regExp.hasMatch(_email)) {
      return "이메일 형식이 아닙니다.";
    }
    return null;
  }

  _onScafffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailvalid() != null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafffoldTap,
      child: Scaffold(
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
                "Create email",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v10,
              const Text(
                "What is your Email?",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,

                /// 아직 값을 처리하지 않았을 경우 value 값을 받을 수 있다.
                // onSubmitted: ,
                decoration: InputDecoration(
                  hintText: "email",
                  /**
                   * If you add `()` the function will run immediately, if you don't add the `()` Flutter will add it for you when the event happens.  Here: onTap : _onNextTap we want Flutter to add the `()` only when the user taps.  Here errorText : _isEmailVaild() we want to do it immediatly.
                   */
                  errorText: _isEmailvalid(),
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
                controller: _emailController,
              ),
              Gaps.v10,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                      disabled: _email.isEmpty || _isEmailvalid() != null))
            ],
          ),
        ),
      ),
    );
  }
}
