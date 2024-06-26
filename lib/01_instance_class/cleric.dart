import 'dart:math';

class Cleric {
  String name;
  int hp;
  int mp;

  static const maxHp = 50;
  static const maxMp = 10;
  static const selfAidCost = 5;

  Cleric(this.name, { this.hp = maxHp, this.mp = maxMp}) {
    hp = min(hp, maxHp);
    mp = min(mp, maxMp);
  }

  void selfAid() {
    if (mp < selfAidCost) return;

    mp -= selfAidCost;
    hp = maxHp;
  }

  int pray({required int seconds}) {
    if (seconds < 0) {
      throw Exception('기도 시간은 음수가 될 수 없음');
    }

    final randMod = Random().nextInt(3);
    final recoverMod = seconds + randMod;

    final lastMp = mp;
    mp = min(maxMp, mp + recoverMod);

    final recoverAmount = mp - lastMp;

    return recoverAmount;
  }
}