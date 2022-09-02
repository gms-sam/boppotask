class Newsmodel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  //DateTime publishedAt;

  Newsmodel(
      {required this.author,
      required this.content,
      required this.description,
   //   required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage});
}
