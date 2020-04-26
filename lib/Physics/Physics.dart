import 'package:ludo_dash/Models/Models.dart';
import 'package:vector_math/vector_math.dart';

/*
 * Makes the game run
 * TOP LEFT is the begining of the board as natural coordinate system
 */
class Physics {
  static int row = 15;
  static int col = 15;
  final List<Player> players;
  List<List<Token>> _board;

  Physics(this.players) {
    assert(players.length <= 4);
    _board = _resetBoard();
  }

  List<List<Token>> _resetBoard() {
    return List.generate(
        row,
        (int rowIndex) => List.generate(
            col, (int colIndex) => _getPlayerHomeLocation(rowIndex, colIndex)));
  }

  Token _getPlayerHomeLocation(int rowIndex, int colIndex) {
    return Token(Vector2.zero(), this.players[0]);
  }

  List<List<Token>> get board => _board;

  //mutator functions
  void _changePlayerTurn(Player currentPlayer) {}
  void _rollDice() {}
  void _moveToken() {}

  //helpers functions
  bool _identifyClash(Token a, Token b) {}
  bool _isInDen(Token a) {}
  bool _isInHome(Token a) {}
}
