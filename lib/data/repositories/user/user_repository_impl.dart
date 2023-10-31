import 'package:flutter_block_nav_examle/data/repositories/user/user_repository.dart';

import '../../../domain/data_result/data_result.dart';
import '../../../domain/models/bithday_data.dart';
import '../../dao/local_data_dao.dart';
import '../../local/model/birthday_data_local.dart';
import '../mappers/birthday_local_to_birthday_data_mapper.dart';
import '../safe_local_call.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalDataDao _localDataDao;

  UserRepositoryImpl(this._localDataDao);

  @override
  Future<DataResult<BirthdayData>> fetchAvailableYears() async {
    return safeLocalCall(
        processLocalResult: (data) => _processLocalBirthdayData(data),
        localCall: () => _localDataDao.getBirthdayData());
  }

  DataResult<BirthdayData> _processLocalBirthdayData(
      BirthdayDataLocal localData) {
    return SuccessResult(
        data: BirthdayLocalToBirthdayDataMapper.fromLocal(localData));
  }
}
