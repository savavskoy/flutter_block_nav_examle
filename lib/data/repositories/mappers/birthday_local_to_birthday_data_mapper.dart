import '../../../domain/models/bithday_data.dart';
import '../../local/model/birthday_data_local.dart';

class BirthdayLocalToBirthdayDataMapper {
  static BirthdayData fromLocal(BirthdayDataLocal local) {
    return BirthdayData(years: local.years);
  }
}
