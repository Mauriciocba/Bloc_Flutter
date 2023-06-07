part of 'usuario_bloc.dart';

@immutable
class UsuarioState {
  final bool existeUsuario;
  final List<User> lista;
  final User? usuario;

  const UsuarioState({
    required this.lista,
    this.existeUsuario = false,
    this.usuario,
  });

  /*UsuarioState copyWith({
    bool? existeUsuario,
    List<User>? lista,
    User? usuario,
  }); */
}

class UsuarioInitial extends UsuarioState {
  UsuarioInitial() : super(lista: []);

  @override
  UsuarioInitial copyWith({
    bool? existeUsuario,
    List<User>? lista,
    User? usuario,
  }) {
    return UsuarioInitial();
  }
}

class UsuarioActivo extends UsuarioState {
  final User nuevoUsuario;

  UsuarioActivo(this.nuevoUsuario)
      : super(existeUsuario: true, lista: [nuevoUsuario], usuario: nuevoUsuario);

  @override
  UsuarioActivo copyWith({
    bool? existeUsuario,
    List<User>? lista,
    User? usuario,
  }) {
    return UsuarioActivo(nuevoUsuario);
  }
}

class UsuarioInactivo extends UsuarioState {
  final bool inactivo;

  UsuarioInactivo({
    this.inactivo = true,
    bool existeUsuario = false,
    User? usuario,
  }) : super(lista: [], existeUsuario: existeUsuario, usuario: usuario);

  @override
  UsuarioInactivo copyWith({
    bool? existeUsuario,
    List<User>? lista,
    User? usuario,
  }) {
    return UsuarioInactivo(
      inactivo: inactivo,
      existeUsuario: existeUsuario ?? this.existeUsuario,
      usuario: usuario ?? this.usuario,
    );
  }
}