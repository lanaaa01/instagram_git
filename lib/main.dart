import 'package:flutter/material.dart';
import 'home_page.dart'; // Certifique-se de que este caminho está correto
import 'search_page.dart'; // Certifique-se de que este caminho está correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        appBarTheme: AppBarTheme(
          elevation: 1,
          color: Colors.white,
          iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> paginas = [
    HomePage(),
    SearchPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.home,
                color: currentPage == 0
                    ? Color.fromRGBO(203, 73, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              color: currentPage == 1
                  ? Color.fromRGBO(203, 73, 101, 1)
                  : Color.fromRGBO(40, 40, 40, 1),
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.ondemand_video),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            Spacer(),
          ],
        ),
      ),
      body: paginas[currentPage],
    );
  }
}
