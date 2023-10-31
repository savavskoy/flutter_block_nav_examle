import '../../../domain/data_result/data_result.dart';
import '../../../domain/models/bithday_data.dart';

abstract class UserRepository {
  Future<DataResult<BirthdayData>> fetchAvailableYears();
}
