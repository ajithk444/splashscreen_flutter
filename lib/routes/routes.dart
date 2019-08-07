// routes for the app
import 'package:base_project/screens/home/homeScreen.dart';
import 'package:base_project/screens/map/mapScreen.dart';

final appRoutes = {
  "/Home": (_) => HomeScreen(
        title: 'Home',
        name: 'My App',
      ),
  "/Map": (_) => MapScreen(
        title: 'Live Map',
      ),
};
