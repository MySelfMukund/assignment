import 'package:assignment_task/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('Unit test name change', () {
    //write code to test the unit test
    //initialise controller
    final homeController = Get.put(HomeController());
    //checking for onInitial value
    expect(homeController.myName.value, 'Mukund');

    //call the method below method to change the name to middle name value
    homeController.changeToMiddleName();
    expect(homeController.myName.value, 'murari');

    //call the below method to change the name value to the last name value
    homeController.changeToLastName();
    expect(homeController.myName.value, 'pradhan');
  });
}
