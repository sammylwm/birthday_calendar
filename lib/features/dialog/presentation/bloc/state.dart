part of "cubit.dart";

sealed class AddState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddInitial extends AddState {}

class AddLoading extends AddState {}

class AddLoaded extends AddState {}

class AddError extends AddState {
  final String message;

  AddError(this.message);
  @override
  List<Object?> get props => [message];
}
