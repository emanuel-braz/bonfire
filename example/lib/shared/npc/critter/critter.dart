import 'package:bonfire/bonfire.dart';
import 'package:example/manual_map/dungeon_map.dart';
import 'package:example/shared/util/critter_sprite_sheet.dart';
import 'critter_controller.dart';

class Critter extends SimpleEnemy
    with
        ObjectCollision,
        AutomaticRandomMovement,
        UseStateController<CritterController> {
  Critter(Vector2 position)
      : super(
          animation: CritterSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(DungeonMap.tileSize * 0.8),
          speed: DungeonMap.tileSize * 1.6,
          life: 100,
          receivesAttackFrom: ReceivesAttackFromEnum.NONE,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              DungeonMap.tileSize * 0.4,
              DungeonMap.tileSize * 0.4,
            ),
            align: Vector2(
              DungeonMap.tileSize * 0.2,
              DungeonMap.tileSize * 0.2,
            ),
          ),
        ],
      ),
    );
  }

// Ignore all damage received
  @override
  void receiveDamage(double damage, dynamic from) {}
}