// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app/models/Categorypro.dart';
import 'package:app/screens/addview.dart';
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
import '../constants/suggestion.dart';
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
final minpricefield = TextEditingController();
final maxpricefield = TextEditingController();
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
int? minprice;
int? maxprice;
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
  FocusNode myfocus = FocusNode();

  getadds() async {
    adds = null;
    page = 1;
    adds = await api.getadds(search, page);
    setState(() {});
  }

  Timer? _debounce;
  GroupController controller = GroupController();
  List<String> suggestons = suggestionspro;
  List<String> suggestonsa = [
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
    myfocus.unfocus();

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
      S2Choice<String>(
        value: 'all',
        title: 'All'.tr(),
      ),
      S2Choice<String>(value: 'new', title: 'Brand New'.tr()),
      S2Choice<String>(value: 'old', title: 'Old'),
    ];
    String filter = 'newest';
    List<S2Choice<String>> filters = [
      S2Choice<String>(value: 'newest', title: 'Newest'.tr()),
      S2Choice<String>(value: 'pricelow', title: 'Price low'.tr()),
      S2Choice<String>(value: 'pricemax', title: 'Highest price'.tr()),
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
                "minprice": minprice,
                "maxprice": maxprice
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
                                  child: Text('Cancel'.tr(),
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
                          child: SizedBox(
                            height: 50,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SmartSelect<String>.single(
                                title: 'Select region'.tr(),
                                // placeholder: 'Choose one',
                                selectedValue: region,
                                onChange: (selected) =>
                                    setStatehere(() => region = selected.value),
                                choiceItems: choices.regions,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: Color(0xFFE4E4E6))),
                          child: SizedBox(
                            height: 50,
                            child: SmartSelect<String>.single(
                              title: 'Choose ad catagory'.tr(),
                              placeholder: 'Choose one'.tr(),
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
                        ),
                        SizedBox(height: 5),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: Color(0xFFE4E4E6))),
                          child: SmartSelect<String>.multiple(
                            title: 'Choose sub catagory'.tr(),
                            placeholder: 'Choose one'.tr(),
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
                          child: SizedBox(
                            height: 50,
                            child: SmartSelect<String>.single(
                                title: 'Select status'.tr(),
                                modalType: S2ModalType.bottomSheet,
                                selectedValue: status,
                                // modalFilter:true,
                                choiceItems: statusoptions,
                                // modalType: ,
                                onChange: (state) =>
                                    setStatehere(() => status = state.value)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(FullScreenSearchModal());
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.only(left: 18),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.2,
                                          color: Color(0xFFE4E4E6))),
                                  width: MediaQuery.of(context).size.width / 2 -
                                      52,
                                  child: Center(
                                    child: Text('Enter custom price'.tr(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.2, color: Color(0xFFE4E4E6))),
                                child: SmartSelect<String>.single(
                                    title: 'Filter by '.tr(),
                                    placeholder: 'Choose one'.tr(),
                                    selectedValue: filter,
                                    // modalFilter:true,
                                    choiceItems: filters,
                                    modalType: S2ModalType.bottomSheet,
                                    // modalType: ,
                                    onChange: (state) => setStatehere(
                                        () => filter = state.value)),
                              ),
                            ],
                          ),
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
                              print(allfilters);
                              adds = await api.getaddsbyfilters(
                                  search, allfilters, page);
                              print('check');
                              print(adds!);
                              setState(() => {});
                              filtersbro = allfilters;
                              minprice = null;
                              maxprice = null;

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
        'mobileandtablets'.tr(),
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Category(
        'electronics'.tr(),
        'assets/images/new/electronics/tv.svg',
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
        'beautyandhealth'.tr(),
        'assets/images/new/beautyandhealth/hair.svg',
        kAccentGreen,
      ),
      Category(
        'babies'.tr(),
        'assets/images/new/babies/baby.svg',
        kAccentGreen,
      ),
      Category(
        'foodandagri'.tr(),
        'assets/images/new/foodandagri/food.svg',
        kAccentGreen,
      ),
      Category(
        'homesupplies'.tr(),
        'assets/images/new/homesupplies/sofa.svg',
        kAccentPurple,
      ),
      Category(
        'fashion'.tr(),
        'assets/images/new/fashion/tshirt.svg',
        kAccentPurple,
      ),
      Category(
        'animals'.tr(),
        'assets/images/dog.svg',
        kAccentYellow,
      ),
      Category(
        'jobs'.tr(),
        'assets/images/new/jobs/jab1.svg',
        kAccentYellow,
      ),
      Category(
        'commercialequipment'.tr(),
        'assets/images/new/commercialequipment/factory.svg',
        kAccentYellow,
      ),
      Category(
        'construction'.tr(),
        'assets/images/new/construction/metr.svg',
        kAccentYellow,
      ),
    ];
    final List<Categorypro> categoriestosend = [
      Categorypro(
        'mobileandtablets',
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Categorypro(
        'electronics',
        'assets/images/new/electronics/television pro.svg',
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
        'beautyandhealth',
        'assets/images/new/beautyandhealth/hair.svg',
        kAccentGreen,
      ),
      Categorypro(
        'babies',
        'assets/images/new/babies/baby.svg',
        kAccentGreen,
      ),
      Categorypro(
        'foodandagri',
        'assets/images/new/foodandagri/food.svg',
        kAccentGreen,
      ),
      Categorypro(
        'homesupplies',
        'assets/images/new/homesupplies/sofa.svg',
        kAccentPurple,
      ),
      Categorypro(
        'fashion',
        'assets/images/new/fashion/tshirt.svg',
        kAccentPurple,
      ),
      Categorypro(
        'animals',
        'assets/images/dog.svg',
        kAccentYellow,
      ),
      Categorypro(
        'jobs',
        'assets/images/new/jobs/jab1.svg',
        kAccentYellow,
      ),
      Categorypro(
        'commercialequipment',
        'assets/images/new/commercialequipment/dog.svg',
        kAccentYellow,
      ),
      Categorypro(
        'construction',
        'assets/images/new/construction/cutter.svg',
        kAccentYellow,
      ),
    ];
    ScreenUtils().init(context);

    return SafeArea(
      child: Column(
        children: [
          TypeAheadField(
            minCharsForSuggestions: 2,
            hideOnEmpty: true,
            hideOnLoading: true,
            keepSuggestionsOnLoading: false,
            animationStart: 0.25,
            animationDuration: Duration(seconds: 1),
            textFieldConfiguration: TextFieldConfiguration(
              focusNode: myfocus,
              autofocus: false,
              controller: textcontroller,
              onChanged: ((value) => {
                    if (_debounce?.isActive ?? false) {_debounce!.cancel()},
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      search = value.toString();
                      setState(() {});
                      getadds();
                    })
                  }),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: kFillColorThird,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                // suffixIcon: IconButton(
                //   icon: Icon(Icons.filter_alt),
                //   onPressed: () async {
                //     // ignore: unnecessary_null_comparison
                //     _showForm();

                //     if (!(latitude == null)) {
                //       print('location');
                //       _showForm();
                //     } else {
                //       print('location b');

                //       Location location = new Location();

                //       bool _serviceEnabled;
                //       PermissionStatus _permissionGranted;
                //       LocationData _locationData;

                //       _serviceEnabled = await location.serviceEnabled();
                //       if (!_serviceEnabled) {
                //         _serviceEnabled = await location.requestService();
                //         if (!_serviceEnabled) {
                //           return;
                //         }
                //       }

                //       _permissionGranted = await location.hasPermission();
                //       if (_permissionGranted == PermissionStatus.denied) {
                //         _permissionGranted = await location.requestPermission();
                //         if (_permissionGranted != PermissionStatus.granted) {
                //           return;
                //         }
                //       }

                //       _locationData = await location.getLocation();
                //       SharedPreferences prefs =
                //           await SharedPreferences.getInstance();
                //       prefs.setString(
                //           'latitude', _locationData.latitude.toString());
                //       prefs.setString(
                //           'longitude', _locationData.longitude.toString());
                //       latitude = _locationData.latitude.toString();
                //       longitude = _locationData.longitude.toString();
                //       setState(() {});

                //       //_showForm();
                //     }
                //   },
                // ),
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
              return matches.length > 4 ? matches.sublist(0, 4) : matches;
            },
            itemBuilder: (context, sone) {
              final items = sone.split('.');

              return Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(items[0].toString(), style: TextStyle(fontSize: 14)),
                    SizedBox(width: 10),
                    Text('in'.tr()),
                    SizedBox(width: 10),
                    Text(items[1].toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14)),
                  ],
                ),
              );
            },
            onSuggestionSelected: (suggestion) async {
              filtersbro = {};
              bool condition = true;
              page = 1;
              textcontroller.text = '';
              // search = suggestion;
              if (suggestion == "house" ||
                  suggestion == "ቤት" ||
                  suggestion == "ገዛ" ||
                  suggestion == "houseandapartmentforsale".tr()) {
                filtersbro = {"catagory": "houseandapartmentforsale"};
              } else if (suggestion ==
                  'mobileandtablets'.tr() + '.' + 'mobileandtablets'.tr()) {
                filtersbro = {"maincatagory": "mobileandtablets"};
              } else if (suggestion ==
                  'electronics'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"maincatagory": "electronics"};
              } else if (suggestion ==
                  'vehicles'.tr() + "." + 'vehicles'.tr()) {
                filtersbro = {"maincatagory": "vehicles"};
              } else if (suggestion ==
                  'property'.tr() + "." + "property".tr()) {
                filtersbro = {"maincatagory": "property"};
              } else if (suggestion ==
                  'beautyandhealth'.tr() + '.' + 'beautyandhealth'.tr()) {
                filtersbro = {"maincatagory": "beautyandhealth"};
              } else if (suggestion == 'babies'.tr() + '.' + 'babies'.tr()) {
                filtersbro = {"maincatagory": "babies"};
              } else if (suggestion ==
                  'foodandagri'.tr() + '.' + 'foodandagri'.tr()) {
                filtersbro = {"maincatagory": "foodandagri"};
              } else if (suggestion ==
                  'homesupplies'.tr() + '.' + 'homesupplies'.tr()) {
                filtersbro = {"maincatagory": "homesupplies"};
              } else if (suggestion == 'fashion'.tr() + '.' + 'fashion'.tr()) {
                filtersbro = {"maincatagory": "fashion"};
              } else if (suggestion == 'animals'.tr() + '.' + 'animals'.tr()) {
                filtersbro = {"maincatagory": "animals"};
              } else if (suggestion == 'jobs'.tr() + '.' + 'jobs'.tr()) {
                filtersbro = {"maincatagory": "jobs"};
              } else if (suggestion ==
                  'commercialequipment'.tr() +
                      '.' +
                      'commercialequipment'.tr()) {
                filtersbro = {"maincatagory": "commercialequipment"};
              } else if (suggestion ==
                  "phone".tr() + '.' + "mobileandtablets".tr()) {
                filtersbro = {"catagory": "phone"};
              } else if (suggestion ==
                  'tablets'.tr() + '.' + "mobileandtablets".tr()) {
                filtersbro = {"catagory": "tablets"};
              } else if (suggestion ==
                  'smartwatches'.tr() + '.' + "mobileandtablets".tr()) {
                filtersbro = {"catagory": "smartwatches"};
              } else if (suggestion ==
                  'mobileaccessory'.tr() + '.' + "mobileandtablets".tr()) {
                filtersbro = {"catagory": "mobileaccessory"};
              } else if (suggestion ==
                  'laptopsandcomputers'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "laptopsandcomputers"};
              } else if (suggestion ==
                  'computeraccessory'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "computeraccessory"};
              } else if (suggestion ==
                  'securityandsurvelliance'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "securityandsurvelliance"};
              } else if (suggestion ==
                  'Networkingproducts'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "Networkingproducts"};
              } else if (suggestion ==
                  'softwares'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "softwares"};
              } else if (suggestion ==
                  'headphones'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "headphones"};
              } else if (suggestion ==
                  'printersandscanners'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "printersandscanners"};
              } else if (suggestion == 'Tv'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "Tv"};
              } else if (suggestion ==
                  'videogames'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "videogames"};
              } else if (suggestion ==
                  'photoandvideocameras'.tr() + '.' + "electronics".tr()) {
                filtersbro = {"catagory": "photoandvideocameras"};
              } else if (suggestion == 'cars'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "cars"};
              } else if (suggestion ==
                  'vehiclepartsandaccessories'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "vehiclepartsandaccessories"};
              } else if (suggestion ==
                  'motorcycles'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "motorcycles"};
              } else if (suggestion == 'trucks'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "trucks"};
              } else if (suggestion == 'buses'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "buses"};
              } else if (suggestion ==
                  'heavyequipment'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "heavyequipment"};
              } else if (suggestion == 'boats'.tr() + '.' + "vehicles".tr()) {
                filtersbro = {"catagory": "boats"};
              } else if (suggestion ==
                  'houseandapartmentforrent'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "houseandapartmentforrent"};
              } else if (suggestion ==
                  'houseandapartmentforsale'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "houseandapartmentforsale"};
              } else if (suggestion ==
                  'landandplotsforsale'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "landandplotsforsale"};
              } else if (suggestion ==
                  'landandplotsforrent'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "landandplotsforrent"};
              } else if (suggestion ==
                  'commercialpropertyforsale'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "commercialpropertyforsale"};
              } else if (suggestion ==
                  'commercialpropertyforrent'.tr() + '.' + "property".tr()) {
                filtersbro = {"catagory": "commercialpropertyforrent"};
              } else if (suggestion ==
                  'furniture'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "furniture"};
              } else if (suggestion ==
                  'homeappliances'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "homeappliances"};
              } else if (suggestion ==
                  'kitchensupplies'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "kitchensupplies"};
              } else if (suggestion ==
                  'gardensupplies'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "gardensupplies"};
              } else if (suggestion ==
                  'householdchemicals'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "householdchemicals"};
              } else if (suggestion ==
                  'homeaccessories'.tr() + '.' + "homesupplies".tr()) {
                filtersbro = {"catagory": "homeaccessories"};
              } else if (suggestion ==
                  'dogsandpuppies'.tr() + '.' + "animals".tr()) {
                filtersbro = {"catagory": "dogsandpuppies"};
              } else if (suggestion == 'birds'.tr() + '.' + "animals".tr()) {
                filtersbro = {"catagory": "birds"};
              } else if (suggestion == 'cats'.tr() + '.' + "animals".tr()) {
                filtersbro = {"catagory": "cats"};
              } else if (suggestion == 'reptiles'.tr() + '.' + "animals".tr()) {
                filtersbro = {"catagory": "reptiles;"};
              } else if (suggestion == "Corolla".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Corolla"};
              } else if (suggestion == "Hiace".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Hiace"};
              } else if (suggestion == "Hilux".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Hilux"};
              } else if (suggestion ==
                  "Land Cruiser".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Land Cruiser"};
              } else if (suggestion == "Previa".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Previa"};
              } else if (suggestion == "Prius".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Prius"};
              } else if (suggestion == "RAV4".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "RAV4"};
              } else if (suggestion == "Starlet".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Starlet"};
              } else if (suggestion == "Supra".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Supra"};
              } else if (suggestion == "Tundra".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Tundra"};
              } else if (suggestion == "Yaris".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Yaris"};
              } else if (suggestion == "Vitz".tr() + '.' + "Toyota".tr()) {
                filtersbro = {"model": "Vitz"};
              } else if (suggestion == "Amarok".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": "Amarok"};
              } else if (suggestion == "Arteon".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": "Arteon"};
              } else if (suggestion == "Beetle".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": "Beetle"};
              } else if (suggestion == "Bora".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": ""};
              } else if (suggestion == "bubble".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": "bubble"};
              } else if (suggestion == "Caddy".tr() + "." + "Volswagen".tr()) {
                filtersbro = {"model": "Caddy"};
              } else if (suggestion == "Jetta".tr() + '.' + "Volswagen".tr()) {
                filtersbro = {"model": ""};
              } else if (suggestion == "Alto".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Alto"};
              } else if (suggestion == "Baleno".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Baleno"};
              } else if (suggestion ==
                  "Grand Vitara".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Grand Vitara"};
              } else if (suggestion == "Ignis".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Ignis"};
              } else if (suggestion == "Jimny".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Jimny"};
              } else if (suggestion == "Kizashi".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Kizashi"};
              } else if (suggestion == "Liana".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Liana"};
              } else if (suggestion == "S-Cross".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "S-Cross"};
              } else if (suggestion == "Splash".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Splash"};
              } else if (suggestion == "Swace".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Swace"};
              } else if (suggestion == "Swift".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Swift"};
              } else if (suggestion == "SX4".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": ""};
              } else if (suggestion == "Vitaire".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Vitaire"};
              } else if (suggestion == "Wagon R +".tr() + '.' + "Suzuki".tr()) {
                filtersbro = {"model": "Wagon R +"};
              } else if (suggestion == "200 SX".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "200 SX"};
              } else if (suggestion == "300 ZX".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "300 ZX"};
              } else if (suggestion == "370 Z".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "370 Z"};
              } else if (suggestion == "Almera".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Almera"};
              } else if (suggestion == "Ariya".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Ariya"};
              } else if (suggestion == "e-NV200".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "e-NV200"};
              } else if (suggestion == "GT-R".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "GT-R"};
              } else if (suggestion == "Interstar".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Interstar"};
              } else if (suggestion == "Juke".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Juke"};
              } else if (suggestion ==
                  "King Cab / Navara".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "King Cab / Navara"};
              } else if (suggestion == "Cubists".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Cubists"};
              } else if (suggestion == "Leaf".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Leaf"};
              } else if (suggestion == "Maxima".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Maxima"};
              } else if (suggestion == "Micra".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Micra"};
              } else if (suggestion == "Murano".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Murano"};
              } else if (suggestion == "Note".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Note"};
              } else if (suggestion == "NV200".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "NV200"};
              } else if (suggestion == "NV250".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "NV250"};
              } else if (suggestion == "NV300".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "NV300"};
              } else if (suggestion == "NV400".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "NV400"};
              } else if (suggestion ==
                  "Pathfinder".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Pathfinder"};
              } else if (suggestion == "Patrol".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Patrol"};
              } else if (suggestion == "primastar".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "primastar"};
              } else if (suggestion == "Primera".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Primera"};
              } else if (suggestion == "pulses".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "pulses"};
              } else if (suggestion == "Qashqai".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Qashqai"};
              } else if (suggestion == "Sunny".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Sunny"};
              } else if (suggestion == "Terrano".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": ""};
              } else if (suggestion == "Titanium".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Titanium"};
              } else if (suggestion == "Townstar".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "Townstar"};
              } else if (suggestion == "X Trail".tr() + '.' + "Nissan".tr()) {
                filtersbro = {"model": "X Trail"};
              } else if (suggestion == "Accent" + '.' + "Hyundai") {
                filtersbro = {"model": "Accent"};
              } else if (suggestion == "Atos" + '.' + "Hyundai") {
                filtersbro = {"model": "Atos"};
              } else if (suggestion == "Bayon" + '.' + "Hyundai") {
                filtersbro = {"model": "Bayon"};
              } else if (suggestion == "Coupé" + '.' + "Hyundai") {
                filtersbro = {"model": "Coupé"};
              } else if (suggestion == "Elantra" + '.' + "Hyundai") {
                filtersbro = {"model": "Elantra"};
              } else if (suggestion == "Getz" + '.' + "Hyundai") {
                filtersbro = {"model": "Getz"};
              } else if (suggestion == "Grandeur" + '.' + "Hyundai") {
                filtersbro = {"model": "Grandeur"};
              } else if (suggestion == "Terracan" + '.' + "Hyundai") {
                filtersbro = {"model": "Terracan"};
              } else if (suggestion == "Trajet" + '.' + "Hyundai") {
                filtersbro = {"model": "Trajet"};
              } else if (suggestion == "Tucson" + '.' + "Hyundai") {
                filtersbro = {"model": "Tucson"};
              } else if (suggestion == "Thunderbird".tr() + '.' + "ford".tr()) {
                filtersbro = {"model": "Thunderbird"};
              } else if (suggestion == "Ranger".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Ranger"};
              } else if (suggestion == "Bronco".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": ""};
              } else if (suggestion == "C-Max".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "C-Max"};
              } else if (suggestion == "Connect".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Connect"};
              } else if (suggestion == "Cougar".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Cougar"};
              } else if (suggestion == "Courier".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Courier"};
              } else if (suggestion == "Custom".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Custom"};
              } else if (suggestion == "Ecosport".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Ecosport"};
              } else if (suggestion == "Edge".tr() + '.' + "Ford".tr()) {
                filtersbro = {"model": "Edge"};
              } else {
                condition = false;
                print('opps');
                textcontroller.text = suggestion;
                search = suggestion;
              }
              if (condition == true) {
                search = null;
              }
              adds = null;
              adds = await api.getaddsbyfilters(search, filtersbro, page);
              // getadds();
              setState(() {});
              // filtersbro= {};
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
    FocusManager.instance.primaryFocus?.unfocus();
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
            title: 'New Ads'.tr(),
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
                        Text('Adds not found'.tr()),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/images/errorpage.png',
                          height: 200,
                        ),
                        TextButton(
                            onPressed: () async {
                              adds = null;

                              page = 1;
                              filtersbro = {};
                              adds = await api.getaddsbyfilters(
                                  search, filtersbro, page);
                              setState(() {});
                            },
                            child: Text('Reset filter'.tr()))
                      ]),
                );
              } else {
                return Text('flksajfslkdfjslfjslkdfj');
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
        title: Text('Enter your price below'.tr()),
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
                    controller: minpricefield,
                    keyboardType: TextInputType.number,
                    onChanged: (price) {
                      minprice = int.parse(price);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter min price'.tr(),
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
                    controller: maxpricefield,
                    keyboardType: TextInputType.number,
                    onChanged: (price) {
                      maxprice = int.parse(price);
                    },

                    // on
                    decoration: InputDecoration(
                      hintText: 'Enter max price'.tr(),
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
                  child: Text('Done'.tr())),
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
