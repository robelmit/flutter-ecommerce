import 'package:awesome_select/awesome_select.dart' show S2Choice;
import 'package:easy_localization/easy_localization.dart';

List<S2Choice<String>> days = [
  S2Choice<String>(value: 'mon', title: 'Monday'),
  S2Choice<String>(value: 'tue', title: 'Tuesday'),
  S2Choice<String>(value: 'wed', title: 'Wednesday'),
  S2Choice<String>(value: 'thu', title: 'Thursday'),
  S2Choice<String>(value: 'fri', title: 'Friday'),
  S2Choice<String>(value: 'sat', title: 'Saturday'),
  S2Choice<String>(value: 'sun', title: 'Sunday'),
];

List<S2Choice<String>> months = [
  S2Choice<String>(value: 'jan', title: 'January'),
  S2Choice<String>(value: 'feb', title: 'February'),
  S2Choice<String>(value: 'mar', title: 'March'),
  S2Choice<String>(value: 'apr', title: 'April'),
  S2Choice<String>(value: 'may', title: 'May'),
  S2Choice<String>(value: 'jun', title: 'June'),
  S2Choice<String>(value: 'jul', title: 'July'),
  S2Choice<String>(value: 'aug', title: 'August'),
  S2Choice<String>(value: 'sep', title: 'September'),
  S2Choice<String>(value: 'oct', title: 'October'),
  S2Choice<String>(value: 'nov', title: 'November'),
  S2Choice<String>(value: 'dec', title: 'December'),
];

List<S2Choice<String>> os = [
  S2Choice<String>(value: 'and', title: 'Android'),
  S2Choice<String>(value: 'ios', title: 'IOS'),
  S2Choice<String>(value: 'mac', title: 'Macintos'),
  S2Choice<String>(value: 'tux', title: 'Linux'),
  S2Choice<String>(value: 'win', title: 'Windows'),
];

List<S2Choice<String>> heroes = [
  S2Choice<String>(value: 'bat', title: 'Batman'),
  S2Choice<String>(value: 'sup', title: 'Superman'),
  S2Choice<String>(value: 'hul', title: 'Hulk'),
  S2Choice<String>(value: 'spi', title: 'Spiderman'),
  S2Choice<String>(value: 'iro', title: 'Ironman'),
  S2Choice<String>(value: 'won', title: 'Wonder Woman'),
];

List<S2Choice<String>> fruits = [
  S2Choice<String>(value: 'app', title: 'Apple'),
  S2Choice<String>(value: 'ore', title: 'Orange'),
  S2Choice<String>(value: 'mel', title: 'Melon'),
];

List<S2Choice<String>> frameworks = [
  S2Choice<String>(value: 'ion', title: 'Ionic'),
  S2Choice<String>(value: 'flu', title: 'Flutter'),
  S2Choice<String>(value: 'rea', title: 'React Native'),
];

List<S2Choice<String>> categories = [
  S2Choice<String>(value: 'ele', title: 'Electronics'),
  S2Choice<String>(value: 'aud', title: 'Audio & Video'),
  S2Choice<String>(value: 'acc', title: 'Accessories'),
  S2Choice<String>(value: 'ind', title: 'Industrial'),
  S2Choice<String>(value: 'wat', title: 'Smartwatch'),
  S2Choice<String>(value: 'sci', title: 'Scientific'),
  S2Choice<String>(value: 'mea', title: 'Measurement'),
  S2Choice<String>(value: 'pho', title: 'Smartphone'),
];

