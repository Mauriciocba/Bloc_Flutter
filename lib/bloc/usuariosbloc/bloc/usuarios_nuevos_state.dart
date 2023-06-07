part of 'usuarios_nuevos_bloc.dart';

 class UsuariosNuevosState extends Equatable {
  final List<User> usuariosLista;
  UsuariosNuevosState(this.usuariosLista/*List<User> usuariosLista*/);

 @override
  List<Object> get props => [];
}

class UsuariosNuevosInitial extends UsuariosNuevosState {
  UsuariosNuevosInitial(super.usuariosLista);
}


class UsuarioNuevo extends UsuariosNuevosState {
  //final  List<User> usuarios;

  UsuarioNuevo(super.usuariosLista); //,this.usuarios);

 /*  @override
  List<Object> get props => [/*usuarios*/];*/

}


class Listamodificada extends UsuariosNuevosState {
  Listamodificada(super.usuariosLista);
}
