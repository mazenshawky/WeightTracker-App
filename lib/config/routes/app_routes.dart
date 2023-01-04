import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/bussiness_logic/cubit/auth/auth_cubit.dart';
import 'package:weight_tracker/bussiness_logic/cubit/add_weight/add_weight_cubit.dart';
import 'package:weight_tracker/bussiness_logic/cubit/all_weights/all_weights_cubit.dart';
import 'package:weight_tracker/presentation/screens/home_screen.dart';
import 'package:weight_tracker/presentation/screens/login_screen.dart';
import 'package:weight_tracker/presentation/screens/all_weights_screen.dart';

import '../../app/injection_container.dart' as di;
import '../../core/utils/app_strings.dart';

class Routes {
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String weightsRoute = '/weights';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthCubit>.value(
            value: di.sl<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>.value(
                value: di.sl<AuthCubit>(),
              ),
              BlocProvider<AddWeightCubit>(
                create: (context) => di.sl<AddWeightCubit>(),
              ),
            ],
            child: HomeScreen(),
          ),
        );

      case Routes.weightsRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AllWeightsCubit>(
            create: (context) => di.sl<AllWeightsCubit>(),
            child: AllWeightsScreen(),
          ),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
