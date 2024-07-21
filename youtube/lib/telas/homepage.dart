import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/telas/video_player_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Homepage extends StatefulWidget {
  final String pesquisa;
  const Homepage(this.pesquisa, {super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  YoutubePlayerController? ytController;

  @override
  /*
  ordem de metodos
  1 - InitState metodo chamado quando carrega stf Widget é carregada 
  2 - didChangeDependencies usado quando carrega dados de dependencias (chamado quando troca de tela por exemplo)
  3 - build constroi as telas (chamado quando troca de tela por exemplo)
  4 - dispose libera memoria alocada quando um objeto state é removido
  */
  void initState() {
    super.initState();
    ytController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void loadVideo(String videoId) {
    setState(() {
      ytController?.load(videoId);
    });
  }
  /* YoutubePlayerController ytController = YoutubePlayerController(
    initialVideoId: '',
    flags: YoutubePlayerFlags(autoPlay: false, mute: false),
  ); */

  //Recebe o que foi digitado na pesquisa do customSearchDelegate.dart
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];
                    return GestureDetector(
                      onTap: () {
                        /* print("id do video: " + video.id); */
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VideoPlayerPage(videoId: video.id),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imagem),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.descricao),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data!.length);
            } else {
              return const Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
          default:
            return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    ytController?.dispose();
    super.dispose();
  }
}
