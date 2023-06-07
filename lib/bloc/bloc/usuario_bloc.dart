import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super( UsuarioInitial()) {
    on<ActivarUsuario>((event, emit) {
      emit(UsuarioActivo(event.usuario));
    });

    on<AgregarUsuario>((event, emit) {
      //final List<User> modificarLista = List.from(state.lista)..add(event.usuario);
      //emit(state.copyWith(lista: modificarLista));
      state.lista.add(event.usuario);
      emit(UsuarioState(lista: state.lista, existeUsuario: false, usuario: event.usuario ));
      print('esta es la lista ${state.lista}${event.usuario}');
    });

  }
}
