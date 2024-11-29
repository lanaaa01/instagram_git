import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/choquei.jpeg",
    "images/1.jpg",
    "images/2.jpeg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
  ];

  List<String> profileNames = [
    "Choquei",
    "Datena",
    "Pablo Marçal",
    "Chatabata",
    "Lulinha",
    "Bolsomito",
  ];

  List<String> posts = [
    "images/post1.jpeg",
    "images/post2.jpeg",
    "images/post3.jpeg",
    "images/post4.jpeg",
    "images/5.jpg",
  ];

  List<String> comments = [
    "Datena dando uma cadeirada no Pablo Marçal ❤️",
    "Você está na minha mira 😍",
    "Quando lembro dela...",
    "Toma Pablo Marcelo!",
    "Meu lindo pra vcs! 😂",
  ];

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/instagram_title.png",
          height: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // STORY
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(profileImages.length, (index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(profileImages[index]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            profileNames[index],
                            style: TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Divider(),
              Column(
                children: List.generate(posts.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEADER POST
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(profileImages[index]),
                            ),
                          ),
                          Text(profileNames[index]),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // IMAGE POST
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            posts[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // FOOTER POST
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.label_outlined),
                            onPressed: () {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Curtido por "),
                                  TextSpan(
                                    text: "${profileNames[index]}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: " e outros", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Comentário: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: comments[index]),
                                ],
                              ),
                            ),
                            Text(
                              "Ver todos os comentários",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
