import 'dart:convert';
import 'dart:io';

import 'package:app/screens/home_screen1.dart';
import 'package:app/screens/tab_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:chapasdk/chapasdk.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/constants/dropdown.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uuid/uuid.dart';

import 'myadds.dart';

enum Status { older, newer }

class PostUpdate extends StatefulWidget {
  static const routeName = '/post screen';
  final String id;

  const PostUpdate({super.key, required this.id});

  @override
  State<PostUpdate> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<PostUpdate> {
  List images = [];
  List<String> myimages = [];
  File? imagefilepro;
  final picker = ImagePicker();
  TextEditingController title = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController kilometr = new TextEditingController();
  List<String> items = [];
  List<String> details = [];
  List<String> Brand = [];
  List<String> itemsmain = [];
  Status status = Status.newer;

  @override
  void initState() {
    api.getaddsbyid(widget.id).then((add) {
      selectedValue = '${add['maincatagory']}'.tr();
      print('shukren');
      // items = add['maincatagory'];
      // print(add['maincatagory']);
      selectedValue1 = '${add['catagory']}'.tr();
      selectedValue2 = '${add['detailcatagory']}'.tr();

      checker(true);

      // if (selectedValue1 == "cars".tr()) {
      //   print('yoooo');
      //   print('yoooo');
      //   print('yoooo');
      //   print('yoooo');
      //   print('yoooo');
      //   transmission = '${add['transmission']}'.tr();
      //   colorvalue = '${add['colorvalue']}'.tr();
      //   yearvalue = '${add['yearvalue']}'.tr();
      //   engineSize = '${add['engineSize']}'.tr();
      //   fuel = '${add['fuel']}'.tr();
      //   // brand = '${add['brand']}'.tr();
      // }

      print('selectedValue');
      print(selectedValue);
      print('selectedValue1');
      print(selectedValue1);
      print('selectedValue2');
      print(selectedValue2);
      // myimages = add['images'].map((e) => "${e['url']}").toList();
      print(add['images']);
      images = add['images']
          .map((e) => {"url": e['url'], "isnetwork": true})
          .toList();

      print(images);
      print('cool');

      // List<String> mypostitems = [];
      // var isco = add['images'].map((e) => "${e['url']}").toList();
      // for (int i = 0; i < isco.length; i++) {
      //   mypostitems.add(json.encode(isco[i].toString()));
      // }
      // myimages = mypostitems;
      // myimages = add['images'].map((e) => "${e['url']}").toList();
      title.text = add['title'];
      if (add['status'] == "new") {
        status = Status.newer;
      } else if (add['status'] == "old") {
        status = Status.older;
      }
      // name.text = snapshot.data[''];
      description.text = add['description'];
      price.text = add['price'].toString();
      print('calling');
      print(add);
      setState(() => {});
    });

    super.initState();
  }

  @override
  void dispose() {
    items = [];
    details = [];
    Brand = [];
    itemsmain = [];
    Status status = Status.newer;
    title.dispose();
    name.dispose();
    description.dispose();
    price.dispose();
    selectedValue = null;
    selectedValue1 = null;
    selectedValue2 = null;
    transmission = null;
    colorvalue = null;
    yearvalue = null;
    engineSize = null;
    fuel = null;
    brand = null;
    tobesent = null;
    detailsent = null;
    tobesentmain = null;
    categories = [];
    items = [];
    details = [];

    super.dispose();
  }

  // final List categories = [
  //   'phones'.tr(),
  //   'electronics'.tr(),
  //   'vehicles'.tr(),
  //   'property'.tr(),
  //   'homesupplies'.tr(),
  //   'fashion'.tr(),
  //   'animals'.tr(),
  // ];
  // final List categoriespro = [
  //   'phones',
  //   'electronics',
  //   'vehicles',
  //   'property',
  //   'homesupplies',
  //   'fashion',
  //   'animals',
  // ];
  List categories = [
    'mobileandtablets'.tr(),
    'electronics'.tr(),
    'vehicles'.tr(),
    'property'.tr(),
    'beautyandhealth'.tr(),
    'babies'.tr(),
    'foodandagri'.tr(),
    'homesupplies'.tr(),
    'fashion'.tr(),
    'animals'.tr(),
    'jobs'.tr(),
    'commercialequipment'.tr(),
    'construction'.tr(),
  ];
  List<String> categoriespro = [
    'mobileandtablets',
    'electronics',
    'vehicles',
    'property',
    'beautyandhealth',
    'babies',
    'foodandagri',
    'homesupplies',
    'fashion',
    'animals',
    'jobs',
    'commercialequipment',
    'construction',
  ];
  // items = phone;

  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  String? transmission;
  String? colorvalue;
  String? yearvalue;
  String? engineSize;
  String? fuel;
  String? brand;
  String? tobesent;
  String? detailsent;
  String? tobesentmain;
  final _formKey = GlobalKey<FormState>();

  _getFromGallery() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      File imagefile = File(pickedFile.path);
      // images.add(imagefile);
      print('yooo ');
      print(pickedFile);
      images.add({"url": imagefile, "isnetwork": false});
      myimages.add(pickedFile.path);
      setState(() {});
    }

