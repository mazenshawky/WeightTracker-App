import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/bussiness_logic/cubit/add_weight/add_weight_cubit.dart';
import 'package:weight_tracker/presentation/components/my_textfield.dart';

import '../../bussiness_logic/cubit/auth/auth_cubit.dart';
import '../../config/routes/app_routes.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final weightController = TextEditingController();
  final GlobalKey<FormState> _weightFormKey = GlobalKey();

  void _logOut(context) async {
    await BlocProvider.of<AuthCubit>(context).logOut();
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  void _addWeight(BuildContext context) {
    if (!_weightFormKey.currentState!.validate()) {
      return;
    } else {
      _weightFormKey.currentState!.save();
      BlocProvider.of<AddWeightCubit>(context)
          .addWeight(weight: weightController.text);
    }
  }

  void _goNext(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.weightsRoute);
  }

  Widget _buildAddWeightBloc() {
    return BlocListener<AddWeightCubit, AddWeightState>(
      listenWhen: ((previous, current) => previous != current),
      listener: (context, state) {
        if (state is AddLoading) {
          Constants.showProgressIndicator(context);
        }
        if (state is AddSuccess) {
          Navigator.pop(context);
          Constants.showSnackBar(context, message: AppStrings.successAdd);
        }
        if (state is AddErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          Constants.showSnackBar(context, message: errorMsg);
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.home),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => _logOut(context),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Form(
            key: _weightFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 350),
                MyTextField(controller: weightController),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => _addWeight(context),
                  child: const Text(AppStrings.addYourWeight),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => _goNext(context),
                  child: const Text(AppStrings.viewAllWeights),
                ),
                _buildAddWeightBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
