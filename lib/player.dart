
class Player{

  String _name, _team, _pos, _kda,
      _kills, _deaths, _assists, _kp,
      _cspm, _cst;


  Player(this._name, this._team, this._pos ,this._kda,
      this._kills, this._deaths, this._assists, this._kp,
    this._cspm, this._cst);


  Player.map(dynamic obj){
    this._name = obj['Name'];
    this._team = obj['Team'];
    this._pos = obj['Position'];
    this._kda = obj['KDA'];
    this._kills = obj['Kills'];
    this._deaths = obj['Deaths'];
    this._assists = obj['Assists'];
    this._kp = obj['Kill Participation'];
    this._cspm = obj['CS Per Minute'];
    this._cst = obj['CS Total'];

  }

  //Not working idk if I need it though
  String get name => _name;
  String get team => _team;
  String get pos => _pos;
  String get kda => _kda;
  String get kills => _kills;
  String get deaths => _deaths;
  String get assists => _assists;
  String get kp => _kp;
  String get cspm => _cspm;
  String get cst => _cst;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['Name'] = _name;
    map['Team'] = _team;
    map['Position'] = _pos;
    map['KDA'] = _kda;
    map['Kills'] = _kills;
    map['Deaths'] = _deaths;
    map['Assists'] = _assists;
    map['Kill Participation'] = _kp;
    map['CS Per Minute'] = _cspm;
    map['CS Total'] = _cst;

    return map;
  }

  Player.fromMap(Map<String, dynamic> map){
    this._name = map['Name'];
    this._team = map['Team'];
    this._pos = map['Position'];
    this._kda = map['KDA'];
    this._kills = map['Kills'];
    this._deaths = map['Deaths'];
    this._assists = map['Assists'];
    this._kp = map['Kill Participation'];
    this._cspm = map['CS Per Minute'];
    this._cst = map['CS Total'];
  }

}