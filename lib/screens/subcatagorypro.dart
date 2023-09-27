import 'dart:async';

import 'package:app/constants/colors.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/Categorypro.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';
import '../models/chip_data_model.dart';
import '../services/api.dart';
import '../utils/screen_utils.dart';
import '../widgets/category_card_home.dart';
import '../widgets/indi_deal_card.dart';
import 'category_screen.dart';
import '../constants/choices.dart' as choices;
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'dragon_fruit_screen.dart';
import 'home_screen1.dart';

class Cat {
  final String name;
  final String icon;
  final Color color;

  Cat({
    required this.name,
    required this.icon,
    required this.color,
  });
}

final Nicekey = GlobalKey();

List? adds = null;
var api = new Api();
String? search = null;

int page = 1;
String region = '';
String catagory = '';
String status = 'all';
String filter = 'newest';
String yearvalue = '';
String colorvalue = '';
String modelvalue = '';
String city = '';
String fuel = '';
String selectedadd = '';
String engineSize = '';
String transmission = '';
String mileage = '';
int? minprice;
int? maxprice;
String? latitude = '';
String? longitude = "";
String catname = '';
List<String> tags = [];
String distancevalue = '0.0';
bool isloadingmore = false;

Map allfilters = {
  "region": region,
  "catagory": catname,
  "detailcatagory": tags,
  "status": status,
  "filter": filter,
  "latitude": latitude,
  "longitude": longitude,
  "distance": distancevalue,
  "minprice": minprice,
  "maxprice": maxprice,
  "color": colorvalue,
  "year": yearvalue,
  "model": modelvalue,
  "city": "",
  "transmission": "",
  "engineSize": "",
  "fuel": "",
  "mileAge": "",
};
List<S2Choice<String>> statusoptions = [
  S2Choice<String>(
    value: 'all',
    title: 'All'.tr(),
  ),
  S2Choice<String>(value: 'new', title: 'Brand New'.tr()),
  S2Choice<String>(value: 'old', title: 'Old'),
];
List<S2Choice<String>> filters = [
  S2Choice<String>(value: 'newest', title: 'Newest'.tr()),
  S2Choice<String>(value: 'pricelow', title: 'Price low'.tr()),
  S2Choice<String>(value: 'pricemax', title: 'Highest price'.tr()),
];

class Subcatagorypro extends StatefulWidget {
  late List<Category> catagories;

  late List<Categorypro> catagoriestosend;
  String name;
  String title;

  Subcatagorypro(
      {Key? key,
      required this.catagories,
      required this.catagoriestosend,
      required this.name,
      required this.title});

  @override
  State<Subcatagorypro> createState() => _SubcatagoryproState();
}

class _SubcatagoryproState extends State<Subcatagorypro> {
  Timer? _debounce;
  String hinttext = '';

  var textcontroller = TextEditingController();

  @override
  void initState() {
    catname = widget.name;
    hinttext = 'Search in'.tr() + ' ' + widget.title + "Yserh".tr();
    allfilters['catagory'] = catname;

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
    fuel = '';
    engineSize = '';
    transmission = '';
    mileage = '';

    search = null;
    page = 1;

    region = '';

    catagory = '';

    status = 'all';

    filter = 'newest';

    selectedadd = '';

    catname = '';
    tags = [];

    distancevalue = '0.0';
    isloadingmore = false;

    minprice = null;
    maxprice = null;
    allfilters = {};
    super.dispose();
  }

  getadds() async {
    print('Getting adds ');
    adds = null;
    page = 1;
    adds = await api.getaddsbyfilters(search, allfilters, page);
    setState(() {});
    scroll();
  }

  getaddssearch() async {
    print('Getting adds ');
    adds = null;
    page = 1;
    adds = await api.getaddsbyfilters(search, allfilters, page);
    setState(() {});
  }

  Future scroll() async {
    print('scroll method');
    Future.delayed(Duration(seconds: 1)).then((value) {
      final context = Nicekey.currentContext!;
      Scrollable.ensureVisible(context,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOutExpo);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils().init(context);

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Expanded(
                child: TypeAheadField(
                  minCharsForSuggestions: 2,
                  hideOnEmpty: true,
                  hideOnLoading: true,
                  keepSuggestionsOnLoading: false,
                  animationStart: 0,
                  animationDuration: Duration.zero,
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    controller: textcontroller,
                    onChanged: ((value) => {
                          if (_debounce?.isActive ?? false)
                            {_debounce!.cancel()},
                          _debounce =
                              Timer(const Duration(milliseconds: 1000), () {
                            search = value.toString();
                            setState(() {});
                            // getadds();
                          })
                        }),
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kFillColorThird,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search_sharp),
                        onPressed: () async {
                          getaddssearch();
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
                      hintText: hinttext,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(
                          10,
                        ),
                        horizontal: getProportionateScreenHeight(
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
                    // matches.addAll(suggestons);

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
                  onSuggestionSelected: (suggestion) async {
                    bool condition = true;
                    print(suggestion);
                    // filtersbro= {};
                  },
                ),
              ),
            ],
          ),
          //  Spacer(),
          Expanded(
            child: CategoryTab(
                categories: widget.catagories,
                categories1: widget.catagoriestosend),
          ),
          //  Spacer(),
          //DealsTab(),
          //  Spacer(),
          // PopularDealTab(),
        ],
      ),
    );
  }
}

