import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/screens/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = HashMap();

  void _onSubmitTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "email",
                  ),
                  validator: (value) {
                    return value != null && value.isEmpty
                        ? "Please write your email"
                        : null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData["email"] = newValue;
                    }
                  },
                ),
                Gaps.v10,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "password",
                  ),
                  validator: (value) {
                    return value != null && value.isEmpty
                        ? "Please write your wrong password"
                        : null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData["password"] = newValue;
                    }
                  },
                ),
                Gaps.v28,
                GestureDetector(
                    onTap: _onSubmitTap,
                    child: const FormButton(disabled: false))
              ],
            )),
      ),
    );
  }
}