List<S2Choice<String>> sorts = [
  S2Choice<String>(value: 'popular', title: 'Popular'),
  S2Choice<String>(value: 'review', title: 'Most Reviews'),
  S2Choice<String>(value: 'latest', title: 'Newest'),
  S2Choice<String>(value: 'cheaper', title: 'Low Price'),
  S2Choice<String>(value: 'pricey', title: 'High Price'),
];
List<S2Choice<String>> regions = [
  S2Choice<String>(value: 'all', title: 'All Ethiopia'.tr()),
  S2Choice<String>(value: 'tigray', title: 'Tigray'.tr()),
  S2Choice<String>(value: 'addisababa', title: 'Addis Ababa'.tr()),
  S2Choice<String>(value: 'amhara', title: 'Amhara'.tr()),
  S2Choice<String>(value: 'oromia', title: 'Oromia'.tr()),
  S2Choice<String>(value: 'somali', title: 'Somali'.tr()),
  S2Choice<String>(value: 'benishangul', title: 'Benishangul-Gumuz'.tr()),
  S2Choice<String>(value: 'sidama', title: 'Sidama'.tr()),
  S2Choice<String>(value: 'south', title: 'Southern'.tr()),
  S2Choice<String>(value: 'harar', title: 'Harari'.tr())
];
//   {'value': 'tigray', 'title': 'Tigray'},
//   {'value': 'addisababa', 'title': 'Addis Ababa'},
//   {'value': 'amhara', 'title': 'Amhara'},
//   {'value': 'oromia', 'title': 'Oromia'},
//   {'value': 'somali', 'title': 'Somali'},
//   {'value': 'benishangul', 'title': 'Benishangul-Gumuz'},
//   {'value': 'sidama', 'title': 'Sidama'},
//   {'value': 'southern', 'title': 'Southern'},
//   {'value': 'diredawa', 'title': 'Dire Dawa'},
//   {'value': 'harari', 'title': 'Harari'},
// ];

// final List<String> categorie = [
//   'phones'.tr(),
//   'electronics'.tr(),
//   'vehicles'.tr(),
//   'property'.tr(),
//   'homesupplies'.tr(),
//   'fashion'.tr(),
//   'animals'.tr(),
// ];
List<Map<String, String>> catagorydetail = [
  {'value': 'phones'.tr(), 'title': 'phones'.tr()},
  {'value': 'electronics'.tr(), 'title': 'electronics'.tr()},
  {'value': 'vehicles'.tr(), 'title': 'vehicles'.tr()},
  {'value': 'property'.tr(), 'title': 'property'.tr()},
  {'value': 'homesupplies'.tr(), 'title': 'homesupplies'.tr()},
  {'value': 'fashion'.tr(), 'title': 'fashion'.tr()},
  {'value': 'animals'.tr(), 'title': 'animals'.tr()},
];
List<S2Choice<String>> catagory = [
  S2Choice<String>(value: 'phones', title: 'phones'.tr()),
  S2Choice<String>(value: 'electronics', title: 'electronics'.tr()),
  S2Choice<String>(value: 'vehicles', title: 'vehicles'.tr()),
  S2Choice<String>(value: 'property', title: 'property'.tr()),
  S2Choice<String>(value: 'homesupplies', title: 'homesupplies'.tr()),
  S2Choice<String>(value: 'fashion', title: 'fashion'.tr()),
  S2Choice<String>(value: 'animals', title: 'animals'.tr()),
];

List<Map<String, String>> phone = [
  {'value': 'Samsung', 'title': 'Samsung'.tr()},
  {'value': 'iphone', 'title': 'iphone'.tr()},
  {'value': 'Nokia', 'title': 'Nokia'.tr()},
  {'value': 'Huawei', 'title': 'Huawei'.tr()},
  {'value': 'Xiaomi', 'title': 'Xiaomi'.tr()},
];

List<Map<String, String>> electronics = [
  {'value': 'Tv', 'title': 'Tv'.tr()},
  {'value': 'Video Cameras', 'title': 'Video Cameras'.tr()},
  {'value': 'Laptops', 'title': 'Laptops'.tr()},
  {'value': 'Computer Accessory', 'title': 'Computer Accessory'.tr()},
  {'value': 'Headphones', 'title': 'Headphones'.tr()},
  {'value': 'Router', 'title': 'Router'.tr()},
];

List<Map<String, String>> homesupply = [
  {'value': 'Sofa', 'title': 'Sofa'.tr()},
  {'value': 'Fridge', 'title': 'Fridge'.tr()},
  {'value': 'Bed', 'title': 'Bed'.tr()},
  {'value': 'Microwave', 'title': 'Microwave'.tr()},
  {'value': 'Table', 'title': 'Table'.tr()},
  {'value': 'Chair', 'title': 'Chair'.tr()},
];

List<Map<String, String>> cloth = [
  {'value': 'Cloths', 'title': 'Cloths'.tr()},
  {'value': 'Shoe', 'title': 'Shoe'.tr()},
  {'value': 'Watch', 'title': 'Watch'.tr()},
  {'value': 'Bags', 'title': 'Bags'.tr()},
];

