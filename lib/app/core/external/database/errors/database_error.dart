import '../../../helpers/errors/failure.dart';

class DatabaseError extends Failure {
  DatabaseError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
