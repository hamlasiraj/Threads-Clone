import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Core/Constant/appcolors.dart';
import '../View/Widget/positionedstick.dart';
import '../api.dart';

class WriteController extends GetxController {
  TextEditingController desc = TextEditingController();
  String userID = "64d9983c806d9885c4130ff3";

  // add Post
  addPost(String description, String img) async {
    var response = await http.post(Uri.parse(APILink.addPost),
        body: {"username": userID, "desc": description, "img": img});

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
    }
  }

  newThred(context) {
    double h = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: h * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New thread",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ]),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColor.smallText,
                    ),
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/p3.jpg"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("sirox.dev",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                TextFormField(
                                  controller: desc,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Start a thread...",
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    border: InputBorder.none,
                                  ),
                                ),
                                RotationTransition(
                                  turns: const AlwaysStoppedAnimation(50 / 360),
                                  child: InkWell(
                                      child: Icon(
                                    size: 25,
                                    Icons.attach_file,
                                    color: AppColor.smallText,
                                  )),
                                ),
                                const SizedBox(height: 30)
                              ],
                            ),
                          )
                        ],
                      ),
                      const Positioned(
                          top: 40,
                          bottom: 20,
                          left: 14,
                          child: PositionedStick()),
                      const Positioned(
                          bottom: 0,
                          left: 7.7,
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/p3.jpg"),
                            ),
                          ))
                    ]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Any One Can Reply",
                        style: Theme.of(context).textTheme.bodyMedium),
                    InkWell(
                      onTap: () {
                        addPost(desc.text, "");
                        desc.clear();
                      },
                      child: Text("Post",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.blue)),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    desc.dispose();
    super.dispose();
  }
}
