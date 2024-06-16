import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/business_logic/location_cubit.dart';
import 'package:flutterbloc/constans/colors.dart';
import 'package:flutterbloc/data/model/Location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<Locations>getAllLocations  =[];
  @override
  void initState() {
    super.initState();
    getAllLocations= BlocProvider.of<LocationCubit>(context).getAllLocations();
  }
  Widget buildBlocWidget() {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationsLoaded) {
          getAllLocations = state.locations;
          print('$getAllLocations[0]');
          return buildLoadedListWidget();
        } else {
          return showProgressIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    if (getAllLocations.isEmpty) {
      return Center(
        child: Text('No locations found'),
      );
    } else {
      return ListView.builder(
        itemCount: getAllLocations.length,
        itemBuilder: (context, index) {
          final location = getAllLocations[index];
          return Card(
            child: ListTile(
              title: Text(location.name),
              subtitle: Text('Type: ${location.type}, Dimension: ${location.dimension}'),
              onTap: () {
                // Navigate to location details if needed
              },
            ),
          );
        },
      );
    }
  }
  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildBlocWidget(),
      ),
    );
  }


}
