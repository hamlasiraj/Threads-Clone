class SuggestedAccount {
  String? name;
  String? username;
  String? followers;
  String? profileImage;

  SuggestedAccount(
    this.followers,
    this.name,
    this.username,
    this.profileImage,
  );

  factory SuggestedAccount.formJson(Map<String, String> jsonObject) {
    return SuggestedAccount(
      jsonObject['followers'],
      jsonObject['name'],
      jsonObject['username'],
      jsonObject['profileImage'],
    );
  }
}
