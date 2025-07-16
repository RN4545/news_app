import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/blocs/auth_event.dart';
import 'package:news/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<SignupRequested>(_signUpRequest);
    on<LoginRequested>(_loginRequested);
  }

  Future<void> _signUpRequest(
      SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(
        AuthFailure(e.message ?? 'SignUp failed'),
      );
    } catch (e) {
      emit(const AuthFailure('Error to create user'));
    }
  }

  Future<void> _loginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Login Failed"));
    } catch (e) {
      emit(const AuthFailure('Error to Login User'));
    }
  }
}
