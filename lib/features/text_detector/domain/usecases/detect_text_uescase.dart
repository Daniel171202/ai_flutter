import 'package:equatable/equatable.dart';
import 'package:tmdb_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tmdb_project/core/usecase/usecase.dart';
import 'package:tmdb_project/features/text_detector/domain/repository/text_detector_repository.dart';

class DetectTextPositivity extends UseCase<int, DetectTextParams>{
  final TextDetectorRepository textDetectorRepository;
  DetectTextPositivity({required this.textDetectorRepository});

  @override
  Future<Either<Failure, int>> call({required DetectTextParams parameters}) async{
    return await textDetectorRepository.detectTextPositivity(text: parameters.text);
  }
}

class DetectTextParams extends Equatable {
  final String text;

  const DetectTextParams({required this.text});

  @override
  List<Object?> get props => [text];
}