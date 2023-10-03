import 'package:app/constants/vehicles.dart';
import 'package:app/screens/subcatagorypro.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/animals.dart';
import '../constants/babies.dart';
import '../constants/beautyandhealth.dart';
import '../constants/commercialequipment.dart';
import '../constants/construction.dart';
import '../constants/electronics.dart';
import '../constants/fashion.dart';
import '../constants/foodandagri.dart';
import '../constants/homesupplies.dart';
import '../constants/jobs.dart';
import '../constants/property.dart';
import '../constants/mobileandtablets.dart';
import '../models/Categorypro.dart';
import '../models/category.dart';

class DetailedList extends StatefulWidget {
  late List<Category> catagories;
  final String title;

  late List<Categorypro> catagoriestosend;
  DetailedList(
      {Key? key,
      required this.catagories,
      required this.catagoriestosend,
      required this.title});

  @override
  State<DetailedList> createState() => _DetailedListState();
}

class _DetailedListState extends State<DetailedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.catagories.length,
        itemBuilder: (context, index) => Card(
          elevation: 5,
          margin: const EdgeInsets.all(4),
          child: InkWell(
            onTap: () {
              if (widget.catagories == mobileandtablets) {
                if (widget.catagoriestosend[index].catName == 'phone') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: phone,
                          catagoriestosend: phonepro,
                          name: 'phone',
                          title: 'phone'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'tablets') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: tablets,
                          catagoriestosend: tabletspro,
                          name: 'tablets',
                          title: 'tablets'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'smartwatches') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: smartwatches,
                          catagoriestosend: smartwatchespro,
                          name: 'smartwatches',
                          title: 'smartwatches'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'mobileaccessory') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: mobileaccessory,
                          catagoriestosend: mobileaccessorypro,
                          name: 'mobile accessory',
                          title: 'mobile accessory'.tr()
                          
                          ))
                          
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == electronics) {
                if (widget.catagoriestosend[index].catName ==
                    'laptopsandcomputersadasd') {
                } else if (widget.catagoriestosend[index].catName ==
                    'laptopsandcomputers') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: laptopsandcomputers,
                          catagoriestosend: laptopsandcomputerspro,
                          name: 'laptopsandcomputers',
                          title: 'laptopsandcomputers'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'computeraccessory') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: computeraccessory,
                          catagoriestosend: computeraccessorypro,
                          name: 'computeraccessory',
                          title: 'computeraccessory'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'securityandsurvelliance') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: securityandsurvelliance,
                          catagoriestosend: securityandsurvelliancepro,
                          name: 'securityandsurvelliance',
                          title: 'securityandsurvelliance'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'Networkingproducts') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: Networkingproducts,
                          catagoriestosend: Networkingproductspro,
                          name: 'Networking products',
                          title: 'Networkingproducts'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'softwares') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: softwares,
                          catagoriestosend: softwarespro,
                          name: 'softwares',
                          title: 'softwares'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'printersandscanners') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: printersandscanners,
                          catagoriestosend: printersandscannerspro,
                          name: 'printersandscanners',
                          title: 'printersandscanners'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'Tv') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: Tv,
                          catagoriestosend: Tvpro,
                          name: 'Tv',
                          title: 'Tv'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'videogames') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: videogames,
                          catagoriestosend: videogamespro,
                          name: 'videogames',
                          title: 'videogames'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'photoandvideocameras') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: photoandvideocameras,
                          catagoriestosend: photoandvideocameraspro,
                          name: 'photoandvideocameras',
                          title: 'photoandvideocameras'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'videogames') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: videogames,
                          catagoriestosend: videogamespro,
                          name: 'videogames',
                          title: 'videogames'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'printersandscanners') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: videogames,
                          catagoriestosend: videogamespro,
                          name: 'printersandscanners',
                          title: 'printersandscanners'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'headphones') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: videogames,
                          catagoriestosend: videogamespro,
                          name: 'headphones',
                          title: 'headphones'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == homesupplies) {
                if (widget.catagoriestosend[index].catName == 'furniture') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: furniture,
                          catagoriestosend: furniturepro,
                          name: 'furniture',
                          title: 'furniture'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'homeappliances') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: homeappliances,
                          catagoriestosend: homeappliancespro,
                          name: 'homeappliances',
                          title: 'homeappliances'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'kitchensupplies') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: kitchensupplies,
                          catagoriestosend: kitchensuppliespro,
                          name: 'kitchensupplies',
                          title: 'kitchensupplies'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'gardensupplies') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: gardensupplies,
                          catagoriestosend: gardensuppliespro,
                          name: 'gardensupplies',
                          title: 'gardensupplies'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'householdchemicals') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'householdchemicals',
                          title: 'householdchemicals'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'homeaccessories') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: homeaccessories,
                          catagoriestosend: homeaccessoriespro,
                          name: 'homeaccessories',
                          title: 'homeaccessories'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == animalsfinal) {
                if (widget.catagoriestosend[index].catName ==
                    'dogsandpuppies') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: dogsandpuppies,
                          catagoriestosend: dogsandpuppiespro,
                          name: 'dogsandpuppies',
                          title: 'dogsandpuppies'.tr()
                          
                          ))

                          );
                } else if (widget.catagoriestosend[index].catName == 'birds') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: birds,
                          catagoriestosend: birdspro,
                          name: 'birds',
                          title: 'birds'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'cats') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: cats,
                          catagoriestosend: catspro,
                          name: 'cats',
                          title: 'cats'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'reptiles') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: reptiles,
                          catagoriestosend: reptilespro,
                          name: 'reptiles',
                          title: 'reptiles'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'others') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: others,
                          catagoriestosend: otherspro,
                          name: 'others',
                          title: 'others'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == fashion) {
                if (widget.catagoriestosend[index].catName == 'clothing') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'clothing',
                          title: 'clothing'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'shoes') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'shoes',
                          title: 'shoes'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'bags') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [], catagoriestosend: [], name: 'bags',title: 'bags'.tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'jewelry') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'jewelry',
                          title: 'jewelry'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'watches') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'watches',
                          title: 'watches'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == vehicles) {
                if (widget.catagoriestosend[index].catName == 'cars') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: cars,
                          catagoriestosend: carspro,
                          name: 'cars',
                          title: 'cars'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'vehiclepartsandaccessories') {
                  print('wechema');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: vehiclepartsandaccessories,
                          catagoriestosend: vehiclepartsandaccessoriespro,
                          name: 'vehiclepartsandaccessories',
                          title: 'vehiclepartsandaccessories'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'motorcycles') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: motorcycles,
                          catagoriestosend: motorcyclespro,
                          name: 'motorcycles',
                          title: 'motorcycles'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'trucks') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: trucks,
                          catagoriestosend: truckspro,
                          name: 'trucks',
                          title: 'trucks'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'buses') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: buses,
                          catagoriestosend: busespro,
                          name: 'buses',
                          title: 'buses'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'heavyequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: heavyequipment,
                          catagoriestosend: heavyequipmentpro,
                          name: 'heavyequipment',
                          title: 'heavyequipment'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'boats') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: boats,
                          catagoriestosend: boatspro,
                          name: 'boats',
                          title: 'boats'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == property) {
                if (widget.catagoriestosend[index].catName ==
                    'houseandapartmentforsale') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: houseandapartmentforsale,
                          catagoriestosend: houseandapartmentforsalepro,
                          name: 'houseandapartmentforsale',
                          title: 'houseandapartmentforsale'.tr()
                          
                          ))
                          
                          );
                }
                if (widget.catagoriestosend[index].catName ==
                    'houseandapartmentforrent') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: houseandapartmentforrent,
                          catagoriestosend: houseandapartmentforrentpro,
                          name: 'houseandapartmentforrent',
                          title: 'houseandapartmentforrent'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'landandplotsforsale') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'landandplotsforsale',
                          title: 'landandplotsforsale'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'landandplotsforrent') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'landandplotsforrent',
                          title: 'landandplotsforrent'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'commercialpropertyforsale') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: commercialpropertyforsale,
                          catagoriestosend: commercialpropertyforsalepro,
                          name: 'commercialpropertyforsale',
                          title: 'commercialpropertyforsale'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'commercialpropertyforrent') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'commercialpropertyforrent',
                          title: 'commercialpropertyforrent'.tr()
                          
                          ))
                          
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == beautyandhealth) {
                if (widget.catagoriestosend[index].catName ==
                    'vitaminsandsupplements') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'vitaminsandsupplements',
                          title: 'vitaminsandsupplements'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'hairbeauty') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'hairbeauty',
                          title: 'hairbeauty'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'fragrances') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'fragrances',
                          title: 'fragrances'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'skincare') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'skincare',
                          title: 'skincare'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'sexualwellness') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'sexualwellness',
                          title: 'sexualwellness'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'bathandbody') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'bathandbody',
                          title: 'bathandbody'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName == 'makeup') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'makeup',
                          title: 'makeup'.tr()
                          
                          ))
                          
                          );
                }
                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == babies) {
                if (widget.catagoriestosend[index].catName ==
                    'babyandchildcare') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'babyandchildcare',
                          title: 'babyandchildcare'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'childrenclothing') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'childrenclothing',
                          title: 'childrenclothing'.tr()
                          
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'childreshoe') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'childreshoe',
                          title: 'childreshoe'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName == 'toys') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [], catagoriestosend: [], name: 'toys',
                          title:'toys'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == foodandagri) {
                if (widget.catagoriestosend[index].catName ==
                    'mealsanddrinks') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'mealsanddrinks',
                          title: 'mealsanddrinks'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'livestockandpoultry') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'livestockandpoultry',
                          title: 'livestockandpoultry'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'feedssupplements') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'feedssupplements',
                          title: 'feedssupplements'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'farmmachineryandequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'farmmachineryandequipment',
                          title: 'farmmachineryandequipment'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == homesupplies) {
                if (widget.catagoriestosend[index].catName == 'furniture') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: furniture,
                          catagoriestosend: furniturepro,
                          name: 'furniture',
                          title: 'furniture'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'homeappliances') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: homeappliances,
                          catagoriestosend: homeappliancespro,
                          name: 'homeappliances',
                          title: 'homeappliances'.tr()
                          
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'kitchensupplies') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: kitchensupplies,
                          catagoriestosend: kitchensuppliespro,
                          name: 'kitchensupplies',
                          title: 'kitchensupplies'.tr()
                          ))
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'gardensupplies') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: gardensupplies,
                          catagoriestosend: gardensuppliespro,
                          name: 'gardensupplies',
                          title: 'gardensupplies'.tr()
                          
                          ))
                          );
                }

                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == jobs) {
                if (widget.catagoriestosend[index].catName ==
                    'technologyjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: technologyjobs,
                          catagoriestosend: technologyjobspro,
                          name: 'technologyjobs',
                          title: 'technologyjobs'.tr()
                          ))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'healthandbeautyjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: healthandbeautyjobs,
                          catagoriestosend: healthandbeautyjobspro,
                          name: 'healthandbeautyjobs',
                          title: "healthandbeautyjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'artandentertainmentjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: artandentertainmentjobs,
                          catagoriestosend: artandentertainmentjobspro,
                          name: 'artandentertainmentjobs',
                          title: "artandentertainmentjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'securityjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: securityjobs,
                          catagoriestosend: securityjobspro,
                          name: 'securityjobs',
                          title: "securityjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'teachingjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: teachingjobs,
                          catagoriestosend: teachingjobspro,
                          name: 'teachingjobs',
                          title: "teachingjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'travelandtourismjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: travelandtourismjobs,
                          catagoriestosend: travelandtourismjobspro,
                          name: 'travelandtourismjobs',
                          title: "travelandtourismjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'reaurantandsurveyjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: reaurantandsurveyjobs,
                          catagoriestosend: reaurantandsurveyjobspro,
                          name: 'reaurantandsurveyjobs',
                          title: "reaurantandsurveyjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'customerservicesjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: customerservicesjobs,
                          catagoriestosend: customerservicesjobspro,
                          name: 'customerservicesjobs',
                          title: "customerservicesjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'hoteljobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: hoteljobs,
                          catagoriestosend: hoteljobspro,
                          name: 'hoteljobs',
                          title: "hoteljobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'engineeringjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: engineeringjobs,
                          catagoriestosend: engineeringjobspro,
                          name: 'engineeringjobs',
                          title: "engineeringjobs".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'otherjobs') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: otherjobs,
                          catagoriestosend: otherjobspro,
                          name: 'otherjobs',
                          title: "otherjobs".tr()))
                          
                          );
                }
                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == commercialequipment) {
                if (widget.catagoriestosend[index].catName == 'restaurant') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'restaurant',
                          title: "restaurant".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'storeequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'storeequipment',
                          title: "storeequipment".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'manufacturingequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'manufacturingequipment',
                          title: "manufacturingequipment".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'industrialovens') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'industrialovens',
                          title: "industrialovens".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'printingequipments') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'printingequipments',
                          title: "printingequipments".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'stagelightingandeffects') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'stagelightingandeffects',
                          title: "stagelightingandeffects".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'salonequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'salonequipment',
                          title: "salonequipment".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'stationary') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'stationary',
                          title: "stationary".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'Medicalsuppliesandequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'Medicalsuppliesandequipment',
                          title: "Medicalsuppliesandequipment".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName == 'gym') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'gym',
                          title: "gym".tr()))
                          
                          );
                }
                print(widget.catagoriestosend[index].catName);
              } else if (widget.catagories == construction) {
                if (widget.catagoriestosend[index].catName ==
                    'buildingmaterials') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'buildingmaterials',
                          title: "buildingmaterials".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'solarenergy') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'solarenergy',
                          title: "solarenergy".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'electricalequipment') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'electricalequipment',
                          title: "electricalequipment".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName == 'doors') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'doors',
                          title: "doors".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'electricalhandtools') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'electricalhandtools',
                          title: "electricalhandtools".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'plumbingandwatersupply') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'plumbingandwatersupply',
                          title: "plumbingandwatersupply".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'handtools') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'handtools',
                          title: "handtools".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'measuringandlayouttools') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'measuringandlayouttools',
                          title: "measuringandlayouttools".tr()))
                          
                          );
                } else if (widget.catagoriestosend[index].catName ==
                    'solarenergy') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Subcatagorypro(
                          catagories: [],
                          catagoriestosend: [],
                          name: 'solarenergy',
                          title: "solarenergy".tr()))
                          
                          );
                }
                print(widget.catagoriestosend[index].catName);
              }
            },
            child: ListTile(
              leading: SizedBox(
                width: 35,
                height: 30,
                child: SvgPicture.asset(
                  widget.catagories[index].catIcon,
                  width: 35,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(widget.catagories[index].catName),
              // subtitle: Text('24 adds'),
              trailing: const Icon(Icons.chevron_right_sharp),
            ),
          ),
        ),
      ),
    );
  }
}
