// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app/models/Categorypro.dart';
import 'package:app/models/ads.dart';
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
List adds = [];
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
    adds = [];
    page = 1;
    adds = await api.getadds(search, page);
    setState(() {});
  }

  Timer? _debounce;
  GroupController controller = GroupController();
  List<String> suggestons = [
    "USA",
    "UK",
    "Uganda",
    "Uruguay",
    "United Arab Emirates"
  ];
  var textcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    print('testing payment method');

    page = 1;
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
    adds = [];
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
    String value = 'flutter';
    List<S2Choice<String>> options = [
      S2Choice<String>(value: 'ion', title: 'Ionic'),
      S2Choice<String>(value: 'flu', title: 'Flutter'),
      S2Choice<String>(value: 'rea', title: 'React Native'),
    ];
    List<String?> _car = [];
    List<String> _smartphone = [];

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setStatehere) {
              return FractionallySizedBox(
                heightFactor: 0.9,
                child: Container(
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
                      Row(children: <Widget>[
                        Text('Filter the adds'.tr()),
                        SizedBox(width: 20),
                      ]),
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
                      ChipsChoice<String>.multiple(
                        clipBehavior: Clip.none,
                        alignment: WrapAlignment.spaceEvenly,
                        value: tags,
                        onChanged: (val) => setStatehere(() => tags = val),
                        choiceItems: C2Choice.listFrom<String, String>(
                          source: categorie,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                      ),
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
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Choose distance in km'.tr())),
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
                        height: 40,
                      ),
                      SmartSelect<String>.single(
                          title: 'Frameworks',
                          selectedValue: value,
                          choiceItems: options,
                          onChange: (state) =>
                              setState(() => value = state.value)),
                      SmartSelect<String?>.multiple(
                        title: 'Car',
                        placeholder: 'Choose one',
                        selectedValue: _car,
                        onChange: (selected) =>
                            setState(() => _car = selected.value),
                        choiceItems:
                            S2Choice.listFrom<String, Map<String, String>>(
                          source: choices.cars,
                          value: (index, item) => item['value'] ?? '',
                          title: (index, item) => item['title'] ?? '',
                          group: (index, item) => item['brand'] ?? '',
                        ),
                        choiceGrouped: true,
                        modalFilter: true,
                        modalFilterAuto: true,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                            isTwoLine: true,
                            leading: const CircleAvatar(
                              backgroundColor: Colors.amberAccent,
                              backgroundImage: NetworkImage(
                                'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                              ),
                            ),
                          );
                        },
                      ),
                      SmartSelect<String?>.multiple(
                        title: 'Car',
                        placeholder: 'Choose one',
                        selectedValue: _car,
                        onChange: (selected) =>
                            setState(() => _car = selected.value),
                        choiceItems:
                            S2Choice.listFrom<String, Map<String, String>>(
                          source: choices.cars,
                          value: (index, item) => item['value'] ?? '',
                          title: (index, item) => item['title'] ?? '',
                          group: (index, item) => item['brand'] ?? '',
                        ),
                        choiceGrouped: true,
                        modalFilter: true,
                        modalFilterAuto: true,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                            // isLoading: _usersIsLoading,
                            hideValue: true,
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                state.selected.value.length.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            body: S2TileChips(
                              chipLength: state.selected.length,
                              chipLabelBuilder: (context, i) {
                                return Text(
                                    state.selected.choice?[i].title ?? '');
                              },
                              chipAvatarBuilder: (context, i) => CircleAvatar(
                                // backgroundImage: NetworkImage(
                                //   state.selected.choice?[i].meta['picture']
                                //       ['thumbnail'],
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              chipOnDelete: (i) {
                                setState(() => _car
                                    .remove(state.selected.choice?[i].value));
                              },
                              chipColor: Theme.of(context).primaryColor,
                              chipRaised: true,
                              placeholder: Container(),
                            ),
                          );
                        },
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          //   print('this is test payment for the company');
                          // Chapa.paymentParameters(
                          //   context: context, // context
                          //   publicKey:
                          //       'CHAPUBK_TEST-wnVNH3RVrZAFHDNXuZkA5BTYtu9q5apN',
                          //   currency: 'ETB',
                          //   amount: '200',
                          //   email: 'xyz@gmail.com',
                          //   firstName: 'fullName',
                          //   lastName: 'lastName',
                          //   txRef: '34TXTHHgb',
                          //   title: 'payment for the company',
                          //   desc: 'desc',
                          //   namedRouteFallBack: '/second', // fall back route name
                          // );

                          if (tags.isEmpty && _value == 0.0) {
                            Navigator.pop(context);
                          } else if (tags.isNotEmpty && _value == 0.0) {
                            print('tags');

                            Navigator.pop(context);

                            page = 1;
                            adds = [];
                            for (int i = 0; i < tags.length; i++) {
                              var index = categorie.indexOf(tags[i]);
                              realtags.add(categoriestosen[index]);
                            }
                            print('realtags');
                            print(realtags);

                            adds =
                                await api.getaddsbytags(search, realtags, page);

                            setState(() {});

                            setState(() {});
                          } else if (tags.isEmpty && _value != 0.0) {
                            print('location');
                            Navigator.pop(context);
                            page = 1;
                            adds = [];
                            print(double.parse(latitude!));
                            print(double.parse(longitude!));

                            adds = await api.getaddsbylocation(
                                search,
                                double.parse(latitude!),
                                double.parse(longitude!),
                                _value.toInt(),
                                page);
                            setState(() {});
                          } else if (tags.isNotEmpty && _value != 0.0) {
                            Navigator.pop(context);
                            adds = [];
                            adds = await api.getaddsfull(
                                search,
                                double.parse(latitude!),
                                double.parse(longitude!),
                                _value.toInt(),
                                tags,
                                page);
                            setState(() {});
                          }
                          // Save new journal
                        },

                        // Clear the text fields

                        // Close the bottom sheet
                        // Navigator.of(context).pop();

                        child: Text('Filter'.tr()),
                      )
                    ],
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
        if (tags.isNotEmpty && _value != 0.0) {
          page = page + 1;
          // adds = [];
          adds = adds +
              await api.getaddsfull(search, double.parse(latitude!),
                  double.parse(longitude!), _value.toInt(), tags, page);
          isloadingmore = true;
          setState(() {});
        } else if (tags.isEmpty && _value != 0.0) {
          page = page + 1;
          // adds = [];
          adds = adds +
              await api.getaddsbylocation(search, double.parse(latitude!),
                  double.parse(longitude!), _value.toInt(), page);
          isloadingmore = false;

          setState(() {});
        } else if (tags.isNotEmpty && _value == 0.0) {
          for (int i = 0; i < tags.length; i++) {
            var index = categorie.indexOf(tags[i]);
            realtags.add(categoriestosen[index]);
          }
          page = page + 1;
          adds = adds + await api.getaddsbytags(search, realtags, page);
          isloadingmore = false;
          setState(() {});
        } else {
          getaddspro();
          //  page = page + 1;
          print(page);
          setState(() {});
        }

        print('bro bro');
      }
    }
  }

  getadds() async {
    adds = await api.getadds(search, page);
    setState(() {});
  }

  getaddspro() async {
    page = page + 1;

    addspro = await api.getadds(search, page);
    adds = adds + addspro;
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
              child: adds.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            //  shrinkWrap: true,
                            //  physics: ScrollPhysics(),
                            controller: scrollController,
                            // physics: RangeMaintainingScrollPhysics,
                            itemCount: adds!.length,

                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DragonFruitScreen(
                                              id: adds![index].id!)));
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
                    )
                  : const Center(child: CircularProgressIndicator())),
        ),
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
