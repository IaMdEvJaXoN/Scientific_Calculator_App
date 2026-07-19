class CalcButtonsState {
  final List<String> buttons;
  CalcButtonsState({required this.buttons});
  CalcButtonsState copyWith({List<String>? buttons}) {
    return CalcButtonsState(buttons: buttons ?? this.buttons);
  }
}
