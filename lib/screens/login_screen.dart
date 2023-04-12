import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagraph/constants/constants.dart';
import 'package:instagraph/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final containerWidth = constraints.maxWidth - 80 > 340
              ? 340.0
              : constraints.maxWidth - 80;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (constraints.maxWidth > 900)
                      SizedBox(
                        width: 460,
                        height: 580,
                        child: Image.asset(
                          'assets/Screenshot 1402-01-11 at 12.44.31.png',
                        ),
                      ),
                    if (constraints.maxWidth > 900) wGap20,
                    Column(
                      children: [
                        Container(
                          width: containerWidth,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 2 / 3.4 * containerWidth,
                                  child: Image.asset(
                                      'assets/Screenshot 1402-01-11 at 13.24.39.png'),
                                ),
                                hGap20,
                                CustomTextField(
                                  width: 2 / 3.4 * containerWidth,
                                  controller: emailController,
                                  isPassword: false,
                                  hint: 'phone number, username, or email',
                                  textInputType: TextInputType.none,
                                ),
                                hGap8,
                                CustomTextField(
                                  width: 2 / 3.4 * containerWidth,
                                  controller: passwordController,
                                  isPassword: true,
                                  hint: "Password",
                                  textInputType: TextInputType.none,
                                ),
                                hGap16,
                                SizedBox(
                                  width: 2 / 3 * containerWidth,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Log in'),
                                  ),
                                ),
                                hGap16,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      width: 2 / 5 * (containerWidth) - 30,
                                      height: 1,
                                    ),
                                    wGap8,
                                    const Text(
                                      'OR',
                                    ),
                                    wGap8,
                                    Container(
                                      color: Colors.black,
                                      width: 2 / 5 * (containerWidth) - 30,
                                      height: 1,
                                    ),
                                  ],
                                ),
                                hGap28,
                                TextButton.icon(
                                  style: TextButton.styleFrom(
                                    maximumSize:
                                        Size(containerWidth * 2 / 3, 1000),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.facebook),
                                  label: const Text(
                                    'Log in with Facebook',
                                  ),
                                ),
                                hGap20,
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot password?'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        hGap8,
                        Container(
                          width: containerWidth,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account? ",
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Sign up'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        hGap16,
                        if (kIsWeb) const Text("Get the app."),
                        hGap16,
                        if (kIsWeb)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: containerWidth * 1 / 3,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'assets/google-play-badge.png'),
                                ),
                              ),
                              wGap8,
                              SizedBox(
                                width: containerWidth * 1 / 3,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'assets/5a902db97f96951c82922874.png'),
                                ),
                              ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
