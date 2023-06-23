import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/batch_entity.dart';
import '../model/batch_hive_model.dart';

// Dependency Injection using Riverpod
final batchLocalDataSourceProvider = Provider<BatchLocalDataSource>((ref) {
  return BatchLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      batchHiveModel: ref.read(batchHiveModelProvider));
});

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      // Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.toHiveModel(batch);
      // Add to Hive
      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      // Get all batches from Hive
      final batches = await hiveService.getAllBatches();
      // Convert Hive Object to Entity
      final batchEntities = batchHiveModel.toEntityList(batches);
      return Right(batchEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
