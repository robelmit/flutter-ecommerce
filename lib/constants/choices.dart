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
List<Map<String, String>> toyota = [
  {'brand': 'toyota', 'value': 'Avensis', 'title': 'Avensis'.tr()},
  {'brand': 'toyota', 'value': 'Aygo', 'title': 'Aygo'.tr()},
  {'brand': 'toyota', 'value': 'bZ4X', 'title': 'bZ4X'.tr()},
  {'brand': 'toyota', 'value': 'C-HR', 'title': 'C-HR'.tr()},
  {'brand': 'toyota', 'value': 'Camry', 'title': 'Camry'.tr()},
  {'brand': 'toyota', 'value': 'Carina', 'title': 'Carina'.tr()},
  {'brand': 'toyota', 'value': 'Celica', 'title': 'Celica'.tr()},
  {'brand': 'toyota', 'value': 'GT86', 'title': 'GT86'.tr()},
  {'brand': 'toyota', 'value': 'Corolla', 'title': 'Corolla'.tr()},
  {'brand': 'toyota', 'value': 'Hiace', 'title': 'Hiace'.tr()},
  {'brand': 'toyota', 'value': 'Hilux', 'title': 'Hilux'.tr()},
  {'brand': 'toyota', 'value': 'IQ', 'title': 'IQ'.tr()},
  {'brand': 'toyota', 'value': 'Land Cruiser', 'title': 'Land Cruiser'.tr()},
  {'brand': 'toyota', 'value': 'MR2', 'title': 'MR2'.tr()},
  {'brand': 'toyota', 'value': 'Previa', 'title': 'Previa'.tr()},
  {'brand': 'toyota', 'value': 'Prius', 'title': 'Prius'.tr()},
  {'brand': 'toyota', 'value': 'Prius +', 'title': 'Prius +'.tr()},
  {'brand': 'toyota', 'value': 'Proace', 'title': 'Proace'.tr()},
  {'brand': 'toyota', 'value': 'RAV4', 'title': 'RAV4'.tr()},
  {'brand': 'toyota', 'value': 'Starlet', 'title': 'Starlet'.tr()},
  {'brand': 'toyota', 'value': 'Supra', 'title': 'Supra'.tr()},
  {'brand': 'toyota', 'value': 'Tundra', 'title': 'Tundra'.tr()},
  {'brand': 'toyota', 'value': 'Urban Cruiser', 'title': 'Urban Cruiser'.tr()},
  {'brand': 'toyota', 'value': 'Verso', 'title': 'Verso'.tr()},
  {'brand': 'toyota', 'value': 'Verso-S', 'title': 'Verso-S'.tr()},
  {'brand': 'toyota', 'value': 'Yaris', 'title': 'Yaris'.tr()},
  {'brand': 'toyota', 'value': 'Other', 'title': 'Other'.tr()},
  {'brand': 'toyota', 'value': 'Vitz', 'title': 'Vitz'.tr()},
];
List<Map<String, String>> hyundai = [
  {'brand': 'hyundai', 'value': 'Accent', 'title': 'Accent'.tr()},
  {'brand': 'hyundai', 'value': 'Atos', 'title': 'Atos'.tr()},
  {'brand': 'hyundai', 'value': 'Bayon', 'title': 'Bayon'.tr()},
  {'brand': 'hyundai', 'value': 'Coupé', 'title': 'Coupé'.tr()},
  {'brand': 'hyundai', 'value': 'Elantra', 'title': 'Elantra'.tr()},
  {'brand': 'hyundai', 'value': 'Getz', 'title': 'Getz'.tr()},
  {'brand': 'hyundai', 'value': 'Grandeur', 'title': 'Grandeur'.tr()},
  {'brand': 'hyundai', 'value': 'H-1', 'title': 'H-1'.tr()},
  {'brand': 'hyundai', 'value': 'i10', 'title': 'i10'.tr()},
  {'brand': 'hyundai', 'value': 'i20', 'title': 'i20'.tr()},
  {'brand': 'hyundai', 'value': 'i30', 'title': 'i30'.tr()},
  {'brand': 'hyundai', 'value': 'i40', 'title': 'i40'.tr()},
  {'brand': 'hyundai', 'value': 'Ioniq', 'title': 'Ioniq'.tr()},
  {'brand': 'hyundai', 'value': 'Ioniq 5', 'title': 'Ioniq 5'.tr()},
  {'brand': 'hyundai', 'value': 'ix20', 'title': 'ix20'.tr()},
  {'brand': 'hyundai', 'value': 'ix35', 'title': 'ix35'.tr()},
  {'brand': 'hyundai', 'value': 'Kona', 'title': 'Kona'.tr()},
  {'brand': 'hyundai', 'value': 'Matrix', 'title': 'Matrix'.tr()},
  {'brand': 'hyundai', 'value': 'Santa Fe', 'title': 'Santa Fe'.tr()},
  {'brand': 'hyundai', 'value': 'Sonata', 'title': 'Sonata'.tr()},
  {'brand': 'hyundai', 'value': 'Terracan', 'title': 'Terracan'.tr()},
  {'brand': 'hyundai', 'value': 'Trajet', 'title': 'Trajet'.tr()},
  {'brand': 'hyundai', 'value': 'Tucson', 'title': 'Tucson'.tr()},
  {'brand': 'hyundai', 'value': 'Veloster', 'title': 'Veloster'.tr()},
  {'brand': 'hyundai', 'value': 'Other', 'title': 'Other'.tr()},
];
List<Map<String, String>> suzuki = [
  {'brand': 'suzuki', 'value': 'Alto', 'title': 'Atos'.tr()},
  {'brand': 'suzuki', 'value': 'Baleno', 'title': 'Baleno'.tr()},
  {'brand': 'suzuki', 'value': 'Grand Vitara', 'title': 'Grand Vitara'.tr()},
  {'brand': 'suzuki', 'value': 'Ignis', 'title': 'Ignis'.tr()},
  {'brand': 'suzuki', 'value': 'Jimny', 'title': 'Jimny'.tr()},
  {'brand': 'suzuki', 'value': 'Kizashi', 'title': 'Kizashi'.tr()},
  {'brand': 'suzuki', 'value': 'Liana', 'title': 'Liana'.tr()},
  {'brand': 'suzuki', 'value': 'S-Cross', 'title': 'S-Cross'.tr()},
  {'brand': 'suzuki', 'value': 'Splash', 'title': 'Splash'.tr()},
  {'brand': 'suzuki', 'value': 'Swace', 'title': 'Swace'.tr()},
  {'brand': 'suzuki', 'value': 'Swift', 'title': 'Swift'.tr()},
  {'brand': 'suzuki', 'value': 'SX4', 'title': 'SX4'.tr()},
  {'brand': 'suzuki', 'value': 'Vitaire', 'title': 'Vitaire'.tr()},
  {'brand': 'suzuki', 'value': 'Wagon R +', 'title': 'Wagon R +'.tr()},
  {'brand': 'suzuki', 'value': 'Other', 'title': 'Other'.tr()},
];
List<Map<String, String>> nissan = [
  {'brand': 'nissan', 'value': '200 SX', 'title': '200 SX'.tr()},
  {'brand': 'nissan', 'value': '300 ZX', 'title': 'Baleno'.tr()},
  {'brand': 'nissan', 'value': '370 Z', 'title': '370 Z'.tr()},
  {'brand': 'nissan', 'value': 'Almera', 'title': 'Almera'.tr()},
  {'brand': 'nissan', 'value': 'Ariya', 'title': 'Ariya'.tr()},
  {'brand': 'nissan', 'value': 'e-NV200', 'title': 'e-NV200'.tr()},
  {'brand': 'nissan', 'value': 'GT-R', 'title': 'GT-R'.tr()},
  {'brand': 'nissan', 'value': 'Interstar', 'title': 'Interstar'.tr()},
  {'brand': 'nissan', 'value': 'Juke', 'title': 'Juke'.tr()},
  {
    'brand': 'nissan',
    'value': 'King Cab / Navara',
    'title': 'King Cab / Navara'.tr()
  },
  {'brand': 'nissan', 'value': 'Cubists', 'title': 'Cubists'.tr()},
  {'brand': 'nissan', 'value': 'Leaf', 'title': 'Leaf'.tr()},
  {'brand': 'nissan', 'value': 'Maxima', 'title': 'Maxima'.tr()},
  {'brand': 'nissan', 'value': 'Micra', 'title': 'Micra'.tr()},
  {'brand': 'nissan', 'value': 'Murano', 'title': 'Murano'.tr()},
  {'brand': 'nissan', 'value': 'Note', 'title': 'Note'.tr()},
  {'brand': 'nissan', 'value': 'NV200', 'title': 'NV200'.tr()},
  {'brand': 'nissan', 'value': 'NV250', 'title': 'NV250'.tr()},
  {'brand': 'nissan', 'value': 'NV300', 'title': 'NV300'.tr()},
  {'brand': 'nissan', 'value': 'NV400', 'title': 'NV400'.tr()},
  {'brand': 'nissan', 'value': 'Pathfinder', 'title': 'Pathfinder'.tr()},
  {'brand': 'nissan', 'value': 'Patrol', 'title': 'Patrol'.tr()},
  {'brand': 'nissan', 'value': 'primastar', 'title': 'primastar'.tr()},
  {'brand': 'nissan', 'value': 'pulses', 'title': 'pulses'.tr()},
  {'brand': 'nissan', 'value': 'Qashqai', 'title': 'Qashqai'.tr()},
  {'brand': 'nissan', 'value': 'Sunny', 'title': 'Sunny'.tr()},
  {'brand': 'nissan', 'value': 'Terrano', 'title': 'Terrano'.tr()},
  {'brand': 'nissan', 'value': 'Titanium', 'title': 'Titanium'.tr()},
  {'brand': 'nissan', 'value': 'Townstar', 'title': 'Townstar'.tr()},
  {'brand': 'nissan', 'value': 'X Trail', 'title': 'X Trail'.tr()},
  {'brand': 'nissan', 'value': 'Other', 'title': 'Other'.tr()},
];
List<Map<String, String>> ford = [
  {'brand': 'ford', 'value': 'B-Max', 'title': 'B-Max'.tr()},
  {'brand': 'ford', 'value': 'Bronco', 'title': 'Bronco'.tr()},
  {'brand': 'ford', 'value': 'C-Max', 'title': 'C-Max'.tr()},
  {'brand': 'ford', 'value': 'Connect', 'title': 'Connect'.tr()},
  {'brand': 'ford', 'value': 'Cougar', 'title': 'Cougar'.tr()},
  {'brand': 'ford', 'value': 'Courier', 'title': 'e-NV200'.tr()},
  {'brand': 'ford', 'value': 'Custom', 'title': 'Custom'.tr()},
  {'brand': 'ford', 'value': 'Ecosport', 'title': 'Ecosport'.tr()},
  {'brand': 'ford', 'value': 'Edge', 'title': 'Edge'.tr()},
  {'brand': 'ford', 'value': 'Escort', 'title': 'Escort'.tr()},
  {'brand': 'ford', 'value': 'Expedition', 'title': 'Expedition'.tr()},
  {'brand': 'ford', 'value': 'Explorer', 'title': 'Explorer'.tr()},
  {'brand': 'ford', 'value': 'F150', 'title': 'F150'.tr()},
  {'brand': 'ford', 'value': 'F250', 'title': 'F250'.tr()},
  {'brand': 'ford', 'value': 'F450', 'title': 'F450'.tr()},
  {'brand': 'ford', 'value': 'Fiesta', 'title': 'Fiesta'.tr()},
  {'brand': 'ford', 'value': 'Focus', 'title': 'Focus'.tr()},
  {'brand': 'ford', 'value': 'Fusion', 'title': 'Fusion'.tr()},
  {'brand': 'ford', 'value': 'Galaxy', 'title': 'Galaxy'.tr()},
  {'brand': 'ford', 'value': 'GT', 'title': 'GT'.tr()},
  {'brand': 'ford', 'value': 'Ka', 'title': 'Ka'.tr()},
  {'brand': 'ford', 'value': 'Kuga', 'title': 'Kuga'.tr()},
  {'brand': 'ford', 'value': 'Maverick', 'title': 'Maverick'.tr()},
  {'brand': 'ford', 'value': 'Mondeo', 'title': 'Mondeo'.tr()},
  {'brand': 'ford', 'value': 'Mustang', 'title': 'Mustang'.tr()},
  {'brand': 'ford', 'value': 'Puma', 'title': 'Puma'.tr()},
  {'brand': 'ford', 'value': 'Ranger', 'title': 'Ranger'.tr()},
  {'brand': 'ford', 'value': 'Raptor', 'title': 'Raptor'.tr()},
  {'brand': 'ford', 'value': 'S-Max', 'title': 'S-Max'.tr()},
  {'brand': 'ford', 'value': 'Scorpio', 'title': 'Scorpio'.tr()},
  {'brand': 'ford', 'value': 'Sierra', 'title': 'Sierra'.tr()},
  {'brand': 'ford', 'value': 'Thunderbird', 'title': 'Thunderbird'.tr()},
  {'brand': 'ford', 'value': 'Tourneo', 'title': 'Tourneo'.tr()},
  {'brand': 'ford', 'value': 'transit', 'title': 'transit'.tr()},
  {'brand': 'ford', 'value': 'Windstar', 'title': 'Windstar'.tr()},
  {'brand': 'ford', 'value': 'Other', 'title': 'Other'.tr()},
];

