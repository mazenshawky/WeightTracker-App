import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/bussiness_logic/cubit/auth/auth_cubit.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';

import '../../config/routes/app_routes.dart';
import '../../core/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildLoginBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is Loading) {
          Constants.showProgressIndicator(context);
        }
        if (state is Success) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        }
        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          Constants.showSnackBar(context, message: errorMsg);
        }
      },
      child: Container(),
    );
  }

  void _signIn(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).signIn();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.login),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => _signIn(context),
                child: const Text(AppStrings.login),
              ),
              const SizedBox(height: 150),
              _buildLoginBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
