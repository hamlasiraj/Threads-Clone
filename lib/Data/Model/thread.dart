class Thread {
  String? name;
  String? posted;
  String? description;
  String? image;
  String? profileImage;
  String? replies;
  String? liks;
  String? replier;
  String? replier1;
  String? replier2;
  int? likeUnlike;
  Thread(
      this.description,
      this.image,
      this.liks,
      this.name,
      this.posted,
      this.profileImage,
      this.replier,
      this.replies,
      this.replier1,
      this.replier2,
      this.likeUnlike);

  factory Thread.formJson(Map<String, dynamic> jsonObject) {
    return Thread(
      jsonObject['description'],
      jsonObject['image'],
      jsonObject['liks'],
      jsonObject['name'],
      jsonObject['posted'],
      jsonObject['profileImage'],
      jsonObject['replier'],
      jsonObject['replies'],
      jsonObject['replier1'],
      jsonObject['replier2'],
      jsonObject['likeUnlike'],
    );
  }
}
