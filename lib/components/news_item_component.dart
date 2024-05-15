import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news/dto/news_full_response.dart';
import 'package:flutter_news_app/api/news/dto/news_response.dart';
import 'package:flutter_news_app/commons/colors.dart';
import 'package:go_router/go_router.dart';

class NewsItemComponent extends StatelessWidget {
  final NewsFullResponse newsFullResponse;

  const NewsItemComponent({super.key, required this.newsFullResponse});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push('/news/${newsFullResponse.newsResponse.id}');
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 4, top: 12),
              child: Text(
                newsFullResponse.newsResponse.title,
                style: TextStyle(
                    color: ColorExtention.textMain,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                '${newsFullResponse.userResponse.name} · ${newsFullResponse.userResponse.email}',
                style: TextStyle(
                  color: ColorExtention.textSecond,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ));
  }
}
