import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(LayoutState()) {
    on<OnChangePageLayoutEvent>(_onChangePage);
  }

  _onChangePage(OnChangePageLayoutEvent event, Emitter<LayoutState> emit) {
    emit(LayoutState(index: event.index));
  }
}

abstract class LayoutEvent {}

class OnChangePageLayoutEvent extends LayoutEvent {
  final int index;
  OnChangePageLayoutEvent(this.index) : super();
}

class LayoutState {
  final int index;

  LayoutState({this.index = 0});
}
