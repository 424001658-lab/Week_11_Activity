import 'dart:async';

mixin Logger {
  void logAction(String message) {
    print('[LOG] ${DateTime.now()}: $message');
  }
}

abstract class Maintainable {
  void performMaintenance();
}

class Vehicle {
  String brand;
  int speed;

  Vehicle(this.brand, this.speed);

  void startEngine() {
    print('The $brand engine starts running.');
  }

  void displayInfo() {
    print('Brand: $brand | Speed: $speed km/h');
  }

  Future<String> runDiagnostics() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Diagnostics Complete: All systems operational for $brand.';
  }
}

class Car extends Vehicle implements Maintainable {
  int numberOfDoors;

  Car(String brand, int speed, this.numberOfDoors) : super(brand, speed);

  @override
  void startEngine() {
    print('The $brand car engine purrs smoothly.');
  }

  @override
  void performMaintenance() {
    print('Performing oil change and tire rotation for the $brand car.');
  }
}

class ElectricScooter extends Vehicle implements Maintainable {
  int batteryPercentage;

  ElectricScooter(String brand, int speed, this.batteryPercentage)
      : super(brand, speed);

  @override
  void startEngine() {
    print('The $brand electric scooter powers on silently with a beep!');
  }

  @override
  void performMaintenance() {
    print('Checking battery health and brake pads for the $brand scooter.');
  }
}

class ServiceCenter with Logger {
  String locationName;

  ServiceCenter(this.locationName);

  void processVehicle(Vehicle vehicle) {
    logAction('Receiving ${vehicle.brand} at $locationName.');
    vehicle.startEngine();
  }
}

void main() async {
  print('=== PC16 WEEK 11: ASYNCHRONOUS DART PROGRAM ===\n');

  Car myCar = Car('Toyota', 120, 4);
  ElectricScooter myScooter = ElectricScooter('Xiaomi', 25, 85);

  List<Vehicle> fleet = [myCar, myScooter];

  print('--- Displaying Fleet Info & Starting Engines ---');
  for (var vehicle in fleet) {
    vehicle.displayInfo();
    vehicle.startEngine();
    print('');
  }

  print('--- Interface Contract Execution ---');
  List<Maintainable> maintenanceList = [myCar, myScooter];
  for (var item in maintenanceList) {
    item.performMaintenance();
  }

  print('\n--- Mixin Demonstration ---');
  ServiceCenter center = ServiceCenter('Central Auto Hub');
  center.processVehicle(myCar);
  center.processVehicle(myScooter);

  print('\n--- WEEK 11: ASYNC / FUTURE DEMONSTRATION ---');

  print('[STATUS]: Initiating diagnostic scan for ${myCar.brand}...');
  print('[NON-BLOCKING PROOF]: This message prints immediately while diagnostics run in the background!');

  String carDiagnosticResult = await myCar.runDiagnostics();
  print('[RESULT]: $carDiagnosticResult');

  print('\n[STATUS]: Initiating diagnostic scan for ${myScooter.brand}...');
  String scooterDiagnosticResult = await myScooter.runDiagnostics();
  print('[RESULT]: $scooterDiagnosticResult');

  print('\n=== PROGRAM EXECUTED SUCCESSFULLY ===');
}