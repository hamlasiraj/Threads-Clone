class APILink {
  static const String serverLink = "http://localhost:3000";

  //AUTH
  static const String usersLink = "$serverLink/users";
  static const String register = "$usersLink/register";
  static const String login = "$usersLink/login";
  //USERS
  static const String updateUserData = "$usersLink/updateData";
  static const String followUser = "$usersLink/follow";
  static const String unfollowUser = "$usersLink/unfollow";
  //POSTS
  static const String postsLink = "$serverLink/posts";
  static const String getProfilePosts = "$postsLink/profilePosts";
  static const String addPost = "$postsLink/addPost";
  static const String updatePost = "$postsLink/updatePost";
  static const String getaPost = "$postsLink/getaPost";
  static const String deletePost = "$postsLink/deletePost";
  static const String likeunlike = "$postsLink/liked";
}
