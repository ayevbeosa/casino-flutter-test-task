import 'package:casino_test/core/converters/character_converter.dart';
import 'package:casino_test/features/characters/data/datasources/characters_remote_data_source.dart';
import 'package:casino_test/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:casino_test/features/characters/domain/repositories/characters_repository.dart';
import 'package:casino_test/features/characters/domain/usecases/get_characters_use_case.dart';
import 'package:casino_test/features/characters/presentation/bloc/character_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

final getIt = GetIt.instance;

void init() {
  // Data Sources
  getIt.registerLazySingleton(
    () => CharactersRemoteDataSourceImpl(client: getIt()),
  );

  // External
  getIt.registerLazySingleton<http.Client>(() => RetryClient(http.Client()));

  // Core
  getIt.registerLazySingleton<CharacterConverter>(
    () => CharacterConverterImpl(),
  );

  // Repository
  getIt.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(
      remoteDataSource: getIt(),
      characterConverter: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCharactersUseCase(getIt()));

  // Bloc
  getIt.registerFactory(() => CharacterBloc(getIt()));
}