List<Map<String, String>> vehicles = [
  {'value': 'Toyota', 'title': 'Toyota'.tr()},
  {'value': 'Hyundai', 'title': 'Hyundai'.tr()},
  {'value': 'Suzuki', 'title': 'Suzuki'.tr()},
  {'value': 'Nissan', 'title': 'Nissan'.tr()},
  {'value': 'Ford', 'title': 'Ford'.tr()},
  {'value': 'Volswagen', 'title': 'Volswagen'.tr()},
  {'value': 'Buses', 'title': 'Buses'.tr()},
  {'value': 'Truck', 'title': 'Truck'.tr()},
  {'value': 'Heavy Equipment', 'title': 'Heavy Equipment'.tr()},
];

List<Map<String, String>> house = [
  {'value': 'Apartment', 'title': 'Apartment'.tr()},
  {'value': 'House', 'title': 'House'.tr()},
  {'value': 'Condominium', 'title': 'Condominium'.tr()},
  {'value': 'Villa', 'title': 'Villa'.tr()},
];
// final List<String> animals = [
//   'Dogs'.tr(),
//   'Cats'.tr(),
//   'Birds'.tr(),
// ];
List<Map<String, String>> animals = [
  {'value': 'Dogs', 'title': 'Dogs'.tr()},
  {'value': 'Cats', 'title': 'Cats'.tr()},
  {'value': 'Birds', 'title': 'Birds'.tr()},
];

List<Map<String, String>> cities = [
  {'value': 'Mekele', 'title': 'Mekele'.tr(), 'brand': 'Tigray'.tr(), 'body': 'SUV'},
  {'value': 'Āksum', 'title': 'Axum'.tr(), 'brand': 'Tigray'.tr(), 'body': 'SUV'},
  {'value': 'Adwa', 'title': 'Adwa'.tr(), 'brand': 'Tigray'.tr(), 'body': 'SUV'},
  {'value': 'Ādīgrat', 'title': 'Adigrat'.tr(), 'brand': 'Tigray'.tr(), 'body': 'SUV'},
  {'value': 'Shire', 'title': 'Shire'.tr(), 'brand': 'Tigray'.tr(), 'body': 'SUV'},
  {'value': 'Bahir Dar', 'title': 'BahirDar'.tr(), 'brand': 'Amhara'.tr(), 'body': 'SUV'},
  {'value': 'Gondar', 'title': 'Gonder'.tr(), 'brand': 'Amhara'.tr(), 'body': 'SUV'},
  {'value': 'Desē', 'title': 'Dessye'.tr(), 'brand': 'Amhara'.tr(), 'body': 'SUV'},
  {'value': 'Kombolcha', 'title': 'Kombolcha'.tr(), 'brand': 'Amhara'.tr(), 'body': 'SUV'},
  {'value': 'Debre Birhan', 'title': 'DebreBirhan'.tr(), 'brand': 'Amhara'.tr(), 'body': 'SUV'},
  {'value': 'Jīma', 'title': 'Jimma'.tr(), 'brand': 'Oromia'.tr(), 'body': 'SUV'},
  {'value': 'Nazrēt', 'title': 'Nazreth'.tr(), 'brand': 'Oromia'.tr(), 'body': 'SUV'},
  {'value': 'Shashemenē', 'title': 'Shashamanni'.tr(), 'brand': 'Oromia'.tr(), 'body': 'SUV'},
  {'value': 'Bishoftu', 'title': 'Bishoftu'.tr(), 'brand': 'Oromia'.tr(), 'body': 'SUV'},
  {'value': 'Nekemte', 'title': 'Nekemte'.tr(), 'brand': 'Oromia'.tr(), 'body': 'SUV'},
  {'value': 'Hawassa', 'title': 'Hawassa'.tr(), 'brand': 'South'.tr(), 'body': 'SUV'},
  {'value': 'Ārba Minch’', 'title': 'Arba'.tr(), 'brand': 'South'.tr(), 'body': 'SUV'},
  {'value': 'Sodo', 'title': 'Sodo'.tr(), 'brand': 'South'.tr(), 'body': 'SUV'},
  {'value': 'Jijiga', 'title': 'Jijiga'.tr(), 'brand': 'Somali'.tr(), 'body': 'SUV'},
  {'value': 'Semera', 'title': 'Semera'.tr(), 'brand': 'Afar'.tr(), 'body': 'SUV'},
  {'value': 'Harar', 'title': 'Harar'.tr(), 'brand': 'Harar'.tr(), 'body': 'SUV'},
  {'value': 'Addis Ababa', 'title': 'Addis'.tr(), 'brand': 'Addis'.tr(), 'body': 'SUV'},
  {'value': 'Dire Dawa', 'title': 'Dire'.tr(), 'brand': 'Dire'.tr(), 'body': 'SUV'},

];
List<Map<String, String>> cars = [
  {'value': 'bmw-x1', 'title': 'BMW X1', 'brand': 'BMW', 'body': 'SUV'},
 
];
List<S2Choice<String>> Transmission = [
    S2Choice<String>(
      value: 'Automatic',
      title: 'Automatic'.tr(),
    ),
    S2Choice<String>(value: 'CVT', title: 'CVT'.tr()),
    S2Choice<String>(value: 'Manual', title: 'Manual'.tr()),
  ];
  List<S2Choice<String>> EngineSize = [
    S2Choice<String>( value: '1.0-1,2 Litre engine',title: '1.0-1,2 Litre engine'.tr(),),
    S2Choice<String>( value: '1.4-1.6 Lite engine',title: '1.4-1.6 Lite engine'.tr(),),
    S2Choice<String>( value: '1.8-2.0 Litre engine',title: '1.8-2.0 Litre engine'.tr(),),
    S2Choice<String>( value: '2.2=3.0 Litre engine',title: '2.2=3.0 Litre engine'.tr(),),
    S2Choice<String>( value: '> 3.5  Litre Engine',title: '> 3.5  Litre Engine'.tr(),),

   
  ];
  List<S2Choice<String>> Fuel = [
    S2Choice<String>( value: 'Diesel',title: 'Diesel'.tr(),),
    S2Choice<String>( value: 'Gasoline',title: 'Gasoline'.tr(),),
    
  ];

