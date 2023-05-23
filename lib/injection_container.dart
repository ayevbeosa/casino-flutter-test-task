import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:casino_test/src/data/repository/characters_repository.dart';
import 'package:casino_test/src/data/repository/characters_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

final getIt = GetIt.instance;

void init() {
  // Use cases
  getIt.registerLazySingleton(() => GetCharactersUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(getIt()),
  );

  // Data Sources
  getIt.registerLazySingleton(
    () => CharactersRemoteDataSourceImpl(client: getIt()),
  );

  // External
  getIt.registerLazySingleton<http.Client>(() => RetryClient(http.Client()));
}
