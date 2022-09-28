import 'package:coronavirus_statistics/bloc/cubit/app_cubit.dart';
import 'package:coronavirus_statistics/bloc/cubit/states.dart';
import 'package:coronavirus_statistics/presentation/widgets/cases_in_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CoronavirusStatisticsStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return state is GetGlobalDataLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CasesInDetails(list: cubit.globalList!);
      },
      listener: (context, state) {},
    );
  }
}
