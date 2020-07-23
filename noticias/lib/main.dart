import 'package:flutter/material.dart';
import 'package:noticias/src/pages/tabs_page.dart';
import 'package:noticias/src/services/news_services.dart';
import 'package:noticias/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new NewsServices())],
      child: MaterialApp(
          title: 'Material App',
          theme: mitema,
          debugShowCheckedModeBanner: false,
          home: TabsPage()),
    );
  }
}
