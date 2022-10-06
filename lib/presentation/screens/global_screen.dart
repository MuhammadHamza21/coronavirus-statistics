import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/cases_in_details.dart';
import 'package:coronavirus_statistics/presentation/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        if (state is GetGlobalDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetGlobalDataSucssesState ||
            cubit.globalData != null) {
          return CasesInDetails(global: cubit.globalData!);
        } else if (state is GetGlobalDataErrorState) {
          return const ErrorMessageWidget();
        }
        return const Center(
          child: Text(
            'Unexpected Error, Please try again later .',
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