class CategoryTab extends StatefulWidget {
  const CategoryTab({
    Key? key,
    required this.categories,
    required this.categories1,
  }) : super(key: key);

  final List<Category> categories;
  final List<Categorypro> categories1;

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  List<String> catagorypro = [];
  List<String> _categories = [];

  int _sort = 3;
  List<String> _categoriesOption = [
    'Electronics',
    'Accessories',
    'Smartwatch',
    'Smartphone',
    'Audio & Video',
    'Scientific'
  ];

  List<Map<String, String>> model = [];

  List<String> _sortOption = [
    'Popular',
    'Most Reviews',
    'Newest',
    'Low Price',
    'High Price',
  ];
  Widget getChild(String imagePath, String title) {
    return Container(
      width: imagePath.split('.').last == "svg" ? 50 : 70,
      height: imagePath.split('.').last == "svg" ? 45 : 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: imagePath.split('.').last == "svg"
                ? SvgPicture.asset(imagePath)
                : CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(imagePath),
                  ),
          ),
          SizedBox(height: 2),
          Text(title,
              style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis)
          // Expanded(child: SvgPicture.asset('assets/images/car.svg')),
        ],
      ),
    );
  }

  final _chipData = ChipData.getChips();
  List<MultiSelectCard<Cat>> robel = [];
  Future scroll() async {
    print('scroll method');
    Future.delayed(Duration(seconds: 1)).then((value) {
      final context = Nicekey.currentContext!;
      Scrollable.ensureVisible(context,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOutExpo);
    });
  }

  final scrollController = ScrollController();
  Future<void> refresh() async {
    search = null;
    page = 1;
    Map allfilters1 = {'catagory': catname};
    adds = await api.getaddsbyfilters(search, allfilters1, page);
    setState(() {});
  }

  getadds() async {
    print('Getting adds ');
    adds = null;
    page = 1;
    adds = await api.getaddsbyfilters(search, allfilters, page);
    setState(() {});
    scroll();
  }

  @override
  void initState() {
    print('widget.categories');
    robel = widget.categories
        .map((animal) => MultiSelectCard<Cat>(
            value: Cat(
                icon: animal.catIcon,
                name: animal.catName,
                color: animal.color),
            child: getChild(animal.catIcon, animal.catName)))
        .toList();
    print(widget.categories);
    // scroll();
    scrollController.addListener(scrolllistener);

    super.initState();
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
        page = page + 1;
        adds = adds! + await api.getaddsbyfilters(search, allfilters, page);
        print(adds!);
        setState(() => {});
        isloadingmore = false;
        print('bro bro');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16.0),
      ),
      child: ListView(controller: scrollController, children: [
        Builder(
          builder: (context) {
            if (widget.categories.length > 0) {
              return SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: MultiSelectContainer(
                    itemsPadding: const EdgeInsets.all(5),
                    itemsDecoration: MultiSelectDecorations(
                      decoration:
                          BoxDecoration(color: Colors.indigo.withOpacity(0.1)),
                      selectedDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.lightGreen]),
                      ),
                    ),
                    showInListView: true,
                    listViewSettings: ListViewSettings(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(
                              width: 10,
                            )),
                    items: robel,
                    onChange: (allSelectedItems, selectedItem) {
                      var cat = Category(selectedItem.name, selectedItem.icon,
                          selectedItem.color);
                      var cata = widget.categories;
                      var cata1 = widget.categories1;
                      var index = cata.map((e) => e.catName).toList();
                      var index1 = cata1.map((e) => e.catName).toList();
                      var maindex = index.indexOf(selectedItem.name);
                      var founditem = index1[maindex];
                      // var item = selectedItem.name
                      // var mainindex = widget.categories1[index];
                      // widget.categories
                      bool found = tags.contains(founditem);

                      print('index');
                      print(founditem);

                      if (found) {
                        tags.remove(founditem);
                        if (founditem == 'Toyota') {
                          // model
                          //     .map((e) => e['brand']?.contains('toyota'))
                          //     .toList();
                          model.removeWhere(
                              (data) => data['brand']!.contains('toyota'));
                        }
                        if (founditem == 'Hyundai') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('hyundai'));
                        }
                        if (founditem == 'Suzuki') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('suzuki'));
                        }
                        if (founditem == 'Nissan') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('nissan'));
                        }
                        if (founditem == 'Ford') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('ford'));
                        }
                        if (founditem == 'Volkswagen') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('volkswagen'));
                        }
                        if (founditem == 'Mercedes Benz') {
                          model.removeWhere(
                              (data) => data['brand']!.contains('mercedes'));
                        }
                      } else {
                        tags.add(founditem);
                        if (founditem == 'Toyota') {
                          model.addAll(choices.toyota);
                        }
                        if (founditem == 'Hyundai') {
                          model.addAll(choices.hyundai);
                        }
                        if (founditem == 'Suzuki') {
                          model.addAll(choices.suzuki);
                        }
                        if (founditem == 'Nissan') {
                          model.addAll(choices.nissan);
                        }
                        if (founditem == 'Ford') {
                          model.addAll(choices.ford);
                        }
                        if (founditem == 'Volkswagen') {
                          model.addAll(choices.volswagen);
                        }
                        if (founditem == 'Mercedes Benz') {
                          model.addAll(choices.mercedes);
                        }
                      }
                      setState(() => {});
                      print('allfilters checking');
                      print(tags);
                    }),
              );
            } else
              return Container();
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Color(0xFFE4E4E6)),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SmartSelect<String>.single(
                        title: 'Region'.tr(),
                        placeholder: 'Choose one'.tr(),
                        selectedValue: region,
                        onChange: (selected) {
                          region = selected.value;
                          allfilters['region'] = region;
                          setState(() => {});
                        },
                        choiceItems: choices.regions,
                        modalType: S2ModalType.fullPage,
                        // modalHeader: false,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                            trailing: const Icon(Icons.arrow_drop_down),
                            isTwoLine: true,
                            enabled: true,
                          );
                        },
                      ),
                    ),
                    catname == 'cars'
                        ? Expanded(
                            child: SmartSelect<String?>.single(
                              title: 'Model'.tr(),
                              placeholder: 'Choose one'.tr(),
                              selectedValue: modelvalue,
                              onChange: (selected) => setState(()
                                  // _car = selected.value
                                  {
                                modelvalue = selected.value!;
                                allfilters['model'] = modelvalue;
                                setState(() => {});
                              }),
                              choiceItems: S2Choice.listFrom<String,
                                  Map<String, String>>(
                                source: model,
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
                                  trailing: const Icon(Icons.arrow_drop_down),
                                  isTwoLine: true,
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: SmartSelect<String>.single(
                              title: 'Status'.tr(),
                              placeholder: 'Choose one'.tr(),

                              selectedValue: status,
                              onChange: (selected) {
                                status = selected.value;
                                allfilters['status'] = status;
                                setState(() => {});
                              },
                              choiceItems: statusoptions,
                              modalType: S2ModalType.bottomSheet,

                              // modalHeader: false,
                              tileBuilder: (context, state) {
                                return S2Tile.fromState(
                                  state,
                                  trailing: const Icon(Icons.arrow_drop_down),
                                  isTwoLine: true,
                                );
                              },
                            ),
                          ),
                    catname == 'cars'
                        ? Expanded(
                            flex: 1,
                            child: SmartSelect<String>.single(
                              title: 'year'.tr(),
                              placeholder: 'Choose one'.tr(),

                              selectedValue: yearvalue,
                              onChange: (selected) {
                                yearvalue = selected.value;
                                allfilters['year'] = yearvalue;
                                setState(() => {});
                              },
                              choiceItems: choices.year,
                              modalType: S2ModalType.bottomSheet,

                              // modalHeader: false,
                              tileBuilder: (context, state) {
                                return S2Tile.fromState(
                                  state,
                                  trailing: const Icon(Icons.arrow_drop_down),
                                  isTwoLine: true,
                                  enabled: true,
                                );
                              },
                            ),
                          )
                        : Expanded(
                            flex: 1,
                            child: SmartSelect<String>.single(
                              title: 'filter by'.tr(),
                              placeholder: 'Choose one'.tr(),

                              selectedValue: filter,
                              onChange: (selected) {
                                filter = selected.value;
                                allfilters['filter'] = filter;
                                setState(() => {});
                              },
                              choiceItems: filters,
                              modalType: S2ModalType.bottomSheet,

                              // modalHeader: false,
                              tileBuilder: (context, state) {
                                return S2Tile.fromState(
                                  state,
                                  trailing: const Icon(Icons.arrow_drop_down),
                                  isTwoLine: true,
                                  enabled: true,
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              if (!(latitude == null)) {
                                print('location');
                                Navigator.of(context)
                                    .push(FullScreenDistance());
                              } else {
                                print('location b');

                                Location location = new Location();

                                bool _serviceEnabled;
                                PermissionStatus _permissionGranted;
                                LocationData _locationData;

                                _serviceEnabled =
                                    await location.serviceEnabled();
                                if (!_serviceEnabled) {
                                  _serviceEnabled =
                                      await location.requestService();
                                  if (!_serviceEnabled) {
                                    return;
                                  }
                                }

                                _permissionGranted =
                                    await location.hasPermission();
                                if (_permissionGranted ==
                                    PermissionStatus.denied) {
                                  _permissionGranted =
                                      await location.requestPermission();
                                  if (_permissionGranted !=
                                      PermissionStatus.granted) {
                                    return;
                                  }
                                }

                                _locationData = await location.getLocation();
                                if (_locationData.latitude != null &&
                                    _locationData.latitude! > 0.0) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('latitude',
                                      _locationData.latitude.toString());
                                  prefs.setString('longitude',
                                      _locationData.longitude.toString());
                                  latitude = _locationData.latitude.toString();
                                  longitude =
                                      _locationData.longitude.toString();
                                  allfilters['latitude'] = latitude;
                                  allfilters['longitude'] = latitude;
                                  setState(() {});
                                  Navigator.of(context)
                                      .push(FullScreenDistance());
                                }
                                print(latitude);
                                print(longitude);

                                //_showForm();
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Distance'.tr()),
                                  SizedBox(width: 3),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(FullScreenSearchModal());
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Price'.tr()),
                              SizedBox(width: 3),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: MaterialButton(
                            color: Color.fromARGB(255, 202, 201, 201),
                            onPressed: () {
                              Navigator.of(context).push(MoreFilters());
                            },
                            child: Row(
                              children: [
                                Text('More'.tr(),
                                    style: TextStyle(color: Colors.black))
                              ],
                            )),
                      ),
                      SizedBox(width: 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: MaterialButton(
                          color: Color(0xFF54B175),
                          onPressed: () {
                            print('allfilters clean');
                            print(allfilters);
                            getadds();
                          },
                          child: Row(
                            children: [
                              Text('Filter'.tr(),
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 1,
                              ),
                              Icon(Icons.filter_list_outlined,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          key: Nicekey,
          child: Builder(builder: (context) {
            if (adds != null) {
              if (adds!.length > 0) {
                print('alingo');
                print(adds);
                return Column(
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                              tags = [];
                              page = 1;
                              region = '';
                              catagory = '';
                              status = 'all';
                              filter = 'newest';
                              city = '';
                              fuel = '';
                              selectedadd = '';
                              engineSize = '';
                              transmission = '';
                              mileage = '';
                              colorvalue = '';
                              modelvalue = '';
                              yearvalue = '';
                              minprice = null;
                              maxprice = null;
                              search = null;
                              allfilters = {};
                              distancevalue = '0.0';
                              allfilters['catagory'] = catname;
                              setState(() {});
                              adds = await api.getaddsbyfilters(
                                  search, allfilters, page);
                              setState(() {});
                            },
                            child: Text('Reset filter'.tr()))
                      ]),
                );
              } else {
                return Text('debugging still');
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
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
        // Container(height: 700, color: Colors.pinkAccent)
      ]),
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
                    // controller: minpricefield,
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
              MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (!minprice.toString().isEmpty) {
                      allfilters['minprice'] = minprice;
                    }
                    if (!maxprice.toString().isEmpty) {
                      allfilters['maxprice'] = maxprice;
                    }
                  },
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

class FullScreenDistance extends ModalRoute {
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
    double value1 = 0.0;

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Choose distance below'.tr()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SfSlider(
                  min: 0,
                  max: 200,
                  value: value1,
                  interval: 50,
                  showTicks: true,
                  stepSize: 5.0,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    setState(() {
                      value1 = value;
                    });
                  },
                ),

                const SizedBox(
                  height: 100,
                ),

                // This button is used to close the search modal
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (value1 != 0.0) {
                        distancevalue = value1.toString();
                        allfilters['distance'] = distancevalue;
                      }
                    },
                    child: Text('Done'.tr())),
                // display other things like search history, suggestions, search results, etc.
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MoreFilters extends ModalRoute {
  String? _car = '';

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
        title: Text('More filters'.tr()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SmartSelect<String?>.single(
                title: 'Choose city'.tr(),
                placeholder: 'Choose one'.tr(),
                selectedValue: city,
                onChange: (selected) => setState(() => _car = selected.value),
                choiceItems: S2Choice.listFrom<String, Map<String, String>>(
                  source: choices.cities,
                  value: (index, item) => item['value'] ?? '',
                  title: (index, item) => item['title'] ?? '',
                  group: (index, item) => item['brand'] ?? '',
                ),
                choiceGrouped: true,
                modalFilter: true,
                modalFilterAuto: true,
              ),

              //a
              Builder(builder: (context) {
                print('robani');
                print(catname);
                if (catname == 'cars' ||
                    catname == 'trucks' ||
                    catname == 'buses' ||
                    catname == 'motorcycles') {
                  return Column(
                    children: [
                      SmartSelect<String>.single(
                        title: 'Status'.tr(),
                        placeholder: 'Choose one'.tr(),

                        selectedValue: status,
                        onChange: (selected) {
                          status = selected.value;
                          allfilters['status'] = status;
                          setState(() => {});
                        },
                        choiceItems: statusoptions,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                            trailing: const Icon(Icons.arrow_drop_down),
                            isTwoLine: true,
                          );
                        },
                      ),
                      SmartSelect<String>.single(
                        title: 'filter by'.tr(),
                        placeholder: 'Choose one'.tr(),

                        selectedValue: filter,
                        onChange: (selected) {
                          filter = selected.value;
                          allfilters['filter'] = filter;
                          setState(() => {});
                        },
                        choiceItems: filters,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                        tileBuilder: (context, state) {
                          return S2Tile.fromState(
                            state,
                            trailing: const Icon(Icons.arrow_drop_down),
                            isTwoLine: true,
                            enabled: true,
                          );
                        },
                      ),
                      SmartSelect<String>.single(
                        title: 'Transmission'.tr(),
                        placeholder: 'Choose one'.tr(),

                        selectedValue: transmission,
                        onChange: (selected) {
                          status = selected.value;
                          allfilters['transmission'] = status;
                          setState(() => {});
                        },
                        choiceItems: choices.Transmission,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                      ),
                      SmartSelect<String>.single(
                        title: 'EngineSize'.tr(),
                        placeholder: 'Choose one'.tr(),

                        selectedValue: engineSize,
                        onChange: (selected) {
                          status = selected.value;
                          allfilters['engineSize'] = status;
                          setState(() => {});
                        },
                        choiceItems: choices.EngineSize,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                      ),
                      SmartSelect<String>.single(
                        title: 'fuel'.tr(),
                        placeholder: 'Chooseone'.tr(),

                        selectedValue: fuel,
                        onChange: (selected) {
                          status = selected.value;
                          allfilters['Fuel'] = status;
                          setState(() => {});
                        },
                        choiceItems: choices.Fuel,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                      ),
                      SmartSelect<String>.single(
                        title: 'color'.tr(),
                        placeholder: 'Chooseone'.tr(),

                        selectedValue: colorvalue,
                        onChange: (selected) {
                          colorvalue = selected.value;
                          allfilters['color'] = colorvalue;
                          setState(() => {});
                        },
                        choiceBuilder: (context, state, choice) {
                          print('choice is making sure ');
                          print(choice.title);
                          return InkWell(
                            onTap: () {
                              choice.select!(true);
                            },
                            child: ListTile(
                              leading: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            getcolor(choice.title)),
                                    SizedBox(width: 10),
                                    Text(choice.title.toString()),
                                  ],
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                        choiceItems: choices.color,
                        modalType: S2ModalType.bottomSheet,

                        // modalHeader: false,
                      ),
                    ],
                  );
                } else
                  return Container();
              }),

              MaterialButton(
                  color: Color(0xFF54B175),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Done'.tr()))

              // This button is used to close the search modal

              // display other things like search history, suggestions, search results, etc.
            ],
          ),
        ),
      ),
    );
  }

  Color getcolor(item) {
    if (item == "Grey".tr())
      return Colors.grey;
    else if (item == "Black".tr())
      return Colors.black;
    else if (item == "White".tr())
      return Colors.white;
    else if (item == "Blue".tr())
      return Colors.blue;
    else if (item == "Red".tr())
      return Colors.red;
    else if (item == "Silver".tr())
      return Color.fromARGB(246, 185, 180, 180);
    else if (item == "Green".tr())
      return Colors.green;
    else if (item == "Orange".tr())
      return Colors.orange;
    else if (item == "Yellow".tr()) return Colors.yellow;
    return Colors.green;
  }
}
