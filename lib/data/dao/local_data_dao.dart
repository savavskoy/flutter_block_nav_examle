import '../local/model/birthday_data_local.dart';

abstract class LocalDataDao {
  Future<BirthdayDataLocal> getBirthdayData();
}
