import 'package:get_it/get_it.dart';
import 'package:weight_tracker/bussiness_logic/cubit/auth/auth_cubit.dart';
import 'package:weight_tracker/bussiness_logic/cubit/add_weight/add_weight_cubit.dart';

import '../bussiness_logic/cubit/all_weights/all_weights_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit());

  sl.registerFactory<AddWeightCubit>(() => AddWeightCubit());

  sl.registerFactory<AllWeightsCubit>(() => AllWeightsCubit());
}
