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

// ignore: one_member_abstracts
abstract class Carnivore {
  String feedingBehavior();
}

abstract class Scavenger {
  String feedingBehavior() => "Find a carcass, watch out for dangerous predators, eat until full";
}

abstract class Predator {
  String feedingBehavior() => "Approach prey carefully, charge and kill, eat until full";
}

class Crow extends Bird with Scavenger implements Carnivore {
  Crow(String name) : super(name) {
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultAbilities = const <String>["play", "use tools"];
}

class Hyena extends Mammal with Scavenger implements Carnivore {
  Hyena(String name) : super(name) {
    abilities.addAll(_defaultAbilities);
  }

  static const List<String> _defaultAbilities = const <String>["mark territory with my pee"];
}

class Cheetah extends Mammal with Predator implements Carnivore {
  Cheetah(String name) : super(name);
}


void main(List<String> arguments) {
  List<Carnivore> carnivores = <Carnivore>[new Crow("Charles the crow"), new Hyena("Hugo the hyena"), new Cheetah("Cecil the cheetah")];
  for (Carnivore animal in  carnivores) {
    print(animal);
    print("This is how I feed: ${animal.feedingBehavior()}");
  }
}
