import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

part "state.dart";

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final GoogleSignIn googleSignIn = GetIt.I<GoogleSignIn>();

  Future<void> checkLogin() async {
    emit(AuthLoading());

    final user = await googleSignIn.attemptLightweightAuthentication();

    if (user != null) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
