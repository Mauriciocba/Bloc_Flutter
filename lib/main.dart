import 'package:app_bloc/bloc/usuariosbloc/bloc/usuarios_nuevos_bloc.dart';
import 'package:app_bloc/pages/formulario.dart';
import 'package:app_bloc/pages/pagina1_page.dart';
import 'package:app_bloc/pages/pagina2_page.dart';
import 'package:app_bloc/pages/pokemones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp( const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsuariosNuevosBloc() )
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'formulario',
        routes: {
          'formulario': ( _ ) => formularioScreen(),
          'pagina1': ( _ ) =>  const Pagina1Page(nombre: "",edad: 0,profesion: ""),
          'pagina2': ( _ ) =>  const Pagina2Page(),
          'poke': ( _ ) =>   PokemonScreen()
        },
      ),
    );
  }
}