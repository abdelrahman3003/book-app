import 'package:book/constants.dart';
import 'package:book/core/utils/routesApp.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/features/home/data/repos/home_repo_imp.dart';
import 'package:book/features/home/presention/manager/featurebooks_Cubit/featurebooks_cubit.dart';
import 'package:book/features/home/presention/manager/newestbooks/newestbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const book());
}

class book extends StatelessWidget {
  const book({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturebooksCubit(getit.get<HomeREpoImp>())
              ..FetchFeaturBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestbooksCubit(getit.get<HomeREpoImp>())
              ..fetchnewestbooks();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: RoutesApp.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Constant.kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
