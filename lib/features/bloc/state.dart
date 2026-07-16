part of "cubit.dart";

class BirthdayState extends Equatable {
  final bool loading;
  final bool adding;

  final AuthStatus authStatus;

  final List<BirthdayEvent> next;
  final List<BirthdayEvent> inMonth;

  final Map<int, List<BirthdayEvent>> events;

  final bool added;

  final String? error;

  const BirthdayState({
    this.loading = false,
    this.adding = false,
    this.authStatus = AuthStatus.unknown,
    this.next = const [],
    this.inMonth = const [],
    this.events = const {},
    this.added = false,
    this.error,
  });

  BirthdayState copyWith({
    bool? loading,
    bool? adding,
    AuthStatus? authStatus,
    List<BirthdayEvent>? next,
    List<BirthdayEvent>? inMonth,
    Map<int, List<BirthdayEvent>>? events,
    bool? added,
    String? error,
  }) {
    return BirthdayState(
      loading: loading ?? this.loading,
      adding: adding ?? this.adding,
      authStatus: authStatus ?? this.authStatus,
      next: next ?? this.next,
      inMonth: inMonth ?? this.inMonth,
      events: events ?? this.events,
      added: added ?? this.added,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    loading,
    adding,
    authStatus,
    next,
    inMonth,
    events,
    added,
    error,
  ];
}

enum AuthStatus { unknown, loading, authenticated, unauthenticated }
