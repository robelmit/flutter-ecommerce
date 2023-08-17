// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app/models/Categorypro.dart';
import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:app/screens/postad.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/search_bar.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:location/location.dart';
import 'package:awesome_select/awesome_select.dart';

import '../constants/colors.dart';
import '../constants/dropdown.dart';
import '../models/category.dart';
import '../utils/screen_utils.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/deal_card.dart';
import '../widgets/indi_deal_card.dart';
import '../widgets/tab_title.dart';
import '../widgets/category_card_home.dart';
import './search_screen.dart';
import './category_screen.dart';
import './popular_deals_screen.dart';
import './special_deal_screen.dart';
import './MyApp.dart';
import 'package:chapasdk/chapasdk.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../constants/choices.dart' as choices;

var api = new Api();
String? search = null;
final minprice = TextEditingController();
final maxprice = TextEditingController();
List? adds = null;
List addspro = [];
bool isloadingmore = false;
int page = 1;
List<String> tags = [];
double _value = 0.0;
String? latitude = '';
String? longitude = "";
List realtags = [];
final List<String> categorie = [
  'phones'.tr(),
  'electronics'.tr(),
  'vehicles'.tr(),
  'property'.tr(),
  'homesupplies'.tr(),
  'fashion'.tr(),
  'animals'.tr(),
];
var filtersbro = {};
final List<String> categoriestosen = [
  'phones',
  'electronics',
  'vehicles',
  'property',
  'homesupplies',
  'fashion',
  'animals',
];

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class HomeScreen1 extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  getadds() async {
    adds = null;
    page = 1;
    adds = await api.getadds(search, page);
    setState(() {});
  }

  Timer? _debounce;
  GroupController controller = GroupController();
  List<String> suggestons = [
    "house",
    "ቤት",
    "ገዛ",
    "car",
    "መኪና",
    "samsung",
    "ሳምሰንግ",
    "nokia",
    "ኖክያ",
    "vitz",
    "ቪትዝ",
    "corolla",
    "ኮሮላ",
    "tecno" "ቴክኖ",
    "iphone",
    "ኣይፎን",
    "television",
    'ቴሌቪዝን',
    "camera",
    "ካሜራ",
    "laptop",
    "ላፕቶፕ",
    "desktop",
    "ዴስክቶፕ",
    "headphone",
    "ሄድ ፎን",
    "sofa",
    "ሶፋ",
    "fridge",
    "ፍሪጅ",
    "bed",
    "ኣልጋ",
    "ዓራት",
    "microwave",
    "ማይክሮዌቭ",
    "table",
    "ጠረቤዛ",
    "chair",
    "ወንበር",
    "cloth",
    "ልብስ",
    "shoe",
    "ጫማ",
    "watch",
    "ሰዓት",
    "bags",
    "ቦርሳ",
    "toyota",
    "ቶዮታ",
    "hyundai",
    "ሃዩንዳይ",
    "suzuki",
    "ሱዙኪ",
    "nissan",
    "ኒሳን",
    "ford",
    "ፎርድ",
    "volswagen",
    "ቮልስዋገን",
    "buses",
    "ባስ",
    "truck",
    "የጭነት መኪና",
    "ናይ ፅዕነት መኪና",
    "heavyequipment",
    "apartment",
    "አፓርታመንት",
    "condominium",
    "ኮንዶሚየም",
    "villa",
    "ቪላ",
    "dogs",
    "ውሻ",
    "birds",
    "አዕዋፍ",
    "cats",
    "ድመት",
  ];
  var textcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState;
    print('testing payment method');
    page = 1;
    getadds();
    getlocation();
    super.initState();
  }

  getlocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    latitude = prefs.getString('latitude');
    longitude = prefs.getString('longitude');
    print(latitude);
    print(longitude);
    //  await prefs.setString('latitude', '14.10567');
    //  await prefs.setString('longitude', '38.284945');
    print('hey yo');
    setState(() {});
  }

  @override
  void dispose() {
    adds = null;
    search = null;
    page = 1;
    isloadingmore = false;
    longitude = '';
    latitude = '';
    realtags = [];
    _value = 0.0;

    super.dispose();
  }

  void _showForm() async {
    String status = 'all';
    List<S2Choice<String>> statusoptions = [
      S2Choice<String>(value: 'all', title: 'All'),
      S2Choice<String>(value: 'new', title: 'Brand New'),
      S2Choice<String>(value: 'old', title: 'Old'),
    ];
    String filter = '';
    List<S2Choice<String>> filters = [
      S2Choice<String>(value: 'newest', title: 'Newest'),
      S2Choice<String>(value: 'pricelow', title: 'Price low'),
      S2Choice<String>(value: 'pricemax', title: 'Highest price'),
    ];
    String selectedadd = '';
    // String selectedaddcatagory = '';

    String region = 'all';

    List<String> selectedaddcatagory = [];
    List<Map<String, String>> items = [];
    checker(selectedValue) {
      if (selectedValue == 'phones') {
        items = choices.phone;
        setState(() {});
        print('phones');
      } else if (selectedValue == 'electronics') {
        items = choices.electronics;
        setState(() {});
        print('electronics');
      } else if (selectedValue == 'vehicles') {
        items = choices.vehicles;
        setState(() {});
        print('vehicles');
      } else if (selectedValue == 'property') {
        items = choices.house;
        setState(() {});
        print('property');
      } else if (selectedValue == 'homesupplies') {
        items = choices.homesupply;
        setState(() {});
        print('homesupplies');
      } else if (selectedValue == 'fashion') {
        items = choices.cloth;
        setState(() {});
        print('fashion');
      } else if (selectedValue == 'animals') {
        items = choices.animals;
        setState(() {});
        print('animals');
      }
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setStatehere) {
              Map allfilters = {
                "region": region,
                "catagory": selectedadd,
                "subcatagory": selectedaddcatagory,
                "status": status,
                "filter": filter,
                "tags": tags,
                "distance": _value,
                "minprice": minprice.text,
                "maxprice": maxprice.text
              };
              return FractionallySizedBox(
                heightFactor: 0.9,
                child: SingleChildScrollView(
                  child: Container(
                    // color: Color.fromARGB(255, 241, 241, 245),
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                      // this will prevent the soft keyboard from covering the text fields
                      bottom: MediaQuery.of(context).viewInsets.bottom + 120,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text('Filter the adds'.tr()),
                              TextButton(
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ]),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: Color(0xFFE4E4E6))),
                          child: SmartSelect<String>.single(
                            title: 'Select region',
                            // placeholder: 'Choose one',
                            selectedValue: region,
                            onChange: (selected) =>
                                setStatehere(() => region = selected.value),
                            choiceItems: choices.regions,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: Color(0xFFE4E4E6))),
                          child: SmartSelect<String>.single(
                            title: 'Choose ad catagory',
                            placeholder: 'Choose one',
                            selectedValue: selectedadd,
                            onChange: (selected) {
                              selectedadd = selected.value;
                              checker(selected.value);
                              setStatehere(
                                () {},
                              );
                            },
                            choiceItems: choices.catagory,
                            // choiceGrouped: true,
                            // modalFilter: true,
                            modalFilterAuto: true,
                          ),
                        ),
                        SizedBox(height: 5),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: Color(0xFFE4E4E6))),
                          child: SmartSelect<String>.multiple(
                            title: 'Choose sub catagory ',
                            placeholder: 'Choose one',
                            selectedValue: selectedaddcatagory,
                            onChange: (selected) => setStatehere(
                                () => selectedaddcatagory = selected.value),
                            choiceItems:
                                S2Choice.listFrom<String, Map<String, String>>(
                              source: items,
                              value: (index, item) => item['value'] ?? '',
                              title: (index, item) => item['title'] ?? '',
                              group: (index, item) => item['brand'] ?? '',
                            ),
                            // choiceGrouped: true,
                            // modalFilter: true,
                            modalFilterAuto: true,
                            tileBuilder: (context, state) {
                              return S2Tile.fromState(
                                state,
                                // isLoading: _usersIsLoading,
                                hideValue: true,

                                body: S2TileChips(
                                  scrollable: true,
                                  chipLength: state.selected.length,
                                  chipLabelBuilder: (context, i) {
                                    return Text(
                                        state.selected.choice?[i].title ?? '',
                                        style: TextStyle(fontSize: 14));
                                  },
                                  chipAvatarBuilder: (context, i) => CircleAvatar(
                                      // backgroundImage: NetworkImage(
                                      //   state.selected.choice?[i].meta['picture']
                                      //       ['thumbnail'],
                                      // backgroundColor: Theme.of(context).primaryColor,
                                      ),
                                  chipOnDelete: (i) {
                                    print('this is cool');
                                    selectedaddcatagory.remove(
                                        state.selected.choice?[i].value);
                                    setStatehere(() => {});
                                  },
                                  chipColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  chipRaised: false,
                                  placeholder: Container(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 5),

                        // Row(children: [
                        //   Expanded(
                        //     child: TextField(
                        //       decoration: InputDecoration(
                        //         hintText: 'Enter low price ',
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.only(
                        //               bottomLeft: Radius.circular(12),
                        //               bottomRight: Radius.circular(12),
                        //               topLeft: Radius.circular(12),
                        //               topRight: Radius.circular(12)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   SizedBox(width: 10),
                        //   Expanded(
                        //     child: TextField(
                        //       decoration: InputDecoration(
                        //         hintText: 'Enter max price ',
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.only(
                        //               bottomLeft: Radius.circular(12),
                        //               bottomRight: Radius.circular(12),
                        //               topLeft: Radius.circular(12),
                        //               topRight: Radius.circular(12)),
                        //         ),
                        //       ),
                        //     ),
                        //   )
                        // ]),
                        //         MultiSelectChipField(
                        //   items: _items,
                        //   initialValue: [_animals[4], _animals[7], _animals[9]],
                        //   title: Text("Animals"),
                        //   headerColor: Colors.blue.withOpacity(0.5),
                        //   // decoration: BoxDecoration(
                        //   //   border: Border.all(color: Colors.blue[700], width: 1.8),
                        //   // ),
                        //   selectedChipColor: Colors.blue.withOpacity(0.5),
                        //   selectedTextStyle: TextStyle(color: Colors.blue[800]),
                        //   onTap: (values) {
                        //     //_selectedAnimals4 = values;
                        //   },
                        // ),
                        // ChipsChoice<String>.multiple(
                        //   clipBehavior: Clip.none,
                        //   alignment: WrapAlignment.spaceEvenly,
                        //   value: tags,
                        //   onChanged: (val) => setStatehere(() => tags = val),
                        //   choiceItems: C2Choice.listFrom<String, String>(
                        //     source: categorie,
                        //     value: (i, v) => v,
                        //     label: (i, v) => v,
                        //   ),
                        // ),
                        // SimpleGroupedChips<String>(
                        //   controller: controller,
                        //   values: categoriestosen,
                        //   itemTitle: categorie,
                        //   chipGroupStyle: ChipGroupStyle.minimize(
                        //     backgroundColorItem: Theme.of(context).primaryColor,
                        //     itemTitleStyle: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 14,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.2, color: Color(0xFFE4E4E6))),
                          child: SmartSelect<String>.single(
                              title: 'Select status',
                              modalType: S2ModalType.bottomSheet,
                              selectedValue: status,
                              // modalFilter:true,
                              choiceItems: statusoptions,
                              // modalType: ,
                              onChange: (state) =>
                                  setState(() => status = state.value)),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(FullScreenSearchModal());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 18),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.2, color: Color(0xFFE4E4E6))),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 52,
                                child: Text('Enter custom price',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 15)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.2, color: Color(0xFFE4E4E6))),
                              child: SmartSelect<String>.single(
                                  title: 'Filter by',
                                  selectedValue: filter,
                                  // modalFilter:true,
                                  choiceItems: filters,
                                  modalType: S2ModalType.bottomSheet,
                                  // modalType: ,
                                  onChange: (state) =>
                                      setStatehere(() => filter = state.value)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Choose distance in km'.tr(),
                                style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SfSlider(
                          min: 0,
                          max: 200,
                          value: _value,
                          interval: 50,
                          showTicks: true,
                          stepSize: 5.0,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setStatehere(() {
                              _value = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                            child: Text('Filter'.tr()),
                            onPressed: () async {
                              //  for (int i = 0; i < tags.length; i++) {
                              //         var index = categorie.indexOf(tags[i]);
                              //         realtags.add(categoriestosen[index]);
                              //       }
                              //       // print('realtags');
                              //       // print(realtags);
                              //       // allfilters["tags"] = realtags;
                              //       print(allfilters);
                              allfilters['latitude'] = double.parse(latitude!);
                              allfilters['longitude'] =
                                  double.parse(longitude!);
                              page = 1;
                              adds = await api.getaddsbyfilters(
                                  search, allfilters, page);
                              print('check');
                              print(adds!);
                              setState(() => {});
                              filtersbro = allfilters;

                              //   if (tags.isEmpty && _value == 0.0) {
                              //     Navigator.pop(context);
                              //   } else if (tags.isNotEmpty && _value == 0.0) {
                              //     print('tags');

                              //     Navigator.pop(context);

                              //     page = 1;
                              //     adds = [];

                              //     setState(() {});

                              //     setState(() {});
                              //   } else if (tags.isEmpty && _value != 0.0) {
                              //     print('location');
                              //     Navigator.pop(context);
                              //     page = 1;
                              //     adds = [];
                              //     print(double.parse(latitude!));
                              //     print(double.parse(longitude!));

                              //     adds = await api.getaddsbylocation(
                              //         search,
                              //         double.parse(latitude!),
                              //         double.parse(longitude!),
                              //         _value.toInt(),
                              //         page);
                              //     setState(() {});
                              //   } else if (tags.isNotEmpty && _value != 0.0) {
                              //     Navigator.pop(context);
                              //     adds = [];
                              //     adds = await api.getaddsfull(
                              //         search,
                              //         double.parse(latitude!),
                              //         double.parse(longitude!),
                              //         _value.toInt(),
                              //         tags,
                              //         page);
                              //     setState(() {});
                              //   }
                              //   // Save new journal
                              // },

                              // Clear the text fields

                              // Close the bottom sheet
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        'phones'.tr(),
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Category(
        'electronics'.tr(),
        'assets/images/television pro.svg',
        kAccentYellow,
      ),
      Category(
        'vehicles'.tr(),
        'assets/images/car.svg',
        kAccentTosca,
      ),
      Category(
        'property'.tr(),
        'assets/images/house.svg',
        kAccentGreen,
      ),
      Category(
        'homesupplies'.tr(),
        'assets/images/sofa.svg',
        kAccentPurple,
      ),
      Category(
        'fashion'.tr(),
        'assets/images/shoe.svg',
        kAccentPurple,
      ),
      Category(
        'animals'.tr(),
        'assets/images/dog.svg',
        kAccentYellow,
      ),
    ];
    final List<Categorypro> categoriestosend = [
      Categorypro(
        'phones',
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Categorypro(
        'electronics',
        'assets/images/television pro.svg',
        kAccentYellow,
      ),
      Categorypro(
        'vehicles',
        'assets/images/car.svg',
        kAccentTosca,
      ),
      Categorypro(
        'property',
        'assets/images/house.svg',
        kAccentGreen,
      ),
      Categorypro(
        'homesupplies',
        'assets/images/sofa.svg',
        kAccentPurple,
      ),
      Categorypro(
        'fashion',
        'assets/images/shoe.svg',
        kAccentPurple,
      ),
      Categorypro(
        'animals',
        'assets/images/dog.svg',
        kAccentYellow,
      ),
    ];
    ScreenUtils().init(context);
    FocusScope.of(context).unfocus();

    return SafeArea(
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.,
        children: [
          //   Spacer(),
          //HomeAppBar(),
          // TextField(
          //   onChanged: ((value) => {
          //         if (_debounce?.isActive ?? false) {_debounce!.cancel()},
          //         _debounce = Timer(const Duration(milliseconds: 1000), () {
          //           search = value.toString();
          //           setState(() {});
          //           getadds();
          //         })
          //       }),
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: kFillColorThird,
          //     prefixIcon: IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {},
          //     ),
          //     suffixIcon: IconButton(
          //       icon: Icon(Icons.filter_alt),
          //       onPressed: () async {
          //         // ignore: unnecessary_null_comparison
          //         // _showForm();

          //         if (!(latitude == null)) {
          //           print('location');
          //           _showForm();
          //         } else {
          //           print('location b');

          //           Location location = new Location();

          //           bool _serviceEnabled;
          //           PermissionStatus _permissionGranted;
          //           LocationData _locationData;

          //           _serviceEnabled = await location.serviceEnabled();
          //           if (!_serviceEnabled) {
          //             _serviceEnabled = await location.requestService();
          //             if (!_serviceEnabled) {
          //               return;
          //             }
          //           }

          //           _permissionGranted = await location.hasPermission();
          //           if (_permissionGranted == PermissionStatus.denied) {
          //             _permissionGranted = await location.requestPermission();
          //             if (_permissionGranted != PermissionStatus.granted) {
          //               return;
          //             }
          //           }

          //           _locationData = await location.getLocation();
          //           SharedPreferences prefs =
          //               await SharedPreferences.getInstance();
          //           prefs.setString(
          //               'latitude', _locationData.latitude.toString());
          //           prefs.setString(
          //               'longitude', _locationData.longitude.toString());
          //           //_showForm();
          //         }
          //       },
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(
          //         getProportionateScreenWidth(4),
          //       ),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(
          //         getProportionateScreenWidth(8),
          //       ),
          //       borderSide: BorderSide(
          //         color: Colors.transparent,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(
          //         getProportionateScreenWidth(8),
          //       ),
          //       borderSide: BorderSide(
          //         color: Colors.transparent,
          //       ),
          //     ),
          //     hintText: 'searchanadd'.tr(),
          //     contentPadding: EdgeInsets.symmetric(
          //       vertical: getProportionateScreenHeight(
          //         10,
          //       ),
          //     ),
          //     hintStyle: TextStyle(
          //       color: kGreyShade2,
          //       //fontSize: getProportionateScreenWidth(17),
          //     ),
          //   ),
          //   style: TextStyle(
          //     fontWeight: FontWeight.w300,
          //   ),
          // ),
          TypeAheadField(
            minCharsForSuggestions: 2,
            hideOnEmpty: true,
            hideOnLoading: true,
            keepSuggestionsOnLoading: false,
            animationStart: 0,
            animationDuration: Duration.zero,
            textFieldConfiguration: TextFieldConfiguration(
              controller: textcontroller,
              onChanged: ((value) => {
                    if (_debounce?.isActive ?? false) {_debounce!.cancel()},
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      search = value.toString();
                      setState(() {});
                      getadds();
                    })
                  }),
              autofocus: true,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: kFillColorThird,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () async {
                    // ignore: unnecessary_null_comparison
                    // _showForm();

                    if (!(latitude == null)) {
                      print('location');
                      _showForm();
                    } else {
                      print('location b');

                      Location location = new Location();

                      bool _serviceEnabled;
                      PermissionStatus _permissionGranted;
                      LocationData _locationData;

                      _serviceEnabled = await location.serviceEnabled();
                      if (!_serviceEnabled) {
                        _serviceEnabled = await location.requestService();
                        if (!_serviceEnabled) {
                          return;
                        }
                      }

                      _permissionGranted = await location.hasPermission();
                      if (_permissionGranted == PermissionStatus.denied) {
                        _permissionGranted = await location.requestPermission();
                        if (_permissionGranted != PermissionStatus.granted) {
                          return;
                        }
                      }

                      _locationData = await location.getLocation();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString(
                          'latitude', _locationData.latitude.toString());
                      prefs.setString(
                          'longitude', _locationData.longitude.toString());
                      //_showForm();
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(4),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8),
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(8),
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: 'searchanadd'.tr(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(
                    10,
                  ),
                ),
                hintStyle: TextStyle(
                  color: kGreyShade2,
                  //fontSize: getProportionateScreenWidth(17),
                ),
              ),
            ),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
              color: Colors.white,
              // color: Colors.lightBlue[50]
            ),
            suggestionsCallback: (pattern) {
              List<String> matches = <String>[];
              matches.addAll(suggestons);

              matches.retainWhere((s) {
                return s.toLowerCase().contains(pattern.toLowerCase());
              });
              return matches;
            },
            itemBuilder: (context, sone) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Text(sone.toString()),
              );
            },
            onSuggestionSelected: (suggestion) {
              print(suggestion);
              textcontroller.text = suggestion;
              search = suggestion;
              getadds();
              setState(() {});
            },
          ),

          //  Spacer(),
          CategoryTab(categories: categories, categories1: categoriestosend),
          //  Spacer(),
          //DealsTab(),
          //  Spacer(),
          PopularDealTab(),
        ],
      ),
    );
  }
}

