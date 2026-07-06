part of "cubit.dart";

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Event>? events;

  HomeLoaded({required this.events});
  @override
  List<Object?> get props => [events];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