List<Map<String, String>> volswagen = [
  {'brand': 'volkswagen', 'value': 'Amarok', 'title': 'Amarok'.tr()},
  {'brand': 'volkswagen', 'value': 'Arteon', 'title': 'Arteon'.tr()},
  {'brand': 'volkswagen', 'value': 'Beetle', 'title': 'Beetle'.tr()},
  {'brand': 'volkswagen', 'value': 'Bora', 'title': 'Bora'.tr()},
  {'brand': 'volkswagen', 'value': 'bubble', 'title': 'bubble'.tr()},
  {'brand': 'volkswagen', 'value': 'Caddy', 'title': 'Caddy'.tr()},
  {'brand': 'volkswagen', 'value': 'California', 'title': 'California'.tr()},
  {'brand': 'volkswagen', 'value': 'CC', 'title': 'CC'.tr()},
  {'brand': 'volkswagen', 'value': 'Corrado', 'title': 'Corrado'.tr()},
  {'brand': 'volkswagen', 'value': 'Crafter', 'title': 'Crafter'.tr()},
  {'brand': 'volkswagen', 'value': 'E-crafter', 'title': 'E-crafter'.tr()},
  {'brand': 'volkswagen', 'value': 'e-UP', 'title': 'e-UP'.tr()},
  {'brand': 'volkswagen', 'value': 'Eos', 'title': 'Eos'.tr()},
  {'brand': 'volkswagen', 'value': 'Fox', 'title': 'Fox'.tr()},
  {'brand': 'volkswagen', 'value': 'Golf', 'title': 'Golf'.tr()},
  {'brand': 'volkswagen', 'value': 'ID.3', 'title': 'ID.3'.tr()},
  {'brand': 'volkswagen', 'value': 'ID.4', 'title': 'ID.4'.tr()},
  {'brand': 'volkswagen', 'value': 'ID.5', 'title': 'ID.5'.tr()},
  {'brand': 'volkswagen', 'value': 'ID Buzz', 'title': 'ID Buzz'.tr()},
  {'brand': 'volkswagen', 'value': 'Jetta', 'title': 'Jetta'.tr()},
  {'brand': 'volkswagen', 'value': 'Lupo', 'title': 'Lupo'.tr()},
  {'brand': 'volkswagen', 'value': 'Passed', 'title': 'Passed'.tr()},
  {'brand': 'volkswagen', 'value': 'Phaeton', 'title': 'Phaeton'.tr()},
  {'brand': 'volkswagen', 'value': 'Polo', 'title': 'Polo'.tr()},
  {'brand': 'volkswagen', 'value': 'Scirocco', 'title': 'Scirocco'.tr()},
  {'brand': 'volkswagen', 'value': 'Sharan', 'title': 'Sharan'.tr()},
  {'brand': 'volkswagen', 'value': 'T-Cross', 'title': 'T-Cross'.tr()},
  {'brand': 'volkswagen', 'value': 'T-Roc', 'title': 'T-Roc'.tr()},
  {'brand': 'volkswagen', 'value': 'T5', 'title': 'T5'.tr()},
  {'brand': 'volkswagen', 'value': 'T6', 'title': 'T6'.tr()},
  {'brand': 'volkswagen', 'value': 'Taigo', 'title': 'Taigo'.tr()},
  {'brand': 'volkswagen', 'value': 'Tiguan', 'title': 'Tiguan'.tr()},
  {
    'brand': 'volkswagen',
    'value': 'Tiguan Allspace',
    'title': 'Tiguan Allspace'.tr()
  },
  {'brand': 'volkswagen', 'value': 'Touareg', 'title': 'Touareg'.tr()},
  {'brand': 'volkswagen', 'value': 'Touran', 'title': 'Touran'.tr()},
  {
    'brand': 'volkswagen',
    'value': 'Transport / Caravelle',
    'title': 'Transport / Caravelle'.tr()
  },
  {'brand': 'volkswagen', 'value': 'Up', 'title': 'Up'.tr()},
  {'brand': 'volkswagen', 'value': 'Vento', 'title': 'Vento'.tr()},
  {'brand': 'volkswagen', 'value': 'Other', 'title': 'Other'.tr()},
];

