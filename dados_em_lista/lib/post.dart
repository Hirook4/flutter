class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  int get userId => this._userId;

  set userId(int value) => this._userId = value;

  int get id => this._id;

  set id(value) => this._id = value;

  get title => this._title;

  set title(value) => this._title = value;

  get body => this._body;

  set body(value) => this._body = value;

  Post(this._userId, this._id, this._title, this._body);
}
