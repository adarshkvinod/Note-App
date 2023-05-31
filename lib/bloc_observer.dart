import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log("$event");
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("$change");
    super.onChange(bloc, change);
  }
}
