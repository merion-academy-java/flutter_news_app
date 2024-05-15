import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/all_news.dart';
import 'package:flutter_news_app/screens/news_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MaterialApp.router(
        title: 'News App',
        routerConfig: router(),
      ),
    );
  }

  GoRouter router() {
    return GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
              path: '/',
              builder: (context, state) => const AllNews(),
              routes: [
                GoRoute(path: "news/:id",
                    builder: (context, state) =>  NewsPage(newsId: int.parse(state.pathParameters['id']!)))
              ]
          )
        ]
    );
  }
}

