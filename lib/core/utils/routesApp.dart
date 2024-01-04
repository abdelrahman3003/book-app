import 'package:book/core/utils/api_services.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/features/home/data/models/book_model/book_model.dart';
import 'package:book/features/home/data/repos/home_repo_imp.dart';
import 'package:book/features/home/presention/manager/similarbooksCubit/similarbooks_cubit.dart';
import 'package:book/features/home/presention/view/home.dart';
import 'package:book/features/home/presention/view/home_details.dart';
import 'package:book/features/search/data/repo/search_repo_imp.dart';
import 'package:book/features/search/presentation/manager/serachbooksCubit/searchbook_cubit.dart';
import 'package:book/features/search/presentation/view/search.dart';
import 'package:book/features/splash/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class RoutesApp {
  static const kHomeDetails = "/HomeDetails";
  static const kHome = "/Home";
  static const kSearch = "/Search";
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splash(),
    ),
    GoRoute(
      path: kHome,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: kHomeDetails,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarbooksCubit(getit.get<HomeREpoImp>()),
        child: HomeDetails(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearch,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchbookCubit(SearchRepoImp(ApiService(Dio()))),
        child: Search(),
      ),
    )
  ]);
}
