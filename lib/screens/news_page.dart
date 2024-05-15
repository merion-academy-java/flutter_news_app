import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news/dto/news_full_response.dart';
import 'package:flutter_news_app/api/news/fetch/news_fetch.dart';
import 'package:flutter_news_app/commons/colors.dart';

class NewsPage extends StatefulWidget {
  final int newsId;

  const NewsPage({super.key, required this.newsId});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<NewsFullResponse> futureNewsFullResponse;

  @override
  void initState() {
    super.initState();
    futureNewsFullResponse = fetchFullNewsById(widget.newsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: FutureBuilder<NewsFullResponse>(
          future: futureNewsFullResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.newsResponse.title,
                style: TextStyle(
                    color: ColorExtention.textMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 32),
              );
            }

            return Text(
              'News App',
              style: TextStyle(
                  color: ColorExtention.textMain,
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
            );
          },
        ),
        backgroundColor: ColorExtention.main,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: FutureBuilder<NewsFullResponse>(
          future: futureNewsFullResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final newsResponse = snapshot.data!;
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text(
                    newsResponse.newsResponse.title,
                    style: TextStyle(
                        color: ColorExtention.textMain,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  )),
                  Container(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                    '${newsResponse.userResponse.name} · ${newsResponse.userResponse.email}',
                    style: TextStyle(
                        color: ColorExtention.textSecond, fontSize: 12),
                  )),
                  Container(
                      child: Text(
                    newsResponse.newsResponse.body,
                    style:
                        TextStyle(color: ColorExtention.textMain, fontSize: 16),
                  )),
                ],
              );
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
