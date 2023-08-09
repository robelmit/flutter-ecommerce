// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:app/models/Categorypro.dart';
import 'package:app/models/ads.dart';
import 'package:app/screens/dragon_fruit_screen.dart';
import 'package:app/screens/postad.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/search_bar.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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

var api = new Api();
String? search = '1111111111';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _debounce;
  GroupController controller = GroupController();
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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void _showForm() async {
    double _value = 0.0;

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
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
                    SimpleGroupedChips<String>(
                      controller: controller,
                      values: categoriestosen,
                      itemTitle: categorie,
                      chipGroupStyle: ChipGroupStyle.minimize(
                        backgroundColorItem: Theme.of(context).primaryColor,
                        itemTitleStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Choose distance in km ')),
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
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // Save new journal
                      },

                      // Clear the text fields

                      // Close the bottom sheet
                      // Navigator.of(context).pop();

                      child: Text('Filter'.tr()),
                    )
                  ],
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
        'cameras'.tr(),
        'assets/images/camera.svg',
        kAccentYellow,
      ),
      Category(
        'tv'.tr(),
        'assets/images/tele.svg',
        kAccentYellow,
      ),
      Category(
        'laptop'.tr(),
        'assets/images/laptop.svg',
        kAccentYellow,
      ),
      Category(
        'electronics'.tr(),
        'assets/images/fridge.svg',
        kAccentPurple,
      ),
      Category(
        'books'.tr(),
        'assets/images/book.svg',
        kAccentTosca,
      ),
      Category(
        'motorbike'.tr(),
        'assets/images/motorcycle.svg',
        kAccentGreen,
      ),
      Category(
        'cars'.tr(),
        'assets/images/car.svg',
        kAccentRed,
      ),
      Category(
        'houses'.tr(),
        'assets/images/house.svg',
        kAccentRed,
      ),
      Category(
        'others'.tr(),
        'assets/images/laptop.svg',
        kAccentPurple,
      ),
    ];
    final List<Categorypro> categoriestosend = [
      Categorypro(
        'Phones',
        'assets/images/phone.svg',
        kAccentGreen,
      ),
      Categorypro(
        'Cameras',
        'assets/images/camera.svg',
        kAccentYellow,
      ),
      Categorypro(
        'Tv',
        'assets/images/tele.svg',
        kAccentYellow,
      ),
      Categorypro(
        'Laptop',
        'assets/images/laptop.svg',
        kAccentYellow,
      ),
      Categorypro(
        'Electronics',
        'assets/images/fridge.svg',
        kAccentPurple,
      ),
      Categorypro(
        'Books',
        'assets/images/book.svg',
        kAccentTosca,
      ),
      Categorypro(
        'Motor Bike',
        'assets/images/motorcycle.svg',
        kAccentGreen,
      ),
      Categorypro(
        'Cars',
        'assets/images/car.svg',
        kAccentRed,
      ),
      Categorypro(
        'Houses',
        'assets/images/house.svg',
        kAccentRed,
      ),
      Categorypro(
        'Others',
        'assets/images/laptop.svg',
        kAccentPurple,
      ),
    ];

    ScreenUtils().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.,
          children: [
            //   Spacer(),
            //HomeAppBar(),
            TextField(
              onChanged: ((value) => {
                    if (_debounce?.isActive ?? false) {_debounce!.cancel()},
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      search = value.toString();
                      setState(() {});
                    })
                  }),
              decoration: InputDecoration(
                filled: true,
                fillColor: kFillColorThird,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {
                    _showForm();
                    print('object');
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
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            //  Spacer(),
            CategoryTab(categories: categories, categories1: categoriestosend),
            //  Spacer(),
            //DealsTab(),
            //  Spacer(),
            PopularDealTab(),
          ],
        ),
      ),
    );
  }
}

class PopularDealTab extends StatefulWidget {
  @override
  State<PopularDealTab> createState() => _PopularDealTabState();
}

class _PopularDealTabState extends State<PopularDealTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabTitle(
            title: 'New Ads ',
            seeAll: () {
              Navigator.of(context).pushNamed(PopularDealsScreen.routeName);
            }),
        RefreshIndicator(
          //Just add this to your screen
          color: Colors.green,
          // key: _con.refreshIndicatorKey,
          strokeWidth: 4,
          displacement: 80,
          onRefresh: refresh,
          child: FutureBuilder<List<Ads>?>(
            future: api.getadds(search, 1),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // physics: RangeMaintainingScrollPhysics,
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DragonFruitScreen(
                                    id: snapshot.data![index].id!)));
                      },
                      child: IndiDealCard(
                          isLeft: false,
                          isSelected: true,
                          title: snapshot.data![index].title!,
                          id: snapshot.data![index].id!,
                          catagory: snapshot.data![index].catagory!,
                          price: snapshot.data![index].price!,
                          imageurl: snapshot.data![index].images!.first.url),
                      //onTap: () => {},
                    );
                  },
                );
              }
                else if(snapshot.hasError){
                          return Center(
                            child: Column(children: [
                              Text('Error occured'),
                              // const AssetImage('bro1.png'),
                              ElevatedButton(onPressed: (){}, child: Text('Retry again'))
                            ]),
                          );
                         }
              
               else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> refresh() async {
    api.getadds('1111111111', 1);
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CategoryScreen()));
                  // Navigator.of(context).pushNamed(CategoryScreen.routeName);
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
