part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivarUsuario extends UsuarioEvent{
  final User usuario;
  ActivarUsuario(this.usuario);
}

class AgregarUsuario extends UsuarioEvent {
  final User usuario;
  AgregarUsuario(this.usuario);
}