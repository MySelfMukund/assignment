// ignore_for_file: invalid_use_of_protected_member, unnecessary_null_comparison

import 'package:assignment_task/app/constants/constants.dart';
import 'package:assignment_task/app/modules/global_widgets/formatted_date_text.dart';
import 'package:assignment_task/app/modules/global_widgets/image_widget.dart';
import 'package:assignment_task/app/modules/home/model/news_model_model.dart';
import 'package:assignment_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/vertical_space.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final double gridItemWidth = size.width / 2;
    final double gridItemHeight = (size.height - kToolbarHeight - 32);

    return Scaffold(
      appBar: buildAppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildWelcomTextWidget(),
                const VerticalSpace(
                  height: 5,
                ),
                buildSubHeadingTextWidget(),
                const VerticalSpace(),
                buildTopNewHeaderWidget(),
                const VerticalSpace(),
                buildTopNewSliderWidget(context),
                const VerticalSpace(),
                //using this to find in widget testing
                const Text(
                  StringConstants.dailyNews,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const VerticalSpace(
                  height: 5,
                ),
                buildGridViewNewsWidget(gridItemWidth, gridItemHeight),
              ],
            ),
            Obx(() => controller.addMoreAllNewsLoading.isTrue
                ? const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LoadingMoreWidget(),
                  )
                : const SizedBox())
          ],
        ),
      ),
    );
  }

  Widget buildTopNewHeaderWidget() {
    return const Text(
      StringConstants.topNew,
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
    );
  }

  Text buildSubHeadingTextWidget() {
    return const Text(
      StringConstants.discoverText,
      style: TextStyle(fontSize: 14, color: Colors.grey),
    );
  }

  Text buildWelcomTextWidget() {
    return const Text(
      StringConstants.welcomeText,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  AppBar buildAppBarWidget() {
    return AppBar(
      key: const Key('appBar'),
      title: const Text(StringConstants.news),
      centerTitle: true,
    );
  }

  Widget buildGridViewNewsWidget(double itemWidth, double itemHeight) {
    return Expanded(
      child: Obx(
        () => controller.isAllNewsLoading.isTrue
            ? const LoadingWidget()
            : GridView.builder(
                shrinkWrap: true,
                controller: controller.gridViewController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: (100 / 100)),
                itemBuilder: (context, index) {
                  NewsDataModel singleGridItem =
                      controller.allNewsList.value[index];
                  return buildGridTileItemWidget(singleGridItem, index);
                },
                itemCount: controller.allNewsList.value == null
                    ? 0
                    : controller.allNewsList.value.length,
              ),
      ),
    );
  }

  Widget buildGridTileItemWidget(NewsDataModel singleGridItem, int index) {
    return InkWell(
      onTap: () {
        controller.selectedNewsItem.value = controller.allNewsList[index];
        Get.toNamed(
          Routes.EXPANDED_SCREEN,
        );
      },
      child: GridTile(
          key: UniqueKey(),
          child: Column(
            children: [
              ImageWidget(data: singleGridItem, width: 100, height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  singleGridItem.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }

  Widget buildTopNewSliderWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Obx(
        () => LoadingOverlay(
          isLoading: controller.isTopNewsLoading.value,
          progressIndicator: const LoadingMoreWidget(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTopNewsLIstViewBuilderWidget(),
              Obx(() => controller.addMoreTopNewsLoading.isTrue
                  ? const LoadingMoreWidget()
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopNewsLIstViewBuilderWidget() {
    return Expanded(
      child: ListView.separated(
          controller: controller.topNewScrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            NewsDataModel singleTopNew = controller.topNewsList.value[index];
            return buildTopNewsListItemWidget(context, singleTopNew);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: controller.topNewsList.value == null
              ? 0
              : controller.topNewsList.value.length),
    );
  }

  Widget buildTopNewsListItemWidget(
      BuildContext context, NewsDataModel singleTopNew) {
    return InkWell(
      onTap: () {
        controller.selectedNewsItem.value = singleTopNew;
        Get.toNamed(Routes.EXPANDED_SCREEN);
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.20,
            child: ImageWidget(
              width: 250,
              data: singleTopNew,
              height: 180,
            ),
          ),
          const VerticalSpace(),
          SizedBox(
            width: 250,
            child: Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                singleTopNew.title!),
          ),
          FormattedDateText(
            dateData: singleTopNew.publishedAt.toString(),
            width: 250,
            isLeftAligned: false,
          )
        ],
      ),
    );
  }

  // CachedNetworkImage buildCachedNetworkImageWidget(
  //     NewsDataModel singleTopNew, double width, double height) {
  //   return CachedNetworkImage(
  //     imageUrl: singleTopNew.imageUrl!,
  //     imageBuilder: (context, imageProvider) => Container(
  //       width: width,
  //       height: height,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.rectangle,
  //         borderRadius: BorderRadius.circular(10),
  //         image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
  //       ),
  //     ),
  //     placeholder: (context, url) => const LoadingMoreWidget(),
  //     errorWidget: (context, url, error) => const Icon(Icons.error),
  //   );
  // }
}
