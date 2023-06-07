import 'package:app_bloc/bloc/usuariosbloc/bloc/usuarios_nuevos_bloc.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../models/user.dart';

class formularioScreen extends StatelessWidget {

final TextEditingController _nombreController = TextEditingController();
final TextEditingController _edadController = TextEditingController();
final TextEditingController _profesionController = TextEditingController();

  formularioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
        body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                controller: _nombreController, ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Edad'),
                controller: _edadController,
                keyboardType: TextInputType.number,
                ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Profesión'),
                controller: _profesionController
               ),
              const SizedBox(height: 16.0),
              MaterialButton(
                onPressed: () {

                  String nombre = _nombreController.text;
                  int edad = int.parse(_edadController.text);
                  String profesion = _profesionController.text;

                  
                  print('Nombre: $nombre');
                  print('Edad: $edad');
                  print('Profesión: $profesion');

                   final nuevoUsuario = User(
                    nombre: nombre,
                    edad: edad,
                    profesiones: profesion
                  );

                  final itemsBloc = context.read<UsuariosNuevosBloc>();
                  final items = itemsBloc.state.props;
                 
                  itemsBloc.add(AgregarUsuario(nuevoUsuario));
                  Navigator.pushNamed(context, "pagina1");
                },
                child: const Text('Guardar'),
              ),
            ],
             ),
        ),
      ),
    );
  }
}