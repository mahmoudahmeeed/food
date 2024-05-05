import 'package:flutter/material.dart';
import 'package:flutter_application_1/changeemail.dart';
import 'package:flutter_application_1/changepassowrd.dart';

class LoginAndSecurityScreen extends StatefulWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  State<LoginAndSecurityScreen> createState() => _LoginAndSecurityScreenState();
}

class _LoginAndSecurityScreenState extends State<LoginAndSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login and Security'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F5),
              border: Border.all(
                color: const Color(0xffE5E7EB),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Account access',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeEmailScreen(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Email address',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(''),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Change password',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(''),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              
              
              
            ],
          ),
        ]),
      ),
    );
  }
}
