extension DateTimeExtension on int {
  String toHHMMSS() {
    final int hours = this ~/ (60 * 60);
    final int minutes = this ~/ 60;
    final int seconds = this % 60;

    final String hoursStr = hours.toString().padLeft(2, '0');
    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr s";
  }
}
