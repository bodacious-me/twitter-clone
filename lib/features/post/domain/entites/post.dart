class Post {
  final int id;
  final int views;
  final String header;
  final String userEmail;
  final String content;
  final String timestamp;
  final String? postImageUrl;
  final int Likes;

  Post(
      {required this.Likes,
      required this.id,
      required this.userEmail,
      required this.postImageUrl,
      required this.content,
      required this.header,
      required this.views,
      required this.timestamp});
}
