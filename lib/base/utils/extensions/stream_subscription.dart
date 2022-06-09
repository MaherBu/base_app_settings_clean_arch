import 'dart:async';

extension StreamSubscreptionExt on StreamSubscription<dynamic> {
  void regist(List<StreamSubscription<dynamic>> subscriptionList) => subscriptionList.add(this);
}

extension ListOfStreamSubscreptionExt on List<StreamSubscription<dynamic>> {
  Future<void> cancel() async {
    for (final StreamSubscription<dynamic> sub in this) {
      await sub.cancel();
    }
    clear();
  }
}
