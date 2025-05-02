
import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(double number,[int decimals = 0]){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits:decimals ,
      symbol: '',
      locale: 'en'
    ).format(number);
    return formatterNumber;
  }
  static String getDateWithDayNameAndNumber(DateTime date) {

    String dayName = DateFormat('EEEE').format(date);
    String dayNumber = DateFormat('d').format(date);
    // Capitalizar la primera letra
    String capitalized = dayName[0].toUpperCase() + dayName.substring(1);
    return '$capitalized $dayNumber';
  }
}
