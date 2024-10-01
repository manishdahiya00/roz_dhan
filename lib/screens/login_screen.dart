import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:roz_dhan/models/response/user_signup_res.dart';
import 'package:roz_dhan/screens/home_screen.dart';
import 'package:roz_dhan/services/google_login.dart';
import 'package:roz_dhan/services/shared_prefs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  void showToast(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorTheme.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login_screen.png',
                height: size.height * 0.35,
                width: size.width * 0.6,
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                'Welcome to Roz Dhan!',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Get rewards on daily check-ins, spin the wheel, and more by completing offers!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: const Color.fromARGB(255, 56, 55, 55),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        final response = await GoogleLogin.signInWithGoogle();

                        if (response != null && response.statusCode == 201) {
                          final data =
                              UserSignupRes.fromJson(jsonDecode(response.body));

                          if (data.status == 200) {
                            await SharedPrefs.saveUserData(data);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );

                            showToast("Signed In");
                          } else {
                            showToast("Oops! Something went wrong.");
                          }
                        } else {
                          showToast("Oops! Something went wrong.");
                        }

                        setState(() {
                          _isLoading = false;
                        });
                      },
                      icon: const Icon(Icons.login,
                          color: Colors.white, size: 24.0),
                      label: const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.primaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
