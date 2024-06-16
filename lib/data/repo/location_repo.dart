import 'package:flutterbloc/data/model/Location.dart';
import 'package:flutterbloc/data/web_services/location_webSevices.dart';

class LocationRepository{
  final LocationWebServices locationWebServices;
  LocationRepository(this.locationWebServices);

   Future<List<Locations>> getAllLocations() async {
    final locations = await locationWebServices.getLocation();
    return locations.map((location) => Locations.fromJson(location)).toList();
  }


}