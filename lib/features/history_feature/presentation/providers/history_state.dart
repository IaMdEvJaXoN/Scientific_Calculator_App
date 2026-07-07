class HistoryState {
  final List<String> history;
  const HistoryState({required this.history});
  HistoryState copyWith({List<String>? history}) {
    return HistoryState(history: history ?? this.history);
  }
}
