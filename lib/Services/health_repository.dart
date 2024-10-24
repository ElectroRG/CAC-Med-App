import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthRepository {
  void init() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();
    Health().configure();
    print('Health initialized');
  }

  Future<int?> fetchData(HealthDataType type, int value) async {
    var types = [type];

    if (value != 0 ) return value;

    await Permission.activityRecognition.request();

    // Requesting access to the data types before reading them
    bool requested = await Health().requestAuthorization(types);
    if (!requested) {
      print('Authorization not granted for the health data.');
    }

    var now = DateTime.now();

    // Fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
      types: types,
      startTime: now.subtract(Duration(days: 1)),
      endTime: now,
    );

    // Request permissions to write steps and blood glucose
    var permissions = [HealthDataAccess.READ_WRITE];
    await Health().requestAuthorization(types, permissions: permissions);

    // Write steps (optional)
    bool success = await Health().writeHealthData(
      value: 10,
      type: type,
      startTime: now.subtract(Duration(days: 1)),
      endTime: now,
      recordingMethod: RecordingMethod.manual,
    );

    // Get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await Health().getTotalStepsInInterval(midnight, now);

    return steps;
  }
}
