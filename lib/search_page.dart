import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filtrar os nomes com base na consulta de pesquisa
    List<String> filteredNames = profileNames
        .where((name) => name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Atualiza a consulta de pesquisa
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Color.fromRGBO(220, 220, 220, 1),
                filled: true,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.person_add),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (filteredNames.isEmpty) {
                  return ListTile(
                    title: Text("No results found"),
                  );
                }
                int profileIndex = profileNames.indexOf(filteredNames[index]);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(profileImages[profileIndex]),
                  ),
                  title: Text(filteredNames[index]),
                  onTap: () {
                    // Ação ao tocar no nome do perfil
                    // Você pode navegar para o perfil do usuário aqui
                  },
                );
              },
              childCount: filteredNames.length,
            ),
          ),
        ],
      ),
    );
  }
}
