import 'package:app_bloc/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'usuarios_nuevos_event.dart';
part 'usuarios_nuevos_state.dart';

class UsuariosNuevosBloc extends Bloc<UsuariosNuevosEvent, UsuariosNuevosState> {
  UsuariosNuevosBloc() : super(UsuariosNuevosInitial(const [])) {
    on<AgregarUsuario>(_agregarUsuario);
    on<EliminarUsuario>(_eliminarUsuario);
}

  void _agregarUsuario(UsuariosNuevosEvent event, Emitter<UsuariosNuevosState> emit){
      if(event is AgregarUsuario) {
        final copiaLista = List<User>.from(state.usuariosLista)..add(event.usuario);
        emit(UsuariosNuevosState(copiaLista));
        emit(UsuarioNuevo(copiaLista));
        }
  }

  void _eliminarUsuario(UsuariosNuevosEvent event, Emitter<UsuariosNuevosState> emit){
    if(event is EliminarUsuario){
       final copiaLista = List<User>.from(state.usuariosLista)..remove(event.usuario);
       emit(UsuariosNuevosState(copiaLista));
        emit(Listamodificada(copiaLista));
        }
  }


}



