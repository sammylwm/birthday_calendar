import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "state.dart";

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final GoogleSignIn googleSignIn = GetIt.I<GoogleSignIn>();

  Future<void> login() async {
    emit(LoginLoading());

    try {
      final user = await googleSignIn.authenticate();
      if (user.authentication.idToken != null) {
        emit(LoginAuthenticated());
      } else {
        emit(LoginUnauthenticated());
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
