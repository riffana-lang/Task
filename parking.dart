abstract class Vehicle{
  String vehiclenumber;
  String vehicletype;
  
  Vehicle(this.vehiclenumber,this.vehicletype);
  
  
  
  double  calculateParkingFee(int hours);
  
  
  
}
class Bike extends Vehicle{
  Bike ( String vehiclenumber) : super (vehiclenumber,'Bike');
  
  @override
  double  calculateParkingFee(int hours){
    return hours * 10;
  }
  
}
class Car extends Vehicle{
  Car (String vehiclenumber) :super(vehiclenumber ,'Car');
  
  @override
  double calculateParkingFee(int hours){
    return hours *20;
    
  }
}

class Truck extends Vehicle{
  Truck(String vehiclenumber):super(vehiclenumber,'Truck');
  
  @override
  double calculateParkingFee(int hours){
    return hours*30;
  }
}


class ParkingLot{
  final List<Vehicle> _vehicles=[];
  
  void addVehicle(Vehicle vehicle){
    _vehicles.add(vehicle);
    print("${vehicle.vehicletype} (${vehicle.vehiclenumber}) added sucessfully!");
  }
  
  void removeVehicle(String vehiclenumber,int hours){
    Vehicle? foundVehicle;
    for(var v in _vehicles){
      if(v.vehiclenumber==vehiclenumber){
      foundVehicle=v;
      break;
    }
    
  }
  if(foundVehicle !=null){
      double fee = foundVehicle.calculateParkingFee(hours);
      _vehicles.remove(foundVehicle);
    
    print("${foundVehicle.vehicletype} (${foundVehicle.vehiclenumber}) removed.Parking Fee:$fee");

    
  }else{
    print("vehicle with number $vehiclenumber not found!");
    
  }
  
  }
  void showAllVehicles(){
    if(_vehicles.isEmpty){
      print("no vehicles parked correctly.");
    }
    else{
      print("------parked vehicles----");
      for(var v in  _vehicles){
      print("${v.vehiclenumber} ${(v.vehicletype)}");
    }
    }
  }
 
}
void main(){
  ParkingLot park = ParkingLot();
  
  park.addVehicle(Bike("BIKE123"));
  park.addVehicle(Car("CAR555"));
  park.addVehicle(Truck("TRK999"));
  
  
  park.showAllVehicles();
  
  park.removeVehicle("CAR555",2);
  
  
  
  
  
}