    // if (pickedFile != null) {
    //   var imagefile = pickedFile.readAsBytes();
    //   images.add(imagefile);
    //   setState(() {});
    // }
  }

  checker(shouldsend) {
    print('Check is called');
    print('Check is called');
    print('Check is called');
    print('Check is called');
    print('Check is called');
    print('Check is called');
    print('Check is called');
    if (shouldsend == true) {
    } else {
      selectedValue1 = null;
      items = [];
    }

    if (selectedValue == 'mobileandtablets'.tr()) {
      items = mobileandtablets;
      setState(() {});
      print('phones');
    } else if (selectedValue == 'electronics'.tr()) {
      items = electronics;
      setState(() {});
      print('electronics');
    } else if (selectedValue == 'vehicles'.tr()) {
      items = vehicles;
      setState(() {});
      print('vehicles');
    } else if (selectedValue == 'property'.tr()) {
      items = property;
      setState(() {});
      print('property');
    } else if (selectedValue == 'beautyandhealth'.tr()) {
      items = beautyandhealth;
      setState(() {});
      print('property');
    } else if (selectedValue == 'babies'.tr()) {
      items = babies;
      setState(() {});
      print('property');
    } else if (selectedValue == 'foodandagri'.tr()) {
      items = foodandagri;
      setState(() {});
      print('property');
    } else if (selectedValue == 'homesupplies'.tr()) {
      items = homesupplies;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue == 'fashion'.tr()) {
      items = fashion;
      setState(() {});
      print('fashion');
    } else if (selectedValue == 'animals'.tr()) {
      items = animals;
      setState(() {});
      print('animals');
    } else if (selectedValue == 'commercialequipment'.tr()) {
      items = commercialequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue == 'construction'.tr()) {
      items = construction;
      setState(() {});
      print('animals');
    } else if (selectedValue == 'job'.tr()) {
      items = jobs;
      setState(() {});
      print('animals');
    }
    checkerpro(true);
  }

  checkerbro(shouldmake) {
    if (shouldmake == false) {
      brand = null;
    }
    print(brand);
    print('brand');
    if (selectedValue2 == 'Toyota'.tr()) {
      Brand = toyota;
      setState(() {});
    } else if (selectedValue2 == 'Hyundai'.tr()) {
      Brand = hyundai;
      setState(() {});
    } else if (selectedValue2 == 'Suzuki'.tr()) {
      Brand = suzuki;
      setState(() {});
    } else if (selectedValue2 == 'Nissan'.tr()) {
      Brand = Nissan;
      setState(() {});
    } else if (selectedValue2 == 'Ford'.tr()) {
      Brand = ford;
      setState(() {});
    } else if (selectedValue2 == 'Volkswagen'.tr()) {
      Brand = volswagen;
      setState(() {});
    } else if (selectedValue2 == 'Mercedes Benz'.tr()) {
      Brand = Mercedes;
      setState(() {});
    }
  }

  checkerpro(shouldsay) {
    if (shouldsay == false) {
      selectedValue2 = null;
      details = [];
    }
    print('checker pro');
    if (selectedValue1 == 'phone'.tr()) {
      details = phone;
      setState(() {});
      print('phones');
    } else if (selectedValue1 == 'tablets'.tr()) {
      details = tablets;
      setState(() {});
      print('phones');
    } else if (selectedValue1 == 'smartwatches'.tr()) {
      details = smartwatches;
      setState(() {});
      print('phones');
    } else if (selectedValue1 == 'mobileaccessory'.tr()) {
      details = mobileaccessory;
      setState(() {});
      print('phones');
    } else if (selectedValue1 == 'laptopsandcomputers'.tr()) {
      details = laptopsandcomputers;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'computeraccessory'.tr()) {
      details = computeraccessory;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'securityandsurvelliance'.tr()) {
      details = securityandsurvelliance;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'Networkingproducts'.tr()) {
      details = Networkingproducts;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'softwares'.tr()) {
      details = softwares;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'headphones'.tr()) {
      details = headphones;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'printersandscanners'.tr()) {
      details = printersandscanners;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'Tv'.tr()) {
      details = Tv;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'videogames'.tr()) {
      details = videogames;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'photoandvideocameras'.tr()) {
      details = photoandvideocameras;
      setState(() {});
      print('electronics');
    } else if (selectedValue1 == 'cars'.tr()) {
      details = cars;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'vehiclepartsandaccessories'.tr()) {
      details = vehiclepartsandaccessories;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'motorcycles'.tr()) {
      details = motorcycles;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'trucks'.tr()) {
      details = trucks;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'buses'.tr()) {
      details = buses;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'heavyequipment'.tr()) {
      details = heavyequipment;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'boats'.tr()) {
      details = boats;
      setState(() {});
      print('vehicles');
    } else if (selectedValue1 == 'houseandapartmentforrent'.tr()) {
      details = houseandapartmentforrent;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'houseandapartmentforsale'.tr()) {
      details = houseandapartmentforsale;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'landandplotsforsale'.tr()) {
      details = landandplotsforsale;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'landandplotsforrent'.tr()) {
      details = landandplotsforrent;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'commercialpropertyforsale'.tr()) {
      details = commercialpropertyforsale;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'commercialpropertyforrent'.tr()) {
      details = commercialpropertyforrent;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'vitaminsandsupplements'.tr()) {
      details = vitaminsandsupplements;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'hairbeauty'.tr()) {
      details = hairbeauty;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'fragrances'.tr()) {
      details = fragrances;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'skincare'.tr()) {
      details = skincare;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'sexualwellness'.tr()) {
      details = sexualwellness;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'bathandbody'.tr()) {
      details = bathandbody;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'makeup'.tr()) {
      details = makeup;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'babyandchildcare'.tr()) {
      details = babyandchildcare;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'childrenclothing'.tr()) {
      details = childrenclothing;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'childreshoe'.tr()) {
      details = childreshoe;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'toys'.tr()) {
      details = toys;
      setState(() {});
      print('property');
    } else if (selectedValue == 'mealsanddrinks'.tr()) {
      details = mealsanddrinks;
      setState(() {});
      print('property');
    } else if (selectedValue == 'livestockandpoultry'.tr()) {
      details = livestockandpoultry;
      setState(() {});
      print('property');
    } else if (selectedValue == 'feedssupplements'.tr()) {
      details = feedssupplements;
      setState(() {});
      print('property');
    } else if (selectedValue == 'farmmachineryandequipment'.tr()) {
      details = farmmachineryandequipment;
      setState(() {});
      print('property');
    } else if (selectedValue1 == 'furniture'.tr()) {
      details = furniture;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'homeappliances'.tr()) {
      details = homeappliances;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'kitchensupplies'.tr()) {
      details = kitchensupplies;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'gardensupplies'.tr()) {
      details = gardensupplies;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'householdchemicals'.tr()) {
      details = householdchemicals;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'homeaccessories'.tr()) {
      details = homeaccessories;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue1 == 'clothing'.tr()) {
      details = clothing;
      setState(() {});
      print('fashion');
    } else if (selectedValue1 == 'shoes'.tr()) {
      details = shoes;
      setState(() {});
      print('fashion');
    } else if (selectedValue1 == 'bags'.tr()) {
      details = bags;
      setState(() {});
      print('fashion');
    } else if (selectedValue1 == 'jewelry'.tr()) {
      details = jewelry;
      setState(() {});
      print('fashion');
    } else if (selectedValue1 == 'watches'.tr()) {
      details = watches;
      setState(() {});
      print('fashion');
    } else if (selectedValue1 == 'dogsandpuppies'.tr()) {
      details = dogsandpuppies;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'birds'.tr()) {
      details = birds;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'cats'.tr()) {
      details = cats;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'reptiles'.tr()) {
      details = reptiles;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'jobs'.tr()) {
      details = jobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'restaurant'.tr()) {
      details = restaurant;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'storeequipment'.tr()) {
      details = storeequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'manufacturingequipment'.tr()) {
      details = manufacturingequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'industrialovens'.tr()) {
      details = industrialovens;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'printingequipments'.tr()) {
      details = printingequipments;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'stagelightingandeffects'.tr()) {
      details = stagelightingandeffects;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'salonequipment'.tr()) {
      details = salonequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'stationary'.tr()) {
      details = stationary;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'Medicalsuppliesandequipment'.tr()) {
      details = Medicalsuppliesandequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'gym'.tr()) {
      details = gym;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'buildingmaterials'.tr()) {
      details = buildingmaterials;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'electricalequipment'.tr()) {
      details = electricalequipment;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'doors'.tr()) {
      details = doors;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'windows'.tr()) {
      details = windows;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'plumbingandwatersupply'.tr()) {
      details = plumbingandwatersupply;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'handtools'.tr()) {
      details = handtools;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'measuringandlayouttools'.tr()) {
      details = measuringandlayouttools;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'solarenergy'.tr()) {
      details = solarenergy;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'technologyjobs'.tr()) {
      details = technologyjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'healthandbeautyjobs'.tr()) {
      details = healthandbeautyjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'artandentertainmentjobs'.tr()) {
      details = artandentertainmentjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'securityjobs'.tr()) {
      details = securityjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'teachingjobs'.tr()) {
      details = teachingjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'travelandtourismjobs'.tr()) {
      details = travelandtourismjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'reaurantandsurveyjobs'.tr()) {
      details = reaurantandsurveyjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'customerservicesjobs'.tr()) {
      details = customerservicesjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'hoteljobs'.tr()) {
      details = hoteljobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'engineeringjobs'.tr()) {
      details = engineeringjobs;
      setState(() {});
      print('animals');
    } else if (selectedValue1 == 'otherjobs'.tr()) {
      details = otherjobs;
      setState(() {});
      print('animals');
    }
    // checkerbro(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, TabScreen.routeName);
            },
          ),
          shadowColor: Colors.white,
          title: Text('updateanadd'.tr(),
              style: TextStyle(fontSize: 20, color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: api.getaddsbyid(widget.id),
            //future: api.getaddsbycatagory(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Material(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text('enterdetailsoftheapp'.tr(),
                                  style: TextStyle(fontSize: 18))),
                          StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            itemCount: images.length < 5
                                ? images.length + 1
                                : images.length,
                            // staggeredTileBuilder: staggeredTileBuilder,
                            itemBuilder: (BuildContext context, index) {
                              return index == images.length
                                  ? Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          _getFromGallery();
                                        },
                                        child: DottedBorder(
                                          color: Colors.grey,
                                          strokeWidth: 2,
                                          radius: Radius.circular(8),
                                          dashPattern: [8, 4],
                                          child: ClipRRect(
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Stack(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: getimage(images[index]),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        top: -2,
                                        right: -2,
                                        child: IconButton(
                                          onPressed: () {
                                            images.remove(images[index]);
                                            setState(() => {});
                                          },
                                          icon: Icon(Icons.cancel_sharp,
                                              color: Colors.white),
                                        ),
                                      )
                                    ]);
                            },
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    index == 0 ? 2 : 1, index == 0 ? 2 : 1),
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: CustomTextField(
                              controller1: title,
                              hint: 'entertitleofyouradd'.tr(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 24,
                              ),
                              validator: (val) {
                                var nameRegExp = new RegExp(
                                    r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                                // if (val!.length > 5) {
                                // } else {
                                //   return "entervalidtitle".tr();
                                // }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: CustomTextField(
                              controller1: description,
                              hint: 'enterdescriptionofyouradd'.tr(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 24,
                              ),
                              validator: (val) {
                                var nameRegExp = new RegExp(
                                    r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                                //   if (val!.length > 5) {
                                //  } else {
                                //    return "Enter valid description";
                                //  }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2(
                                isExpanded: true,
                                hint: Text(
                                  'Category'.tr(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: categories
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  print('categories');
                                  print(categories);

                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                  checker(false);
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: DropdownButtonFormField2(
                              isExpanded: true,
                              hint: Text(
                                'Sub category'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue1,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue1 = value as String;
                                });
                                checkerpro(false);
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Pleaseentersubcategory';
                                }
                                return null;
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                          Builder(builder: (context) {
                            if (details.length > 0) {
                              return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: DropdownButtonFormField2(
                                      isExpanded: true,
                                      hint: Text(
                                        'details'.tr(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: details
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue2,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue2 = value as String;
                                        });
                                        checkerbro(false);
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Pleaseenterdetails';
                                        }
                                        return null;
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        height: 40,
                                        width: 140,
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ));
                            }
                            return Container();
                          }),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: CustomTextField(
                              controller1: price,
                              hint: 'enterpriceofyouradd'.tr(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 24,
                              ),
                              validator: (val) {
                                var passwordRegExp = RegExp(r"[0-9]$");
                                if (passwordRegExp.hasMatch(val!) &&
                                    val!.length < 20) {
                                } else {
                                  return 'entervalidprice'.tr();
                                }
                              },
                            ),
                          ),
                          Builder(builder: (context) {
                            if (selectedValue1 == 'cars'.tr()) {
                              return Container(
                                  margin: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromARGB(117, 110, 110, 110)),
                                  ),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text('Enter car details below'.tr()),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'Brand'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: Brand.map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )).toList(),
                                          value: brand,
                                          onChanged: (value) {
                                            setState(() {
                                              brand = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseenterbrand'.tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'transmission'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: Transmission.map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )).toList(),
                                          value: transmission,
                                          onChanged: (value) {
                                            setState(() {
                                              transmission = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseentertransmission'
                                                  .tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'engineSize'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: EngineSize.map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )).toList(),
                                          value: engineSize,
                                          onChanged: (value) {
                                            setState(() {
                                              engineSize = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseenterenginesize'
                                                  .tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'fuel'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: Fuel.map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )).toList(),
                                          value: fuel,
                                          onChanged: (value) {
                                            setState(() {
                                              fuel = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseenterfuel'.tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'color'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: color
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        CircleAvatar(
                                                            radius: 6,
                                                            backgroundColor:
                                                                getcolor(item)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                              .toList(),
                                          value: colorvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              colorvalue = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseentercolor'.tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: DropdownButtonFormField2(
                                          isExpanded: true,
                                          hint: Text(
                                            'Manifacturingyear'.tr(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: year
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: yearvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              yearvalue = value as String;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'pleaseenteryear'.tr();
                                            }
                                            return null;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: CustomTextField(
                                        controller1: kilometr,
                                        hint: 'Enter MileAge(KM)'.tr(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          size: 24,
                                        ),
                                        validator: (val) {
                                          var passwordRegExp =
                                              RegExp(r"[0-9]$");
                                          if (passwordRegExp.hasMatch(val!) &&
                                              val!.length < 20) {
                                          } else {
                                            return 'entervalidkm'.tr();
                                          }
                                        },
                                      ),
                                    ),
                                  ]));
                            }
                            return SizedBox();
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Change add status'.tr()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text('Newer'.tr()),
                                  leading: Radio<Status>(
                                    value: Status.newer,
                                    groupValue: status,
                                    onChanged: (Status? value) {
                                      setState(() {
                                        status = value!;
                                        print(status);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                    title: Text('Older'.tr()),
                                    leading: Radio<Status>(
                                        value: Status.older,
                                        groupValue: status,
                                        onChanged: (Status? value) {
                                          setState(() {
                                            status = value!;
                                            print(value);
                                          });
                                        })),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  var api = new Api();
                                  var mainindex =
                                      categories.indexOf(selectedValue!);
                                  var subindex = items.indexOf(selectedValue1!);
                                  var detailindex =
                                      details.indexOf(selectedValue2!);
                                  // if (items == phone) {
                                  //   tobesent = phonepro[index];
                                  //   setState(() {});
                                  // }
                                  tobesentmain = categoriespro[mainindex];

                                  if (items == mobileandtablets) {
                                    tobesent = mobileandtabletspro[subindex];
                                  } else if (items == electronics) {
                                    tobesent = electronicspro[subindex];
                                  } else if (items == vehicles) {
                                    tobesent = vehiclespro[subindex];
                                  } else if (items == property) {
                                    tobesent = propertypro[subindex];
                                  } else if (items == beautyandhealth) {
                                    tobesent = beautyandhealthpro[subindex];
                                  } else if (items == babies) {
                                    tobesent = babiespro[subindex];
                                  } else if (items == foodandagri) {
                                    tobesent = foodandagripro[subindex];
                                  } else if (items == homesupplies) {
                                    tobesent = homesuppliespro[subindex];
                                  } else if (items == fashion) {
                                    tobesent = fashionpro[subindex];
                                  } else if (items == animals) {
                                    tobesent = animalspro[subindex];
                                  } else if (items == commercialequipment) {
                                    tobesent = commercialequipmentpro[subindex];
                                  } else if (items == construction) {
                                    tobesent = constructionpro[subindex];
                                  }

                                  if (details == phone) {
                                    detailsent = phonepro[detailindex];
                                  } else if (details == tablets) {
                                    detailsent = tabletspro[detailindex];
                                  } else if (details == smartwatches) {
                                    detailsent = smartwatchespro[detailindex];
                                  } else if (details == mobileaccessory) {
                                    detailsent =
                                        mobileaccessorypro[detailindex];
                                  } else if (details == laptopsandcomputers) {
                                    detailsent =
                                        laptopsandcomputerspro[detailindex];
                                  } else if (details == computeraccessory) {
                                    detailsent =
                                        computeraccessorypro[detailindex];
                                  } else if (details ==
                                      securityandsurvelliance) {
                                    detailsent =
                                        securityandsurvelliancepro[detailindex];
                                  } else if (details == Networkingproducts) {
                                    detailsent =
                                        Networkingproductspro[detailindex];
                                  } else if (details == softwares) {
                                    detailsent = softwarespro[detailindex];
                                  } else if (details == headphones) {
                                    detailsent = headphonespro[detailindex];
                                  } else if (details == printersandscanners) {
                                    detailsent =
                                        printersandscannerspro[detailindex];
                                  } else if (details == Tv) {
                                    detailsent = Tvpro[detailindex];
                                  } else if (details == videogames) {
                                    detailsent = videogamespro[detailindex];
                                  } else if (details == photoandvideocameras) {
                                    detailsent =
                                        photoandvideocameraspro[detailindex];
                                  } else if (details == cars) {
                                    detailsent = carspro[detailindex];
                                  } else if (details ==
                                      vehiclepartsandaccessories) {
                                    detailsent = vehiclepartsandaccessoriespro[
                                        detailindex];
                                  } else if (details == motorcycles) {
                                    detailsent = motorcyclespro[detailindex];
                                  } else if (details == trucks) {
                                    detailsent = truckspro[detailindex];
                                  } else if (details == buses) {
                                    detailsent = busespro[detailindex];
                                  } else if (details == heavyequipment) {
                                    detailsent = heavyequipmentpro[detailindex];
                                  } else if (details == boats) {
                                    detailsent = boatspro[detailindex];
                                  } else if (details ==
                                      houseandapartmentforrent) {
                                    detailsent = houseandapartmentforrentpro[
                                        detailindex];
                                  } else if (details == landandplotsforsale) {
                                    detailsent =
                                        landandplotsforsalepro[detailindex];
                                  } else if (details == landandplotsforrent) {
                                    detailsent =
                                        landandplotsforrentpro[detailindex];
                                  } else if (details ==
                                      commercialpropertyforsale) {
                                    detailsent = commercialpropertyforsalepro[
                                        detailindex];
                                  } else if (details ==
                                      commercialpropertyforrent) {
                                    detailsent = commercialpropertyforrentpro[
                                        detailindex];
                                  } else if (details ==
                                      vitaminsandsupplements) {
                                    detailsent =
                                        vitaminsandsupplementspro[detailindex];
                                  } else if (details == hairbeauty) {
                                    detailsent = hairbeautypro[detailindex];
                                  } else if (details == fragrances) {
                                    detailsent = fragrancespro[detailindex];
                                  } else if (details == skincare) {
                                    detailsent = skincarepro[detailindex];
                                  } else if (details == sexualwellness) {
                                    detailsent = sexualwellnesspro[detailindex];
                                  } else if (details == bathandbody) {
                                    detailsent = bathandbodypro[detailindex];
                                  } else if (details == makeup) {
                                    detailsent = makeuppro[detailindex];
                                  } else if (details == babyandchildcare) {
                                    detailsent =
                                        babyandchildcarepro[detailindex];
                                  } else if (details == childrenclothing) {
                                    detailsent =
                                        childrenclothingpro[detailindex];
                                  } else if (details == childreshoe) {
                                    detailsent = childreshoepro[detailindex];
                                  } else if (details == toys) {
                                    detailsent = toyspro[detailindex];
                                  } else if (details == mealsanddrinks) {
                                    detailsent = mealsanddrinkspro[detailindex];
                                  } else if (details == livestockandpoultry) {
                                    detailsent =
                                        livestockandpoultrypro[detailindex];
                                  } else if (details == feedssupplements) {
                                    detailsent =
                                        feedssupplementspro[detailindex];
                                  } else if (details ==
                                      farmmachineryandequipment) {
                                    detailsent = farmmachineryandequipmentpro[
                                        detailindex];
                                  } else if (details == furniture) {
                                    detailsent = furniturepro[detailindex];
                                  } else if (details == homeappliances) {
                                    detailsent = homeappliancespro[detailindex];
                                  } else if (details == kitchensupplies) {
                                    detailsent =
                                        kitchensuppliespro[detailindex];
                                  } else if (details == gardensupplies) {
                                    detailsent = gardensuppliespro[detailindex];
                                  } else if (details == householdchemicals) {
                                    detailsent =
                                        householdchemicalspro[detailindex];
                                  } else if (details == homeaccessories) {
                                    detailsent =
                                        homeaccessoriespro[detailindex];
                                  } else if (details == clothing) {
                                    detailsent = clothingpro[detailindex];
                                  } else if (details == shoes) {
                                    detailsent = shoespro[detailindex];
                                  } else if (details == bags) {
                                    detailsent = bagspro[detailindex];
                                  } else if (details == jewelry) {
                                    detailsent = jewelrypro[detailindex];
                                  } else if (details == watches) {
                                    detailsent = watchespro[detailindex];
                                  } else if (details == dogsandpuppies) {
                                    detailsent = dogsandpuppiespro[detailindex];
                                  } else if (details == birds) {
                                    detailsent = birdspro[detailindex];
                                  } else if (details == cats) {
                                    detailsent = catspro[detailindex];
                                  } else if (details == reptiles) {
                                    detailsent = reptilespro[detailindex];
                                  } else if (details == jobs) {
                                    detailsent = jobspro[detailindex];
                                  } else if (details == restaurant) {
                                    detailsent = restaurantpro[detailindex];
                                  } else if (details == storeequipment) {
                                    detailsent = storeequipmentpro[detailindex];
                                  } else if (details ==
                                      manufacturingequipment) {
                                    detailsent =
                                        manufacturingequipmentpro[detailindex];
                                  } else if (details == industrialovens) {
                                    detailsent =
                                        industrialovenspro[detailindex];
                                  } else if (details == printingequipments) {
                                    detailsent =
                                        printingequipmentspro[detailindex];
                                  } else if (details ==
                                      stagelightingandeffects) {
                                    detailsent =
                                        stagelightingandeffectspro[detailindex];
                                  } else if (details == salonequipment) {
                                    detailsent = salonequipmentpro[detailindex];
                                  } else if (details == stationary) {
                                    detailsent = stationarypro[detailindex];
                                  } else if (details ==
                                      Medicalsuppliesandequipment) {
                                    detailsent = Medicalsuppliesandequipmentpro[
                                        detailindex];
                                  } else if (details == gym) {
                                    detailsent = gympro[detailindex];
                                  } else if (details == buildingmaterials) {
                                    detailsent =
                                        buildingmaterialspro[detailindex];
                                  } else if (details == electricalequipment) {
                                    detailsent =
                                        electricalequipmentpro[detailindex];
                                  } else if (details == doors) {
                                    detailsent = doorspro[detailindex];
                                  } else if (details == windows) {
                                    detailsent = windowspro[detailindex];
                                  } else if (details ==
                                      plumbingandwatersupply) {
                                    detailsent =
                                        plumbingandwatersupplypro[detailindex];
                                  } else if (details == handtools) {
                                    detailsent = handtoolspro[detailindex];
                                  } else if (details ==
                                      measuringandlayouttools) {
                                    detailsent =
                                        measuringandlayouttoolspro[detailindex];
                                  } else if (details == solarenergy) {
                                    detailsent = solarenergypro[detailindex];
                                  } else if (details == technologyjobs) {
                                    detailsent = technologyjobspro[detailindex];
                                  } else if (details == healthandbeautyjobs) {
                                    detailsent =
                                        healthandbeautyjobspro[detailindex];
                                  } else if (details ==
                                      artandentertainmentjobs) {
                                    detailsent =
                                        artandentertainmentjobspro[detailindex];
                                  } else if (details == securityjobs) {
                                    detailsent = securityjobspro[detailindex];
                                  } else if (items == teachingjobs) {
                                    detailsent = teachingjobspro[detailindex];
                                  } else if (details == travelandtourismjobs) {
                                    detailsent =
                                        travelandtourismjobspro[detailindex];
                                  } else if (details == reaurantandsurveyjobs) {
                                    detailsent =
                                        reaurantandsurveyjobspro[detailindex];
                                  } else if (details == customerservicesjobs) {
                                    detailsent =
                                        customerservicesjobspro[detailindex];
                                  } else if (items == hoteljobs) {
                                    detailsent = hoteljobspro[detailindex];
                                  } else if (details == engineeringjobs) {
                                    detailsent =
                                        engineeringjobspro[detailindex];
                                  } else if (details == otherjobs) {
                                    detailsent = otherjobspro[detailindex];
                                  }

                                  if (detailsent == null) {
                                    detailsent = '';
                                  }

                                  print('hi');
                                  // print(index);

                                  // Map<dynamic, dynamic>? robel;
                                  //                for (int i = 0; i < value.length; i++)
                                  //         {
                                  //           robel!.addAll({
                                  //             "url": value[i].url,
                                  //             "isprimary": value[i].url
                                  //           })
                                  //         },
                                  if (images.length == 0) {
                                    Fluttertoast.showToast(
                                        msg: "please add at least one image"
                                            .tr(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    EasyLoading.show(status: 'loading'.tr());
                                    var finalstatus = 'new';
                                    if (status.toString() == "Status.newer") {
                                      finalstatus = "new";
                                    } else if (status.toString() ==
                                        "Status.newer") {
                                      finalstatus = 'old';
                                    } else {
                                      finalstatus = "new";
                                    }
                                    Map map = {
                                      'transmission': transmission,
                                      'engineSize': engineSize,
                                      'fuel': fuel,
                                      'mileAge': kilometr.text
                                    };
                                    print(myimages);

                                    //here we have two items images which is collection of all the images in the view
                                    // myimages which is collection of the images added from asset
                                    if (myimages.length == 0) {
                                      Map<String, dynamic> toJson(url) {
                                        return {
                                          "url": url,
                                          "isprimary": false,
                                        };
                                      }

                                      List encondeToJson(images) {
                                        List jsonList = [];
                                        images
                                            .map((item) => jsonList
                                                .add(toJson(item['url'])))
                                            .toList();
                                        return jsonList;
                                      }

                                      List json = encondeToJson(images);

                                      //{"url": e['url'], "isnetwork": true}

                                      // var imagemap = json.encode(images.asMap());
                                      // List imagefinal = json
                                      //     .decode(imagemap)
                                      //     .map((e) => {
                                      //           "url": e["url"],
                                      //           "isprimary": false
                                      //         })
                                      //     .toList();
                                      // print('image final');
                                      // print(imagefinal);
                                      // print(imagefinal);

                                      api
                                          .updateadd(
                                              widget.id,
                                              title.text,
                                              description.text,
                                              tobesent,
                                              tobesentmain,
                                              detailsent,
                                              price.text,
                                              json,
                                              finalstatus,
                                              map)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Add Updated Successfully".tr(),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.SNACKBAR,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        EasyLoading.dismiss();

                                        Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                MyAdds(),
                                          ),
                                        );
                                      });
                                      EasyLoading.dismiss();
                                    } else {
                                      api.uploadphotos(myimages).then((value) {
                                        Map<String, dynamic>? toJson(url) {
                                          if (url.runtimeType == String) {
                                            return {
                                              "url": url,
                                              "isprimary": false,
                                            };
                                          }
                                        }

                                        List encondeToJson(images) {
                                          List jsonList = [];

                                          images
                                              .map((item) => jsonList
                                                  .add(toJson(item['url'])))
                                              .toList();
                                          return jsonList;
                                        }

                                        List json = encondeToJson(images);
                                        var jsonfinal = json
                                            .where((e) => e != null)
                                            .toList();

                                        print('second case ');
                                        print(value);
                                        print(jsonfinal);
                                        print(jsonDecode(value) + jsonfinal);

                                        api
                                            .updateadd(
                                                widget.id,
                                                title.text,
                                                description.text,
                                                tobesent,
                                                tobesentmain,
                                                detailsent,
                                                price.text,
                                                jsonDecode(value) + json,
                                                finalstatus,
                                                map)
                                            .then((add) {
                                          _formKey.currentState!.reset();
                                          title.clear();
                                          name.clear();
                                          description.clear();
                                          price.clear();
                                          kilometr.clear();
                                          myimages = [];
                                          setState(() {});
                                          Fluttertoast.showToast(
                                              msg: "Add Updated Successfully"
                                                  .tr(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.SNACKBAR,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          EasyLoading.dismiss();

                                          Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  MyAdds(),
                                            ),
                                          );
                                          // Navigator.of(context)
                                          //     .pushNamed(HomeScreen1.routeName)
                                        }).onError((error, stackTrace) {
                                          EasyLoading.dismiss();
                                        });
                                      });
                                    }
                                  }
                                }
                              },
                              child: Text('updateadd'.tr()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(children: [
                    Text('Error occured'.tr()),
                    Image.asset(
                      'assets/images/errorpage.png',
                      height: 200,
                    ),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              api.getaddsbyid(widget.id);
                            });
                          },
                          child: Text('Retry again'.tr())),
                    )
                  ]),
                );
              } else
                return CircularProgressIndicator();
            }));
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

  getimage(image) {
    if (image['isnetwork'] == true) {
      return NetworkImage(image['url']);
    }
    return FileImage(image['url']);
  }
}
//   bool get isValidName {
//     final nameRegExp =
//         new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//     return nameRegExp.hasMatch(this);
//   }

//   bool get isValidPassword {
//     final passwordRegExp = RegExp(
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
//     return passwordRegExp.hasMatch(this);
//   }

//   bool get isNotNull {
//     return this != null;
//   }

//   bool? get isValidPhone {
//     final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
//     return phoneRegExp.hasMatch(this);
//   }
// }
