import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/model/Location.dart';
import 'package:flutterbloc/data/repo/location_repo.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository locationRepository;
  List<Locations> locations = [];

  LocationCubit(this.locationRepository) : super(LocationInitial());

  List<Locations> getAllLocations() {

    locationRepository.getAllLocations().then((locations) {
      emit(LocationsLoaded(locations));
      this.locations = locations;
    });
    return locations;
  }

}
