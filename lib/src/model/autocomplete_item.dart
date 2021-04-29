import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Autocomplete results item returned from Google will be deserialized
/// into this model.
class AutoCompleteItem {
  /// The id of the place. This helps to fetch the lat,lng of the place.
  String id;

  /// The text (name of place) displayed in the autocomplete suggestions list.
  String text;

  LatLng latLng;

  @override
  String toString() {
    return 'AutoCompleteItem{id: $id, text: $text}';
  }
}
