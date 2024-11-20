import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginState {
  final bool isLoading;
  final bool isLoggedIn;
  final String? error;

  LoginState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.error,
  });
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<void> login(String username, String password) async {
    emit(LoginState(isLoading: true));

    try {
      final response = await Dio().post(
        'https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password},
      );

      emit(LoginState(isLoggedIn: true));
    } catch (error) {
      emit(LoginState(error: error.toString()));
    }
  }
}
