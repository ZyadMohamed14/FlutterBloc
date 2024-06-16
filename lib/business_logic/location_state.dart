part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {


}

final class LocationsLoaded extends LocationState{
  final List<Locations>locations;
  LocationsLoaded(this.locations);
}
