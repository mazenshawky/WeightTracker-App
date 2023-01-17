import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:weight_tracker/bussiness_logic/cubit/all_weights/all_weights_cubit.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/core/utils/constants.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/presentation/components/my_textfield.dart';

import '../../core/utils/app_strings.dart';

class AllWeightsScreen extends StatelessWidget {
  AllWeightsScreen({super.key});

  final newWeightController = TextEditingController();

  final GlobalKey<FormState> _newWeightFormKey = GlobalKey();

  Widget form(BuildContext context, {required String docId}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Form(
        key: _newWeightFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(controller: newWeightController),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _editWeight(
                context,
                docId: docId,
                newWeight: newWeightController.text,
              ),
              child: const Text(AppStrings.addNewWeight),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context, BuildContext ctx,
      {required String docId}) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (_) => form(context, docId: docId),
    );
  }

  void _deleteWeight(BuildContext context, {required String docId}) {
    BlocProvider.of<AllWeightsCubit>(context).deleteWeight(docId: docId);
    Constants.showSnackBar(context, message: AppStrings.successDelete);
  }

  void _editWeight(BuildContext context,
      {required String docId, required String newWeight}) {
    if (!_newWeightFormKey.currentState!.validate()) {
      return;
    } else {
      _newWeightFormKey.currentState!.save();
      BlocProvider.of<AllWeightsCubit>(context)
          .editWeight(docId: docId, newWeight: newWeight);
      Navigator.of(context).pop();
      Constants.showSnackBar(context, message: AppStrings.successEdit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allWeights),
      ),
      body: FirestoreListView<Weight>(
        query: BlocProvider.of<AllWeightsCubit>(context).viewWeights(),
        pageSize: 5,
        itemBuilder: (context, doc) {
          final weightModel = doc.data();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) =>
                        showBottomSheet(context, ctx, docId: doc.id),
                    icon: Icons.edit,
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
                  SlidableAction(
                    onPressed: (context) =>
                        _deleteWeight(context, docId: doc.id),
                    icon: Icons.delete,
                    backgroundColor: AppColors.deleteColor,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(weightModel.weight),
                tileColor: AppColors.kPrimaryLightColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
