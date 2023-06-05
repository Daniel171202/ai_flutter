import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '/core/ML/image_classifier/classifier_quant.dart';
import '/core/ML/text_classifier/classifier.dart';
import '/features/image_detector/data/data_sources/image_detector_local_data_source.dart';
import '/features/image_detector/data/repository/image_detector_repository_impl.dart';
import '/features/image_detector/domain/repository/image_detector_repository.dart';
import '/features/image_detector/domain/usecases/detect_image_uescase.dart';
import '/features/image_detector/presentation/bloc/image_detector_bloc.dart';
import '/features/text_detector/data/data_sources/text_detector_local_data_source.dart';
import '/features/text_detector/data/repository/text_detector_repository_impl.dart';
import '/features/text_detector/domain/repository/text_detector_repository.dart';
import '/features/text_detector/domain/usecases/detect_text_uescase.dart';
import '/features/text_detector/presentation/bloc/text_detector_bloc.dart';

import '../network/api_constant.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => TextDetectorBloc(detectTextPositivity: sl()));
    sl.registerFactory(() => ImageDetectorBloc(detectImage: sl()));

    /// Use Cases
    sl.registerLazySingleton(() => DetectTextPositivity(textDetectorRepository: sl()));
    
    sl.registerLazySingleton(() => DetectImage(imageDetectorRepository: sl()));
    

    /// Repository
    sl.registerLazySingleton<TextDetectorRepository>(() => TextDetectorRepositoryImpl(textDetectorLocalDataSource: sl()));
    
    sl.registerLazySingleton<ImageDetectorRepository>(() => ImageDetectorRepositoryImpl(imageDetectorLocalDataSource: sl()));
    

    /// Data Source
    sl.registerLazySingleton<TextDetectorLocalDataSource>(() => TextDetectorLocalDataSourceImpl(classifier: sl()));
    
    sl.registerLazySingleton<ImageDetectorLocalDataSource>(() => ImageDetectorLocalDataSourceImpl(classifier: sl()));
    

    // --------------------------------------- core
    sl.registerLazySingleton<Classifier>( ()=> Classifier());

    sl.registerLazySingleton<ClassifierQuant>( ()=> ClassifierQuant());

    sl.registerLazySingleton<Dio>( ()=> Dio(BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
      ),));
  
  }
}