class Animal {
  final String name;
  List<String> characteristics;
  List<String> abilities;

  Animal(this.name)
      : characteristics = new List<String>(),
        abilities = new List<String>();

  @override
  String toString() => "Hey, I am $name. I have ${characteristics.join(', ')} and I can ${abilities.join(', ')}.";
}

class Vertebrate extends Animal {
  Vertebrate(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
  }

  static const List<String> _defaultCharacteristics = const <String>["skeleton", "muscles", "brain", "nervous system"];
}

class Mammal extends Vertebrate {
  Mammal(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultCharacteristics = const <String>["hair"];
  static const List<String> _defaultAbilities = const <String>["regulate my temperature"];
}

class Bird extends Vertebrate {
  Bird(String name) : super(name) {
    characteristics.addAll(_defaultCharacteristics);
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultCharacteristics = const <String>["feathers", "wings"];
  static const List<String> _defaultAbilities = const <String>["lay eggs"];
}

void main(List<String> arguments) {
  List<Animal> animals = <Animal>[new Bird("Charles the crow"), new Mammal("Bandit the coyote")] ;
  animals.forEach(print);
}
