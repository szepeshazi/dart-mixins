class Animal {
  final String name;
  List<String> characteristics;
  List<String> abilities;

  Animal(this.name)
      : characteristics = new List<String>(),
        abilities = new List<String>();

  @override
  String toString() => "Hey, I am $name. I have ${characteristics.join(', ')} and I can ${abilities.join(', ')}";
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

abstract class Scavenger {
  String feedingBehavior() => "Find a carcass, watch out for dangerous predators, eat until full";
}

class Crow extends Bird with Scavenger {
  Crow(String name) : super(name) {
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultAbilities = const <String>["play", "use tools"];
}

class Hyena extends Mammal with Scavenger {
  Hyena(String name) : super(name) {
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultAbilities = const <String>["mark territory with my pee"];
}

void main(List<String> arguments) {
  List<Scavenger> scavengers = <Scavenger>[new Crow("Charles the crow"), new Hyena("Hugo the hyena")];
  for (Scavenger scavenger in  scavengers) {
    print(scavenger);
    print("This is how I feed: ${scavenger.feedingBehavior()}");
  }
}
