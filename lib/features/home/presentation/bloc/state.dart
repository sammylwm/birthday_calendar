part of "cubit.dart";

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BirthdayEvent> next;
  final List<BirthdayEvent> inMonth;

  HomeLoaded({required this.next, required this.inMonth});

  @override
  List<Object?> get props => [next, inMonth];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
