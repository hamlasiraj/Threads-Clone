import 'package:flutter/material.dart';
import 'package:threads/Core/Constant/appcolors.dart';

import '../../Core/Constant/appimage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImage.loginImg,
            fit: BoxFit.fill,
            height: h * 0.75,
            width: w,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 78,
                width: 380,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Log In With Instagrem",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Row(
                          children: [
                            const Text(
                              "sirox.dev",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(
                              "assets/img2.png",
                              height: 13,
                              width: 13,
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset("assets/img3.png")
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Switch Account",
              style: TextStyle(color: Colors.black38),
            ),
          )
        ],
      ),
    );
  }
}
