import 'package:flutter/material.dart';
import 'package:new_flutter_app/CountryListModel/CarouselScreen.dart';
import 'package:new_flutter_app/CountryListModel/CountryListView.dart';

void main() => runApp(const MyApp());

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          title: "Track Covid'19",
          theme: ThemeData(
              appBarTheme: AppBarTheme(
            color: Colors.purple,
          )),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CountryListView(),
            '/Country': (ctx) => const CarouselScreen(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Track Covid'19"))),
      body: CountryListView(),
    );
  }
}
