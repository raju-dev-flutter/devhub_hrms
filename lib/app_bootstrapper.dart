import 'package:devhub_hrms/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app_bloc_observer.dart';
import 'core/core.dart';
import 'feature/feature.dart';

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await PathProviderService.init();

    await setup();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    Bloc.observer = AppBlocObserver();

    Future.wait([SharedPrefs.init()]);

    runApp(
      MultiRepositoryProvider(
        providers: repositoryProvider(),
        child: MultiBlocProvider(
          providers: blocProvider(),
          child: mainAppWidget,
        ),
      ),
    );
  }

  static repositoryProvider() {
    return [
      /// [Authentication and Auth and Other] Repositories
      RepositoryProvider<AuthenticationRepository>(
          create: (context) => sl<AuthenticationRepository>()),
    ];
  }

  static blocProvider() {
    return [
      /// [Authentication and Auth] Provider
      BlocProvider<AuthenticationBloc>(
          create: (context) =>
              sl<AuthenticationBloc>()..add(const AppStarted())),

      /// [Navigation] Provider
      BlocProvider<NavigationCubit>(create: (context) => sl<NavigationCubit>()),
    ];
  }
}
