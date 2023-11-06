import 'package:get/get.dart';

import '../modules/analysis/bindings/analysis_binding.dart';
import '../modules/analysis/views/analysis_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/changepassword/bindings/changepassword_binding.dart';
import '../modules/changepassword/views/changepassword_view.dart';
import '../modules/forgotpass/bindings/forgotpass_binding.dart';
import '../modules/forgotpass/views/forgotpass_view.dart';
import '../modules/ghistory/bindings/ghistory_binding.dart';
import '../modules/ghistory/views/ghistory_view.dart';
import '../modules/ghome/bindings/ghome_binding.dart';
import '../modules/ghome/views/ghome_view.dart';
import '../modules/gmenu/bindings/gmenu_binding.dart';
import '../modules/gmenu/views/gmenu_view.dart';
import '../modules/gqrcode/bindings/gqrcode_binding.dart';
import '../modules/gqrcode/views/gqrcode_view.dart';
import '../modules/guestanalysis/bindings/guestanalysis_binding.dart';
import '../modules/guestanalysis/views/guestanalysis_view.dart';
import '../modules/guesthome/bindings/guesthome_binding.dart';
import '../modules/guesthome/views/guesthome_view.dart';
import '../modules/hattendance/bindings/hattendance_binding.dart';
import '../modules/hattendance/views/hattendance_view.dart';
import '../modules/hhome/bindings/hhome_binding.dart';
import '../modules/hhome/views/hhome_view.dart';
import '../modules/hmenu/bindings/hmenu_binding.dart';
import '../modules/hmenu/views/hmenu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hostel_home/bindings/hostel_home_binding.dart';
import '../modules/hostel_home/views/hostel_home_view.dart';
import '../modules/hosteleranalysis/bindings/hosteleranalysis_binding.dart';
import '../modules/hosteleranalysis/views/hosteleranalysis_view.dart';
import '../modules/huser/bindings/huser_binding.dart';
import '../modules/huser/views/huser_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menucard/bindings/menucard_binding.dart';
import '../modules/menucard/views/menucard_view.dart';
import '../modules/messmainhom/bindings/messmainhom_binding.dart';
import '../modules/messmainhom/views/messmainhom_view.dart';
import '../modules/messmenu/bindings/messmenu_binding.dart';
import '../modules/messmenu/views/messmenu_view.dart';
import '../modules/mhdash/bindings/mhdash_binding.dart';
import '../modules/mhdash/views/mhdash_view.dart';
import '../modules/mhuser/bindings/mhuser_binding.dart';
import '../modules/mhuser/views/mhuser_view.dart';
import '../modules/qrcode/bindings/qrcode_binding.dart';
import '../modules/qrcode/views/qrcode_view.dart';
import '../modules/qrscanner/bindings/qrscanner_binding.dart';
import '../modules/qrscanner/views/qrscanner_view.dart';
import '../modules/sign/bindings/sign_binding.dart';
import '../modules/sign/views/sign_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';

// import '../modules/hostelarhome/bindings/hostelarhome_binding.dart';
// import '../modules/hostelarhome/views/hostelarhome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.SIGN,
      page: () => SignView(),
      binding: SignBinding(),
    ),
    GetPage(
      name: _Paths.GUESTHOME,
      page: () => const GuesthomeView(),
      binding: GuesthomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOSTELARHOME,
    //   page: () => const HostelarhomeView(),
    //   binding: HostelarhomeBinding(),
    // ),
    GetPage(
      name: _Paths.FORGOTPASS,
      page: () => const ForgotpassView(),
      binding: ForgotpassBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.GHOME,
      page: () => const GhomeView(),
      binding: GhomeBinding(),
    ),
    GetPage(
      name: _Paths.GHISTORY,
      page: () => const GhistoryView(),
      binding: GhistoryBinding(),
    ),
    GetPage(
      name: _Paths.HOSTEL_HOME,
      page: () => const HostelHomeView(),
      binding: HostelHomeBinding(),
    ),
    GetPage(
      name: _Paths.HHOME,
      page: () => const HhomeView(),
      binding: HhomeBinding(),
    ),
    GetPage(
      name: _Paths.HUSER,
      page: () => const HuserView(),
      binding: HuserBinding(),
    ),
    GetPage(
      name: _Paths.GMENU,
      page: () => const GmenuView(),
      binding: GmenuBinding(),
    ),
    GetPage(
      name: _Paths.HMENU,
      page: () => const HmenuView(),
      binding: HmenuBinding(),
    ),
    GetPage(
      name: _Paths.HATTENDANCE,
      page: () => const HattendanceView(),
      binding: HattendanceBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => const ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.MESSMAINHOM,
      page: () => const MessmainhomView(),
      binding: MessmainhomBinding(),
    ),
    GetPage(
      name: _Paths.MHUSER,
      page: () => const MhuserView(),
      binding: MhuserBinding(),
    ),
    GetPage(
      name: _Paths.MHDASH,
      page: () => const MhdashView(),
      binding: MhdashBinding(),
    ),
    GetPage(
      name: _Paths.MESSMENU,
      page: () => const MessmenuView(),
      binding: MessmenuBinding(),
    ),
    // GetPage(
    //   name: _Paths.MENUCARD,
    //   page: () => const MenucardView(),
    //   binding: MenucardBinding(),
    // ),
    GetPage(
      name: _Paths.QRCODE,
      page: () => const QrcodeView(),
      binding: QrcodeBinding(),
    ),
    GetPage(
      name: _Paths.QRSCANNER,
      page: () => const QrscannerView(),
      binding: QrscannerBinding(),
    ),
    GetPage(
      name: _Paths.ANALYSIS,
      page: () => const AnalysisView(),
      binding: AnalysisBinding(),
    ),
    GetPage(
      name: _Paths.GUESTANALYSIS,
      page: () => const GuestanalysisView(),
      binding: GuestanalysisBinding(),
    ),
    GetPage(
      name: _Paths.HOSTELERANALYSIS,
      page: () => const HosteleranalysisView(),
      binding: HosteleranalysisBinding(),
    ),
    GetPage(
      name: _Paths.GQRCODE,
      page: () => const GqrcodeView(),
      binding: GqrcodeBinding(),
    ),
  ];
}
