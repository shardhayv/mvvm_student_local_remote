import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/batch_remote_repo_impl.dart';
import '../entity/batch_entity.dart';

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  // Return Local repository implementation

  // return ref.read(batchLocalRepoProvider);
  // For internet connectivity we will check later

  return ref.read(batchRemoteRepoProvider);
});

abstract class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
