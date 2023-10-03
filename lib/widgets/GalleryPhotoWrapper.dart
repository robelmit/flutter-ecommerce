import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../models/image.dart';

class GalleryPhotoWrapper extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final Decoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initalIndex;
  final PageController pageController;
  final List<ImageModel>? galleries;
  final Axis? scrollDirection;

  GalleryPhotoWrapper(
      {Key? key,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      required this.initalIndex,
      this.galleries,
      this.scrollDirection})
      : pageController = PageController(initialPage: initalIndex);

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoWrapper();
  }
}

class _GalleryPhotoWrapper extends State<GalleryPhotoWrapper> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.initalIndex;
  }

  void onPageChanged(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        title: Text('Gallery'.tr()),
      ),
      body: Container(
          decoration: widget.backgroundDecoration,
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.galleries!.length,
                loadingBuilder: widget.loadingBuilder,
                backgroundDecoration:
                    widget.backgroundDecoration as BoxDecoration?,
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                wantKeepAlive: true,
                scrollDirection: widget.scrollDirection!,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${currentIndex + 1} / ${widget.galleries!.length!} ${'images'.tr()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          )),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    var item = widget.galleries![index];
    return PhotoViewGalleryPageOptions(
        imageProvider: NetworkImage(item.url),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
        // maxScale: PhotoViewComputedScale.contained * 1.1,
        heroAttributes: PhotoViewHeroAttributes(tag: '${item.id!} $index'));
  }
}
