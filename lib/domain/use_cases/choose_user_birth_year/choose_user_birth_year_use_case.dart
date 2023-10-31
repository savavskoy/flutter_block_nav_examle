import '../../data_result/data_result.dart';
import '../../models/bithday_data.dart';

abstract class GetBirthdayDataUseCase {
  Future<DataResult<BirthdayData>> getBirthdayData();
}