List<Map<String, String>> smartphones = [
  {
    'id': 'sk3',
    'name': 'Samsung Keystone 3',
    'brand': 'Samsung',
    'category': 'Budget Phone'
  },
  {
    'id': 'n106',
    'name': 'Nokia 106',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'n150',
    'name': 'Nokia 150',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'r7a',
    'name': 'Redmi 7A',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga10s',
    'name': 'Galaxy A10s',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'rn7',
    'name': 'Redmi Note 7',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga20s',
    'name': 'Galaxy A20s',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'mc9',
    'name': 'Meizu C9',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'm6',
    'name': 'Meizu M6',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga2c',
    'name': 'Galaxy A2 Core',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'r6a',
    'name': 'Redmi 6A',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'r5p',
    'name': 'Redmi 5 Plus',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga70',
    'name': 'Galaxy A70',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ai11',
    'name': 'iPhone 11 Pro',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixr',
    'name': 'iPhone XR',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixs',
    'name': 'iPhone XS',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'aixsm',
    'name': 'iPhone XS Max',
    'brand': 'Apple',
    'category': 'Flagship Phone'
  },
  {
    'id': 'hp30',
    'name': 'Huawei P30 Pro',
    'brand': 'Huawei',
    'category': 'Flagship Phone'
  },
  {
    'id': 'ofx',
    'name': 'Oppo Find X',
    'brand': 'Oppo',
    'category': 'Flagship Phone'
  },
  {
    'id': 'gs10',
    'name': 'Galaxy S10+',
    'brand': 'Samsung',
    'category': 'Flagship Phone'
  },
];

List<Map<String, String>> transports = [
  {
    'title': 'Plane',
    'image': 'https://source.unsplash.com/Eu1xLlWuTWY/100x100',
  },
  {
    'title': 'Train',
    'image': 'https://source.unsplash.com/Njq3Nz6-5rQ/100x100',
  },
  {
    'title': 'Bus',
    'image': 'https://source.unsplash.com/qoXgaF27zBc/100x100',
  },
  {
    'title': 'Car',
    'image': 'https://source.unsplash.com/p7tai9P7H-s/100x100',
  },
  {
    'title': 'Bike',
    'image': 'https://source.unsplash.com/2LTMNCN4nEg/100x100',
  },
];
