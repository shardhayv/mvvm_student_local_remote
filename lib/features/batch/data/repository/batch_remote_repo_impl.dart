import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/batch_entity.dart';
import '../../domain/repository/batch_repository.dart';
import '../data_source/batch_remote_data_source.dart';

final batchRemoteRepoProvider = Provider<IBatchRepository>((ref) {
  return BatchRemoteRepositoryImpl(
    batchRemoteDataSource: ref.read(batchRemoteDataSourceProvider),
  );
});

class BatchRemoteRepositoryImpl implements IBatchRepository {
  final BatchRemoteDataSource batchRemoteDataSource;

  BatchRemoteRepositoryImpl({required this.batchRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRemoteDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRemoteDataSource.getAllBatches();
  }
}
