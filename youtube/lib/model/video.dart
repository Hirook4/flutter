class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  //{} torna os itens opcionais
  Video(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.canal});

//Construtor nomeado, resolve o problema porem teria que fazer uma instancia de Video por item, assim ficando mal otimizado
  // static converterJson(Map<String, dynamic> json) {
  //   return Video(
  //     id: json["id"]["videoId"],
  //     titulo: json["snippet"]["title"],
  //     descricao: json["id"]["videoId"],
  //     imagem: json["snippet"]["thumbnails"]["high"]["url"],
  //     canal: json["snippet"]["channelId"],
  //   );
  // }

  //Factory funciona como static, porem o retorno sera de um unico objeto, desse modo ele usa somente uma instancia de Video e passa todos os dados por ela
  factory Video.fromJson(Map<String, dynamic> json) {
    //Construtor que vai receber um Json
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
