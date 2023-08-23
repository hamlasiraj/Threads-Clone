import 'dart:convert';

import 'package:get/get.dart';
import 'package:threads/View/Screen/privacy.dart';
import 'package:http/http.dart' as http;
import 'package:threads/api.dart';

class AccountController extends GetxController {
  final String userID = "64d9983c806d9885c4130ff3";
  List myProfilePostsList = [];
  List userInfo = [];

// Profile Posts
  getProfilePosts() async {
    var response =
        await http.get(Uri.parse("${APILink.getProfilePosts}/$userID"));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      myProfilePostsList.addAll(responseBody['userPosts']['user_posts']);
      userInfo.addAll(responseBody['userPosts']);
    }
  }

// delete post
  deletePost(String postID) async {
    var response =
        await http.delete(Uri.parse("${APILink.deletePost}/$postID"));

    if (response.statusCode == 200) {
      var rosponseBody = json.decode(response.body);
    }
  }

// update post
  updatePost(String postID) async {
    var response = await http.put(Uri.parse("${APILink.deletePost}/$postID"));

    if (response.statusCode == 200) {
      var rosponseBody = json.decode(response.body);
    }
  }

// get Post By ID
  getPostByID(String postID) async {
    var response = await http.put(Uri.parse("${APILink.getaPost}/$postID"));

    if (response.statusCode == 200) {
      var rosponseBody = json.decode(response.body);
    }
  }

// like and unlike
  likeUnlike(String postID) async {
    var response = await http.put(Uri.parse("${APILink.deletePost}/$postID"),
        body: {"userId": userID});

    if (response.statusCode == 200) {
      var rosponseBody = json.decode(response.body);
    }
  }

  toInsta() {}
  toMenu() {
    Get.to(const Privacy());
  }

  int index = 0;

  updateScreen(newIndex) {
    index = newIndex;
    update();
  }
}
