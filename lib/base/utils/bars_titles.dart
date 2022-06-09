// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get_it/get_it.dart';
// import 'package:tuple/tuple.dart';
//
// import '../../create_post/presentation/pages/create_post_page.dart';
// import '../presentation/widgets/settings_action_app_bar_icon.dart';
//
// enum PageIndex {
//   home,
//   discover,
//   profile,
// }
//
// extension PageIndexExt on PageIndex {
//   String get appBartitle => getAppBarTitle(this, false);
//   String get navigationBarTitle => getBottomTitle(this, false);
//   // AppBarParams get appBarParams => getAppBarParams(this, false);
//
//   GlobalKey<NavigatorState>? get currentNavigator {
//     switch (this) {
//       case PageIndex.home:
//         // return HomePage.navKey;
//       case PageIndex.discover:
//         // return DiscoverPage.navKey;
//       case PageIndex.profile:
//         // return ProfilePage.navKey;
//     }
//   }
//
//   Tuple2<AssetImage, AssetImage> get icons {
//     switch (this) {
//       case PageIndex.home:
//         // return Tuple2(AppIcons.homeIcon, AppIcons.homeSelected);
//       case PageIndex.discover:
//         // return Tuple2(AppIcons.discoverIcon, AppIcons.discoverSelectedIcon);
//       case PageIndex.profile:
//         // return Tuple2(AppIcons.personalProfileIcon, AppIcons.personalProfileSelectedIcon);
//     }
//   }
// }
//
// String getAppBarTitle(PageIndex pageIndex, bool isCreator) {
//   switch (pageIndex) {
//     case PageIndex.home:
//       return 'lbl_home';
//
//     case PageIndex.discover:
//       return 'lbl_discover';
//
//     case PageIndex.profile:
//       return 'lbl_profile';
//
//     default:
//       return 'not_exist';
//   }
// }
//
// String getBottomTitle(PageIndex pageIndex, bool isCreator) {
//   switch (pageIndex) {
//     case PageIndex.home:
//       return 'lbl_home';
//
//     case PageIndex.discover:
//       return 'lbl_discover';
//
//     case PageIndex.profile:
//       return 'lbl_profile';
//
//     default:
//       return 'not_exist';
//   }
// }
//
// // AppBarParams getAppBarParams(PageIndex pageIndex, bool isCreator) {
// //   final UserModel localUser = GetIt.I();
// //
// //   switch (pageIndex) {
// //     case PageIndex.home:
// //       return baseAppBarParams(
// //           title: pageIndex.appBartitle,
// //           onBackPressed: null,
// //           showNotificationActions: true,
// //           actions: [
// //             if (localUser.role == UserRole.content_creator)
// //               InkWell(
// //                 onTap: () => App.navKey.currentContext?.navigator.push(
// //                   RevealRoute(
// //                     maxRadius: App.navKey.currentContext!.fullHeight * 2,
// //                     centerAlignment: Alignment.topRight,
// //                     centerOffset: const Offset(0, 0),
// //                     minRadius: 0,
// //                     page: const CreatePostPage(),
// //                     transitionDuration: const Duration(milliseconds: 800),
// //                     reverseTransitionDuration: const Duration(milliseconds: 400),
// //                   ),
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: 12.0.w),
// //                   child: SvgPicture.asset(AppIcons.createPost.assetName, width: 48.w, height: 48.h),
// //                 ),
// //               )
// //           ]);
// //
// //     case PageIndex.discover:
// //       return baseAppBarParams(
// //         title: pageIndex.appBartitle,
// //         onBackPressed: null,
// //         showNotificationActions: true,
// //       );
// //
// //     case PageIndex.profile:
// //       return baseAppBarParams(
// //         title: pageIndex.appBartitle,
// //         onBackPressed: null,
// //         showNotificationActions: false,
// //         actions: [
// //           if (localUser.role == UserRole.content_creator)
// //             InkWell(
// //               onTap: () => App.navKey.currentContext?.navigator.push(
// //                 RevealRoute(
// //                   maxRadius: App.navKey.currentContext!.fullHeight * 2,
// //                   centerAlignment: Alignment.topRight,
// //                   centerOffset: const Offset(0, 0),
// //                   minRadius: 0,
// //                   page: const CreatePostPage(),
// //                   transitionDuration: const Duration(milliseconds: 800),
// //                   reverseTransitionDuration: const Duration(milliseconds: 400),
// //                 ),
// //               ),
// //               child: SvgPicture.asset(AppIcons.createPost.assetName, width: 48.w, height: 48.h),
// //             ),
// //           const SettingsActionAppIcon(),
// //         ],
// //       );
// //
// //     default:
// //       throw UnimplementedError('');
// //   }
// // }
