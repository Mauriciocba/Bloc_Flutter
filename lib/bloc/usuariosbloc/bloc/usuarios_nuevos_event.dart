part of 'usuarios_nuevos_bloc.dart';

@immutable
abstract class UsuariosNuevosEvent extends Equatable {

   @override
  List<Object> get props => [];
}

class AgregarUsuario extends UsuariosNuevosEvent {

  final User usuario;

  AgregarUsuario(this.usuario);

   @override
  List<Object> get props => [usuario];
}

class CargandoUsuario extends UsuariosNuevosEvent {}

class EliminarUsuario extends UsuariosNuevosEvent {

  final User usuario;

  EliminarUsuario(this.usuario);

   @override
  List<Object> get props => [usuario];
}