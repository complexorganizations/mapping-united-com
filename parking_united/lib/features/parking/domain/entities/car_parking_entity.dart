class CarParkingEntity {
  final String? img;
  final bool? isParked;
  final num? number;

  CarParkingEntity({
    this.img,
    this.isParked,
    this.number,
  });

  static List<CarParkingEntity> carParking = [
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 1),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 2),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 3),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 4),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 5),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 6),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 7),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 8),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 9),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 10),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 11),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 12),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 13),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 14),
    CarParkingEntity(img: "assets/redcar.png", isParked: true, number: 15),
    CarParkingEntity(img: "assets/green_car.png", isParked: false, number: 16),
  ];
}
