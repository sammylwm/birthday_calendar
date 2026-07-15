part of "cubit.dart";

sealed class AllState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllLoading extends AllState {}

class AllLoaded extends AllState {
  final Map<int, List<BirthdayEvent>> events;
  AllLoaded(this.events);

  @override
  List<Object?> get props => [events];
}

class AllEmpty extends AllState {}

class AllError extends AllState {
  final String message;
  AllError(this.message);

  @override
  List<Object?> get props => [message];
}
