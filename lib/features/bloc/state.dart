part of "cubit.dart";

class BirthdayState extends Equatable {
  final bool loading;

  final AuthStatus authStatus;

  final List<BirthdayEvent> next;
  final List<BirthdayEvent> inMonth;

  final Map<int, List<BirthdayEvent>> events;

  final ActionStatus addStatus;
  final ActionStatus deleteStatus;
  final ActionStatus editStatus;

  final String? error;

  const BirthdayState({
    this.loading = false,
    this.authStatus = AuthStatus.unknown,
    this.next = const [],
    this.inMonth = const [],
    this.events = const {},

    this.addStatus = ActionStatus.idle,
    this.deleteStatus = ActionStatus.idle,
    this.editStatus = ActionStatus.idle,

    this.error,
  });

  BirthdayState copyWith({
    bool? loading,
    AuthStatus? authStatus,

    List<BirthdayEvent>? next,
    List<BirthdayEvent>? inMonth,
    Map<int, List<BirthdayEvent>>? events,

    ActionStatus? addStatus,
    ActionStatus? deleteStatus,
    ActionStatus? editStatus,

    String? error,
  }) {
    return BirthdayState(
      loading: loading ?? this.loading,

      authStatus: authStatus ?? this.authStatus,

      next: next ?? this.next,
      inMonth: inMonth ?? this.inMonth,
      events: events ?? this.events,

      addStatus: addStatus ?? this.addStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      editStatus: editStatus ?? this.editStatus,

      error: error,
    );
  }

  @override
  List<Object?> get props => [
    loading,

    authStatus,

    next,
    inMonth,
    events,

    addStatus,
    deleteStatus,
    editStatus,

    error,
  ];
}

enum AuthStatus { unknown, loading, authenticated, unauthenticated }

enum ActionStatus { idle, loading, success, failure }
