class Point {
  final num x;
  final num y;
  final num? z;

  int get numDimensions => (z == null) ? 2 : 3;

  const Point(this.x, this.y, [this.z]);
}

class Animal {
  final String name;
  final String? _ownerName;

  String get ownerName => _ownerName ?? 'This animal doesn\'t have an owner.';

  const Animal(this.name, {String? ownerName}) : _ownerName = ownerName;
}

class Pet extends Animal {
  const Pet(super.name, {required super.ownerName});
}

abstract class MakesSound {
  void makeSound();
}

class Dog extends Animal implements MakesSound {
  const Dog(super.name, {super.ownerName});

  @override
  void makeSound() {
    print('Woof');
  }
}

mixin Thought {
  void think() {
    print('I think therefore I am');
  }
}

mixin Creativity {
  String dreamsOf = "Electric Sheep";
}

class Human extends Animal with Thought, Creativity {
  Human(super.name);
}

void main() {
  var animal = Animal('Spot');
  var pet = Pet('Garfield', ownerName: 'Jon');
  var dog = Dog('Laika');
  dog.makeSound();
  var human = Human('Descartes');
  human.think();

  List<Point> points = [Point(1, 2, 3), Point(3.5, 5.1), Point(3.7, 2.2)];

  for (Point point in points) {
    print(point.numDimensions);
  }
}
