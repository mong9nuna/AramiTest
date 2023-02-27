String TimeCount(String time) {
  DateTime? newDate = DateTime.tryParse(time);

  DateTime nowDate = DateTime.now().add(const Duration(hours: 9));

  int differenceTime = nowDate.difference(newDate!).inHours;
  if (differenceTime >= 24) {
    return newDate.toString().split(' ')[0];
  } else {
    if(differenceTime == 0){
      return '방금 전';
    }else{
      return '$differenceTime시간 전';
    }
  }
}