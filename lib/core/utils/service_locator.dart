import 'package:book/core/utils/api_Services.dart';
import 'package:book/features/home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));

  getit.registerSingleton<HomeREpoImp>(HomeREpoImp(
    getit.get<ApiService>(),
  ));
  // getit.registerSingleton(SearchRepoImp(getit.get<ApiService>()));
}
