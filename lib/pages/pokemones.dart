import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    
  
    return Pokemon(
      name: json['name'],
      imageUrl: '' ?? '',
    );
  }
}

class PokemonScreen extends StatefulWidget {
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<Pokemon> pokemonList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon'),
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return CustomListTile(
            imageUrl: pokemonList[index].imageUrl,
            name: pokemonList[index].name,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchPokemonData,
        child: Icon(Icons.refresh),
      ),
    );
  }

  Future<void> fetchPokemonData() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var results = jsonResponse['results'];
      
      setState(() {
        pokemonList = results
            .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
            .toList();
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

 
}

class CustomListTile extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CustomListTile({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          SizedBox(
            width: 56, 
            child: imageUrl.isNotEmpty
                ? Image.network(imageUrl)
                : const Placeholder(),
          
          ),
          const SizedBox(width: 16), 
          Text(name),
        ],
      ),
    );
  }
}