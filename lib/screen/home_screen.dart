import 'package:boppotask/model/api_model.dart';
import 'package:boppotask/model/category_model.dart';
import 'package:boppotask/screen/news_details.dart';
import 'package:boppotask/services/api_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];
  List<Newsmodel> updateNews = <Newsmodel>[];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    updateNews = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "News App",
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    //categories

                    /*   SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            categoryName: categories[index].categoryName,
                            imgUrl: categories[index].imgUrl,
                          );
                        },
                      ),
                    ), */

                    //News List

                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: updateNews.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                            description: updateNews[index].description,
                            url: updateNews[index].url,
                            imgUrl: updateNews[index].urlToImage,
                            //    time: updateNews[index].publishedAt,
                            title: updateNews[index].title);
                      },
                    )
                  ],
                ),
              ));
  }
}

class CategoryCard extends StatelessWidget {
  final imgUrl, categoryName;
  const CategoryCard({this.imgUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 241, 219, 227),
                radius: 30,
                child: Image.asset(imgUrl)),
            const SizedBox(
              height: 10,
            ),
            Text(categoryName)
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imgUrl, title, url, description;
  // final DateTime time;

  const NewsCard(
      {required this.imgUrl,
      required this.description,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(detailUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            imageURl(imgUrl),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    // textAlign: TextAlign.justify,
                    // overflow: TextOverflow.fade,
                    // maxLines: 2,
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    maxLines: 4,
                    //  overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageURl(String url) {
  try {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const CircularProgressIndicator(),
        ),
      ),
    );
  } catch (e) {
    return const Icon(Icons.error);
  }
}
