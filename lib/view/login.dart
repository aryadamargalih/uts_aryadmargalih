import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final AuthController controller = AuthController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isValid = false;

  void _checkFormValid() {
    setState(() {
      _isValid = keyForm.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text('Login'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: keyForm,
        onChanged: _checkFormValid,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(labelText: "Username"),
                      validator: controller.validateUsername,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(labelText: "Password"),
                      validator: controller.validatePassword,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed:
                          _isValid
                              ? () {
                                if (keyForm.currentState!.validate()) {
                                  final username = usernameController.text;
                                  final password = passwordController.text;

                                  bool success = controller.login(
                                    username,
                                    password,
                                  );

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Login Berhasil"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.pushNamed(
                                      context,
                                      '/dashboard',
                                      arguments: username,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Periksa kembali input Anda",
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              }
                              : null,
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