List<Map<String, String>> mercedes = [
  {'brand': 'mercedes', 'value': 'AMG models', 'title': 'AMG models'.tr()},
  {'brand': 'mercedes', 'value': 'B class', 'title': 'B class'.tr()},
  {'brand': 'mercedes', 'value': 'C class', 'title': 'C class'.tr()},
  {'brand': 'mercedes', 'value': 'Citan', 'title': 'Citan'.tr()},
  {'brand': 'mercedes', 'value': 'CL', 'title': 'CL'.tr()},
  {'brand': 'mercedes', 'value': 'CLA', 'title': 'CLA'.tr()},
  {'brand': 'mercedes', 'value': 'CLC', 'title': 'CLC'.tr()},
  {'brand': 'mercedes', 'value': 'CLK', 'title': 'CLK'.tr()},
  {'brand': 'mercedes', 'value': 'CLS', 'title': 'CLS'.tr()},
  {'brand': 'mercedes', 'value': 'E-class', 'title': 'E-class'.tr()},
  {'brand': 'mercedes', 'value': 'EQA', 'title': 'EQA'.tr()},
  {'brand': 'mercedes', 'value': 'EQB', 'title': 'EQB'.tr()},
  {'brand': 'mercedes', 'value': 'EQC', 'title': 'EQC'.tr()},
  {'brand': 'mercedes', 'value': 'EQE', 'title': 'EQE'.tr()},
  {'brand': 'mercedes', 'value': 'EQS', 'title': 'EQS'.tr()},
  {'brand': 'mercedes', 'value': 'EQV', 'title': 'EQV'.tr()},
  {'brand': 'mercedes', 'value': 'eVito', 'title': 'eVito'.tr()},
  {'brand': 'mercedes', 'value': 'G-Klass', 'title': 'G-Klass'.tr()},
  {'brand': 'mercedes', 'value': 'GL', 'title': 'GL'.tr()},
  {'brand': 'mercedes', 'value': 'GLA', 'title': 'GLA'.tr()},
  {'brand': 'mercedes', 'value': 'GLB', 'title': 'GLB'.tr()},
  {'brand': 'mercedes', 'value': 'GLC', 'title': 'GLC'.tr()},
  {'brand': 'mercedes', 'value': 'GLE', 'title': 'GLE'.tr()},
  {'brand': 'mercedes', 'value': 'GLK', 'title': 'GLK'.tr()},
  {'brand': 'mercedes', 'value': 'ML', 'title': 'ML'.tr()},
  {'brand': 'mercedes', 'value': 'R-klass', 'title': 'R-klass'.tr()},
  {'brand': 'mercedes', 'value': 'S-klass', 'title': 'S-klass'.tr()},
  {'brand': 'mercedes', 'value': 'SL', 'title': 'SL'.tr()},
  {'brand': 'mercedes', 'value': 'SLC', 'title': 'SLC'.tr()},
  {'brand': 'mercedes', 'value': 'SLK', 'title': 'SLK'.tr()},
  {'brand': 'mercedes', 'value': 'SLS', 'title': 'SLS'.tr()},
  {'brand': 'mercedes', 'value': 'sprinter', 'title': 'sprinter'.tr()},
  {'brand': 'mercedes', 'value': 'T', 'title': 'T'.tr()},
  {'brand': 'mercedes', 'value': 'V class', 'title': 'V class'.tr()},
  {'brand': 'mercedes', 'value': 'X class', 'title': 'X class'.tr()},
  {'brand': 'mercedes', 'value': 'Other', 'title': 'Other'.tr()},
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
  {
    'value': 'Mekele',
    'title': 'Mekele'.tr(),
    'brand': 'Tigray'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Āksum',
    'title': 'Axum'.tr(),
    'brand': 'Tigray'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Adwa',
    'title': 'Adwa'.tr(),
    'brand': 'Tigray'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Ādīgrat',
    'title': 'Adigrat'.tr(),
    'brand': 'Tigray'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Shire',
    'title': 'Shire'.tr(),
    'brand': 'Tigray'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Bahir Dar',
    'title': 'BahirDar'.tr(),
    'brand': 'Amhara'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Gondar',
    'title': 'Gonder'.tr(),
    'brand': 'Amhara'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Desē',
    'title': 'Dessye'.tr(),
    'brand': 'Amhara'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Kombolcha',
    'title': 'Kombolcha'.tr(),
    'brand': 'Amhara'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Debre Birhan',
    'title': 'DebreBirhan'.tr(),
    'brand': 'Amhara'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Jīma',
    'title': 'Jimma'.tr(),
    'brand': 'Oromia'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Nazrēt',
    'title': 'Nazreth'.tr(),
    'brand': 'Oromia'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Shashemenē',
    'title': 'Shashamanni'.tr(),
    'brand': 'Oromia'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Bishoftu',
    'title': 'Bishoftu'.tr(),
    'brand': 'Oromia'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Nekemte',
    'title': 'Nekemte'.tr(),
    'brand': 'Oromia'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Hawassa',
    'title': 'Hawassa'.tr(),
    'brand': 'South'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Ārba Minch’',
    'title': 'Arba'.tr(),
    'brand': 'South'.tr(),
    'body': 'SUV'
  },
  {'value': 'Sodo', 'title': 'Sodo'.tr(), 'brand': 'South'.tr(), 'body': 'SUV'},
  {
    'value': 'Jijiga',
    'title': 'Jijiga'.tr(),
    'brand': 'Somali'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Semera',
    'title': 'Semera'.tr(),
    'brand': 'Afar'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Harar',
    'title': 'Harar'.tr(),
    'brand': 'Harar'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Addis Ababa',
    'title': 'Addis'.tr(),
    'brand': 'Addis'.tr(),
    'body': 'SUV'
  },
  {
    'value': 'Dire Dawa',
    'title': 'Dire'.tr(),
    'brand': 'Dire'.tr(),
    'body': 'SUV'
  },
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
  S2Choice<String>(
    value: '1.0-1,2 Litre engine',
    title: '1.0-1,2 Litre engine'.tr(),
  ),
  S2Choice<String>(
    value: '1.4-1.6 Lite engine',
    title: '1.4-1.6 Lite engine'.tr(),
  ),
  S2Choice<String>(
    value: '1.8-2.0 Litre engine',
    title: '1.8-2.0 Litre engine'.tr(),
  ),
  S2Choice<String>(
    value: '2.2=3.0 Litre engine',
    title: '2.2=3.0 Litre engine'.tr(),
  ),
  S2Choice<String>(
    value: '> 3.5  Litre Engine',
    title: '> 3.5  Litre Engine'.tr(),
  ),
];
List<S2Choice<String>> Fuel = [
  S2Choice<String>(
    value: 'Diesel',
    title: 'Diesel'.tr(),
  ),
  S2Choice<String>(
    value: 'Gasoline',
    title: 'Gasoline'.tr(),
  ),
];
List<S2Choice<String>> color = [
  S2Choice<String>(
    value: 'Grey',
    title: 'Grey'.tr(),
  ),
  S2Choice<String>(
    value: 'Black',
    title: 'Black'.tr(),
  ),
  S2Choice<String>(
    value: 'White',
    title: 'White'.tr(),
  ),
  S2Choice<String>(
    value: 'Blue',
    title: 'Blue'.tr(),
  ),
  S2Choice<String>(
    value: 'Red',
    title: 'Red'.tr(),
  ),
  S2Choice<String>(
    value: 'Silver',
    title: 'Silver'.tr(),
  ),
  S2Choice<String>(
    value: 'Green',
    title: 'Green'.tr(),
  ),
  S2Choice<String>(
    value: 'Orange',
    title: 'Orange'.tr(),
  ),
  S2Choice<String>(
    value: 'Yellow',
    title: 'Yellow'.tr(),
  ),
];
List<S2Choice<String>> year = [
  S2Choice<String>(value: '2023', title: '2023'),
  S2Choice<String>(value: '2022', title: '2022'),
  S2Choice<String>(value: '2021', title: '2021'),
  S2Choice<String>(value: '2020', title: '2020'),
  S2Choice<String>(value: '2019', title: '2019'),
  S2Choice<String>(value: '2018', title: '2018'),
  S2Choice<String>(value: '2017', title: '2017'),
  S2Choice<String>(value: '2016', title: '2016'),
  S2Choice<String>(value: '2015', title: '2015'),
  S2Choice<String>(value: '2014', title: '2014'),
  S2Choice<String>(value: '2013', title: '2013'),
  S2Choice<String>(value: '2012', title: '2012'),
  S2Choice<String>(value: '2011', title: '2011'),
  S2Choice<String>(value: '2010', title: '2010'),
  S2Choice<String>(value: '2009', title: '2009'),
  S2Choice<String>(value: '2008', title: '2008'),
  S2Choice<String>(value: '2007', title: '2007'),
  S2Choice<String>(value: '2006', title: '2006'),
  S2Choice<String>(value: '2005', title: '2005'),
  S2Choice<String>(value: '2004', title: '2004'),
  S2Choice<String>(value: '2003', title: '2003'),
  S2Choice<String>(value: '2002', title: '2002'),
  S2Choice<String>(value: '2001', title: '2001'),
  S2Choice<String>(value: '2000', title: '2000')
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
