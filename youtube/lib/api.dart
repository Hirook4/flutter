import 'package:http/http.dart' as http; //Para usar o HTTP
import 'dart:convert'; //Para converter Json
import 'package:youtube/model/video.dart';

const chaveYoutubeApi = "AIzaSyAHkAlNHt8BGiLkFz8BB9EvqWaNF-jQhps";
const idCanal = "UCn9Erjy00mpnWeLnRqhsA1g";
const urlBase = "https://www.googleapis.com/youtube/v3";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(
        "$urlBase/search?part=snippet&type=video&maxResults=20&order=date&key=$chaveYoutubeApi&channelId=$idCanal&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      //Percorrer todos os items e o .map vai percorrer os itens transforma-los de Json para o tipo Video
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;

      // For para ver os itens
      // for (var video in videos) {
      //   print(video.titulo);
      // }
    } else {
      //O metodo pesquisar sempre devera retornar uma lista mesmo que de problema e ela seja vazia
      return [];
    }
  }
}
