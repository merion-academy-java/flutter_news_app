import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news/dto/news_full_response.dart';
import 'package:flutter_news_app/api/news/dto/news_response.dart';
import 'package:flutter_news_app/api/news/fetch/news_fetch.dart';
import 'package:flutter_news_app/commons/colors.dart';
import 'package:flutter_news_app/components/news_item_component.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  late Future<List<NewsFullResponse>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchFullNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(
            color: ColorExtention.textMain,
            fontWeight: FontWeight.w600,
            fontSize: 32
          ),
        ),
        backgroundColor: ColorExtention.main,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: FutureBuilder<List<NewsFullResponse>>(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final news = snapshot.data![index];
                    return NewsItemComponent(newsFullResponse: news);
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