class PopularDealTab extends StatefulWidget {
  @override
  State<PopularDealTab> createState() => _PopularDealTabState();
}

class _PopularDealTabState extends State<PopularDealTab> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrolllistener);

    // TODO: implement initState
    getadds();
  }

  scrolllistener() async {
    print('scroll listener called');
    if (isloadingmore == true)
      return;
    else {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isloadingmore = true;
        });
        print('filtersbro');
        print(filtersbro);
        page = page + 1;
        adds = adds! + await api.getaddsbyfilters(search, filtersbro, page);

        print(adds!);
        setState(() => {});
        isloadingmore = false;

        // if (tags.isNotEmpty && _value != 0.0) {
        //   page = page + 1;
        //   // adds = [];
        //   adds = adds +
        //       await api.getaddsfull(search, double.parse(latitude!),
        //           double.parse(longitude!), _value.toInt(), tags, page);
        //   isloadingmore = true;
        //   setState(() {});
        // } else if (tags.isEmpty && _value != 0.0) {
        //   page = page + 1;
        //   // adds = [];
        //   adds = adds +
        //       await api.getaddsbylocation(search, double.parse(latitude!),
        //           double.parse(longitude!), _value.toInt(), page);
        //   isloadingmore = false;

        //   setState(() {});
        // } else if (tags.isNotEmpty && _value == 0.0) {
        //   for (int i = 0; i < tags.length; i++) {
        //     var index = categorie.indexOf(tags[i]);
        //     realtags.add(categoriestosen[index]);
        //   }
        //   page = page + 1;
        //   // adds = adds + await api.getaddsbytags(search, realtags, page);
        //   isloadingmore = false;
        //   setState(() {});
        // } else {
        //   getaddspro();
        //   //  page = page + 1;
        //   print(page);
        //   setState(() {});
        // }
        // page = page +1;
        //  adds = await api.getaddsbyfilters(
        //                         search, allfilters, page);
        //                     setState(() => {
        //                       isloadingmore = false;
        //                     });
        print('bro bro');
      }
    }
  }

  getadds() async {
    adds = null;
    adds = await api.getadds(search, page);
    setState(() {});
  }

  getaddspro() async {
    page = page + 1;
    addspro = await api.getadds(search, page);
    adds = adds! + addspro;
    setState(() {});
    setState(() {
      isloadingmore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        TabTitle(
            title: 'New Ads ',
            seeAll: () {
              Navigator.of(context).pushNamed(PopularDealsScreen.routeName);
            }),
        Expanded(
            child: RefreshIndicator(
          //Just add this to your screen
          color: Colors.green,
          // key: _con.refreshIndicatorKey,
          strokeWidth: 4,
          displacement: 80,
          onRefresh: refresh,
          child: Builder(builder: (context) {
            if (adds != null) {
              if (adds!.length > 0) {
                print('alingo');
                print(adds);
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        //  shrinkWrap: true,
                        //  physics: ScrollPhysics(),
                        controller: scrollController,
                        // physics: RangeMaintainingScrollPhysics,
                        itemCount: adds!.length,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DragonFruitScreen(id: adds![index].id!)));
                            },
                            child: IndiDealCard(
                                noPadding: true,
                                isLeft: false,
                                isSelected: true,
                                title: adds![index].title!,
                                id: adds![index].id!,
                                catagory: adds![index].catagory!,
                                price: adds![index].price!,
                                imageurl: adds![index].images!.first.url),
                            //onTap: () => {},
                          );
                        },
                      ),
                    ),
                    if (isloadingmore == true)
                      Container(
                        //  color: Colors.black12,
                        color: kGreyShade4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                  ],
                );
              } else if (adds!.length == 0) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Adds not found'),
                        SizedBox(height:10),
                        Image.asset(
                          'assets/images/errorpage.png',
                          height: 200,
                        ),
                        TextButton(
                            onPressed: () async {
                             
                                adds = null;
                                 
                                page=1;
                                filtersbro = {};
                                adds = await api.getaddsbyfilters(search, filtersbro, page);
                                setState(() {
                              
                              });
                                
                            },
                            child: Text('Go to homepage'))
                      ]),
                );
              } else {
                return Text('');
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox();
          }),
        ))
      ]),
    );
  }

  Future<void> refresh() async {
    search = null;
    page = 1;
    adds = await api.getadds(null, 1);
    setState(() {});
  }
}

class DealsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabTitle(
            title: 'Special Deals for You',
            seeAll: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => SpecialDealScreen(
                            catagory: 'phone',
                            catagory1: 'phone',
                          )),
                  ModalRoute.withName("/special_deal"));
            }),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // DealCard(),
              // DealCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.categories,
    required this.categories1,
  }) : super(key: key);

  final List<Category> categories;
  final List<Categorypro> categories1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'categories'.tr(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              TextButton(
                onPressed: () async {
                  print('this is cool');

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CategoryScreen()));
                  // Navigator.of(context).pushNamed(CategoryScreen.routeName);
                  // Location location = new Location();

                  // bool _serviceEnabled;
                  // PermissionStatus _permissionGranted;
                  // LocationData _locationData;

                  // _serviceEnabled = await location.serviceEnabled();
                  // if (!_serviceEnabled) {
                  //   _serviceEnabled = await location.requestService();
                  //   if (!_serviceEnabled) {
                  //     return;
                  //   }
                  // }

                  // _permissionGranted = await location.hasPermission();
                  // if (_permissionGranted == PermissionStatus.denied) {
                  //   _permissionGranted = await location.requestPermission();
                  //   if (_permissionGranted != PermissionStatus.granted) {
                  //     return;
                  //   }
                  // }

                  // _locationData = await location.getLocation();
                },
                child: Text(
                  'seeall'.tr(),
                ),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                categories.length,
                (index) =>
                    CategoryCardhome(categories[index], categories1[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          16,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Planet Namex 989',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  'Norristown, Pennsyvlvania, 19403',
                  style: TextStyle(
                    color: kTextColorAccent,
                    fontSize: getProportionateScreenWidth(
                      12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            child: Icon(
              Icons.search,
              color: kPrimaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Enter your price below'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: minprice,
                    decoration: InputDecoration(
                      hintText: 'Enter low price ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: maxprice,
                    decoration: InputDecoration(
                      hintText: 'Enter max price ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                    ),
                  ),
                )
              ]),
              // implement the search field

              Expanded(
                child: const SizedBox(
                  width: 10,
                ),
              ),
              // This button is used to close the search modal
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Filter')),

              // display other things like search history, suggestions, search results, etc.
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
