import '../../../data/repositories/user/user_repository.dart';
import '../../data_result/data_result.dart';
import '../../models/bithday_data.dart';
import 'choose_user_birth_year_use_case.dart';

class GetBirthdayDataUseCaseImpl extends GetBirthdayDataUseCase {
  final UserRepository _repository;

  GetBirthdayDataUseCaseImpl(this._repository);

  @override
  Future<DataResult<BirthdayData>> getBirthdayData() async {
    return _repository.fetchAvailableYears();
  }
}
