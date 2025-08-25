import 'package:desafio/pokemons.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
   const Home({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 38, 38, 1),
        title: const Text('PokeDex', 
          style: TextStyle(
            color: Color.fromRGBO(231, 218, 37, 1),
            fontWeight: FontWeight.bold,  
          ),),
          centerTitle: true,
        
      ),
      body: Pokemons(),
    );
  }
}

