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
    }
void main(){
  Car car1=Car("toyota",20000);
  Car car2=Car("honda",15000);
  Person person1=Person("Alice",50000);
  Person person2=Person("Bob",12000);
  person1.buyCar(car1);
  person1.buyCar(car2);
  person2.buyCar(car1);
  person2.buyCar(car2);
  person1.sellCar(car1);
  person2.sellCar(car2);
  car1.changePrice(18000);
  car2.changePrice(12000);
  person1.buyCar(car1);
  person2.buyCar(car2);
}