import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_app/bloc/flash_bloc/flash_state.dart';

class FlashCubit extends Cubit<FlashState>{
  FlashCubit() : super(FlashState(
    isFlashTurnedOn: false,
  ),);

  void changeFlashState(){
    emit(
      FlashState(isFlashTurnedOn: !state.isFlashTurnedOn),
    );
  }
}
