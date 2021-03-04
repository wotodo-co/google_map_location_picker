import 'package:google_maps_flutter/google_maps_flutter.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  String address; // or road

  /// Google Maps place ID
  String placeId;

  /// Latitude/Longitude of the selected location.
  LatLng latLng;

  AddressComponents addressComponents;

  LocationResult({this.latLng, this.address, this.placeId, this.addressComponents});

  @override
  String toString() {
    return 'LocationResult{address: $address, latLng: $latLng, placeId: $placeId}';
  }
}

class AddressComponents {
  String streetNumber1;
  String streetNumber2;
  String streetName;
  String sublocality;
  String city;
  String country;
  String postalCode;

  AddressComponents(this.streetNumber1, this.streetNumber2, this.streetName,
      this.sublocality, this.city, this.country, this.postalCode);

  AddressComponents.fromJson(Map<String, dynamic> json) {
    streetNumber1 = json['streetNumber1'];
    streetNumber2 = json['streetNumder2'];
    streetName = json['streetName'];
    sublocality = json['sublocality'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postalCode'];
  }

  Map<String, String> toJson() =>
    {
      'streetNumber1': streetNumber1,
      'streetNumbder2': streetNumber2,
      'streetName': streetName,
      'sublocality': sublocality,
      'city': city,
      'country': country,
      'postalCode': postalCode
    };

  AddressComponents.fromRawJson(List<dynamic> json) {
    json.forEach((e) {
      if (e['types'].contains('premise'))
        streetNumber1 = e['long_name'];
      else if (e['types'].contains('street_number'))
        streetNumber2 = e['long_name'];
      else if (e['types'].contains('route'))
        streetName = e['long_name'];
      else if (e['types'].contains('sublocality'))
        sublocality = e['long_name'];
      else if (e['types'].contains('postal_code'))
        postalCode = e['long_name'];
      else if (e['types'].contains('administrative_area_level_1'))
        city = e['long_name'];
      else if (e['types'].contains('country'))
        country = e['long_name'];
    });
  }
}
