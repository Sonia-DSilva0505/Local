
abstract class NotificationService {
  Future<void> initialize();
  Future<void> showNotification({required String title, required String body});
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
  });
  Future<void> cancelNotification(int notificationId);
  Future<void> cancelAllNotifications();
}

