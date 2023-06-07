import 'package:app_bloc/bloc/usuariosbloc/bloc/usuarios_nuevos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class Pagina1Page extends StatelessWidget {
  final String nombre;
  final int edad;
  final String profesion;

  const Pagina1Page(
      {super.key,
      required this.nombre,
      required this.edad,
      required this.profesion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Usuarios"),
          actions: [
            
            badges.Badge(
              badgeContent:
                  BlocBuilder<UsuariosNuevosBloc, UsuariosNuevosState>(
                builder: (context, state) {
                  int contador = state.usuariosLista.length;
                  return Text('$contador');
                },
              ),
              position: badges.BadgePosition.center(),
              child: const Icon(Icons.calendar_today_rounded),
            )
          ],
        ),
        body: BlocBuilder<UsuariosNuevosBloc, UsuariosNuevosState>(
            builder: (context, state) {
            if (state.usuariosLista.isEmpty) {
            return const Center(
              child: Text("LISTA VACIA"),
            
            );
          } else {
            return ListView.builder(
                itemCount: state.usuariosLista.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.usuariosLista[index].nombre),
                    subtitle: Text(
                        '${state.usuariosLista[index].edad} \n Profesion ${state.usuariosLista[index].profesiones}'),
                    leading: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmación'),
                              content: const Text(
                                  '¿Estás seguro de que deseas realizar esta acción?'),
                              actions: <Widget>[
                                FloatingActionButton(
                                  child: const Icon(Icons.cancel),
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        false); // Cierra el cuadro de diálogo y retorna false
                                  },
                                ),
                                FloatingActionButton(
                                  child: const Icon(Icons.check),
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        true); // Cierra el cuadro de diálogo y retorna true
                                  },
                                ),
                              ],
                            );
                          },
                        ).then((value) {
                          if (value != null && value) {
                            
                            final cartBloc =
                            BlocProvider.of<UsuariosNuevosBloc>(context);
                            cartBloc.add(EliminarUsuario(state.usuariosLista[index]));
                            
                          } else {}
                        });
                      },
                      icon: const Icon(Icons.supervised_user_circle_outlined),
                    ),
                  );
                });
          }
        }),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.accessibility_new),
            onPressed: () => Navigator.pushNamed(context, 'pagina2')));
  }
}
 
   