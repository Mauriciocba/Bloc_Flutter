import 'package:app_bloc/pages/formulario.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: const Text('Formulario', style: TextStyle( color: Colors.white,fontSize:30 ) ),
              color: Colors.blue,
              onPressed: () {
                
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>  formularioScreen()),);
              }
            ),

            MaterialButton(
              child: const Text('Ver lista', style: TextStyle( color: Colors.white,fontSize:30 ) ),
              color: Colors.blue,
              onPressed: () {
                
                   Navigator.pushNamed(context,'pagina1');
              }
            ),

             MaterialButton(
              child: const Text('Pokemones', style: TextStyle( color: Colors.white,fontSize:30 ) ),
              color: Colors.blue,
              onPressed: () {
                
                   Navigator.pushNamed(context,'poke');
              }
            ),
          ],
        )
     ),
   );
  }
}