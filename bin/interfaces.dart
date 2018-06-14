class Animal {
  String name;
  List<String> characteristics;

  Animal(this.name) : characteristics = new List<String>();

  @override
  String toString() => "Hey, I am $name and look, I have ${characteristics?.join(', ')}";
}

class Vertebrate extends Animal {

  Vertebrate(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
  }

  static const List<String> _defaultCharacteristics = const ["skeleton", "muscles", "brain", "nervous system"];
}

class Mammal extends Vertebrate {
  Mammal(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
  }

  static const List<String> _defaultCharacteristics = const ["hair"];
}

class Bird extends Vertebrate {
  Bird(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
  }

  static const List<String> _defaultCharacteristics = const ["feathers", "wings"];
}

abstract class Carnivore {
  void huntPrey();
}

class Hawk extends Bird implements Carnivore {

  Hawk(String name) : super(name);

  @override
  void huntPrey() {
    print("$name is hunting: Find a smaller animal than me and eat it");
  }
}

class Lion extends Mammal implements Carnivore {

  Lion(String name) : super(name);

  @override
  void huntPrey() {
    print("$name is hunting: Find a smaller animal than me and eat it");
  }
}

main(List<String> arguments) {
  List<Carnivore> carnivores = [new Hawk("Hudson the hawk"), new Lion("Leo the lion")];
  for (var carnivore in carnivores) {
    print(carnivore);
    carnivore.huntPrey();
  }
}
