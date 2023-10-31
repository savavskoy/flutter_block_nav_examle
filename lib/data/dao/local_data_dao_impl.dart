import '../local/model/birthday_data_local.dart';
import 'local_data_dao.dart';

class LocalDataDaoImpl extends LocalDataDao {
  @override
  Future<BirthdayDataLocal> getBirthdayData() async {
    await Future.delayed(const Duration(seconds: 2));
    return BirthdayDataLocal(years: List.generate(70, (index) => 1950 + index));
  }
}
