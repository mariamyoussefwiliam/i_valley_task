abstract class AvailableCarsState {}

class InitAvailableCarsState extends AvailableCarsState {}

class GetAvailableCarsLoadingState extends AvailableCarsState {}

class GetAvailableCarsSuccessState extends AvailableCarsState {
  GetAvailableCarsSuccessState();
}

class GetAvailableCarsErrorState extends AvailableCarsState {
  final String error;

  GetAvailableCarsErrorState(this.error);
}
