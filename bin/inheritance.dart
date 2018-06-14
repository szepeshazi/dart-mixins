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

main(List<String> arguments) {
  var parrot = new Bird("Pete the parrot");
  print(parrot);
  var hamster = new Mammal("Mitzi the hamster");
  print(hamster);
}
