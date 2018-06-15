class Address {
  final String street;
  final String city;
  final String state;
  final String zip;

  Address(this.street, this.city, this.state, this.zip);
}

abstract class AddressValidator {
  Address get address;

  bool validateAddress() {
    bool isValid = false;
    // Here comes the incredibly complicated code for validating an address
    return isValid;
  }
}

class Company extends Object with AddressValidator {
  @override
  Address address;

  final String name;

  Company(this.name);
}


void main(List<String> arguments) {
  Company myCompany = new Company("Miner diner")..address = new Address("Hammond 22", "Mountain View", "CA", "65021");
  print("$myCompany address is valid? ${myCompany.validateAddress()}");
}