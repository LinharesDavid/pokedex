import 'package:archi_app/core/models/MarsRoverPhotos.dart';
import 'package:archi_app/core/repositories/NasaBaseRepository.dart';
import 'package:http/http.dart' as http;

abstract class MarsRoverPhotosRepository extends NasaBaseRepository {
  String get url => "$baseUrl/mars-photos/api/v1/rovers/curiosity/photos?";
  Future<MarsRoverPhotos> get(String apiKey, {int sol, String camera, int page});
}

class MarsRoverPhotosRepositoryImpl extends MarsRoverPhotosRepository {
  @override
  Future<MarsRoverPhotos> get(String apiKey, {int sol, String camera, int page}) async {
    Map<String, dynamic> params = {"api_key": apiKey};
    if (sol != null) params.putIfAbsent("sol", () => sol);
    if (camera != null) params.putIfAbsent("camera", () => camera);
    if (page != null) params.putIfAbsent("page", () => page);

    var url = this.url;
    params.forEach((key, value) => url += "$key=$value&");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return MarsRoverPhotos.marsRoverPhotosFromJson(response.body);
    }

    throw Exception("MarsRoverPhotosRepositoryImpl get() failed");
  }

}