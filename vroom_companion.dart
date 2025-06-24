class Car{
  String name;
  int price;

  Car(this.name,this.price);

  void changePrice(int newPrice){
    price=newPrice;
    print("Price of $name changed to $price");
  }
}

class Person{
  String name;
  int moneyLeft;
  List<Car>ownedCars=[];
  Person(this.name,this.moneyLeft);
  void buyCar(Car car){
    if(moneyLeft>=car.price){
      ownedCars.add(car);
      moneyLeft-= car.price;
      print("$name brought ${car.name} for ${car.price}");
    }else{
      print("$name does not have enough money to buy ${car.name}");
    }
    }
    void sellCar(Car car){
      if(ownedCars.contains(car)){
        ownedCars.remove(car);
        moneyLeft+=car.price;
        print("$name sold ${car.name} for ${car.price}");
      }else{
        print("$name does not own ${car.name} to sell it");
      }
      }
  void showInfo() {
    print("\n$name has \$${moneyLeft}");
    if (ownedCars.isEmpty) {
      print("$name owns no cars.");
    } else {
      print("$name owns:");
      for (var car in ownedCars) {
        print("- ${car.name} (\$${car.price})");
      }
    }
  }
    }
void main() {
  List<Car> carList = [];
  List<Person> personList = [];

  while (true) {
    print("\n========= Car Platform =========");
    print("1. Add Car");
    print("2. Add Person");
    print("3. Buy Car");
    print("4. Sell Car");
    print("5. Show Person Info");
    print("6. Change Car Price");
    print("0. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        stdout.write("Enter car name: ");
        String? carName = stdin.readLineSync();
        stdout.write("Enter car price: ");
        int? price = int.tryParse(stdin.readLineSync() ?? '');
        if (carName != null && price != null) {
          carList.add(Car(carName, price));
          print("Car added.");
        } else {
          print("Invalid input.");
        }
        break;
      case "2":
        stdout.write("Enter person name: ");
        String? personName = stdin.readLineSync();
        stdout.write("Enter starting money: ");
        int? money = int.tryParse(stdin.readLineSync() ?? '');
        if (personName != null && money != null) {
          personList.add(Person(personName, money));
          print("Person added.");
        } else {
          print("Invalid input.");
        }
        break;
      case "3":
        if (carList.isEmpty || personList.isEmpty) {
          print("Add cars and persons first.");
          break;
        }
        showCars(carList);
        stdout.write("Choose car index: ");
        int? carIndex = int.tryParse(stdin.readLineSync() ?? '');
        showPersons(personList);
        stdout.write("Choose person index: ");
        int? personIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (isValidIndex(carIndex, carList) && isValidIndex(personIndex, personList)) {
          personList[personIndex!].buyCar(carList[carIndex!]);
        } else {
          print("Invalid index.");
        }
        break;
      case "4":
        showPersons(personList);
        stdout.write("Choose person index: ");
        int? pIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (isValidIndex(pIndex, personList)) {
          var person = personList[pIndex!];
          if (person.ownedCars.isEmpty) {
            print("${person.name} has no cars to sell.");
            break;
          }
          for (int i = 0; i < person.ownedCars.length; i++) {
            print("$i. ${person.ownedCars[i].name} (\$${person.ownedCars[i].price})");
          }
          stdout.write("Choose car index to sell: ");
          int? cIndex = int.tryParse(stdin.readLineSync() ?? '');
          if (isValidIndex(cIndex, person.ownedCars)) {
            person.sellCar(person.ownedCars[cIndex!]);
          } else {
            print("Invalid car index.");
          }
        } else {
          print("Invalid person index.");
        }
        break;
      case "5":
        showPersons(personList);
        stdout.write("Choose person index: ");
        int? idx = int.tryParse(stdin.readLineSync() ?? '');
        if (isValidIndex(idx, personList)) {
          personList[idx!].showInfo();
        } else {
          print("Invalid index.");
        }
        break;
      case "6":
        showCars(carList);
        stdout.write("Choose car index: ");
        int? cIdx = int.tryParse(stdin.readLineSync() ?? '');
        stdout.write("Enter new price: ");
        int? newPrice = int.tryParse(stdin.readLineSync() ?? '');
        if (isValidIndex(cIdx, carList) && newPrice != null) {
          carList[cIdx!].changePrice(newPrice);
        } else {
          print("Invalid input.");
        }
        break;
      case "0":
        print("Exiting program.");
        return;
      default:
        print("Invalid choice.");
    }
  }
}
// Helper Functions
void showCars(List<Car> cars) {
  for (int i = 0; i < cars.length; i++) {
    print("$i. ${cars[i].name} (\$${cars[i].price})");
  }
}
void showPersons(List<Person> persons) {
  for (int i = 0; i < persons.length; i++) {
    print("$i. ${persons[i].name} (\$${persons[i].moneyLeft})");
  }
}
bool isValidIndex<T>(int? index, List<T> list) {
  return index != null && index >= 0 && index < list.length;
}
