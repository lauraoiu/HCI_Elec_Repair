import 'package:elect_repair/config/paths.dart';
import 'package:elect_repair/config/themes.dart';
import 'package:elect_repair/screens/repairman/dashbroad/widgets/request_data.dart';
import 'package:elect_repair/screens/repairman/dashbroad/widgets/top_navigation_bar.dart';
import 'package:elect_repair/widgets/bottom_navigation_bar_admin.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.isReady = false}) : super(key: key);
  final bool isReady;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late bool isReady;
  var request = RequestData.getRequest;

  @override
  void initState() {
    super.initState();
    isReady = widget.isReady;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50, child: TopNavigationBar()),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // CategogyCard(),
                  // Expanded(
                  //   flex: 1,
                  //   child: RequestContainer(),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  // ),
                  Visibility(
                    visible: !isReady,
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Xin chào ',
                              style: h4.copyWith(
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Nguyễn Văn Quýt',
                                  style: h4.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ', bạn đã sẵn \nsàng để nhận yêu cầu sửa chữa chưa?',
                                  style: h4.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                            ),
                            child: Image.asset(
                              imagePath + repairmanPNG,
                              height: size.height * 0.45,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () => setState(
                                () => isReady = !isReady,
                              ),
                              child: Container(
                                height: 40,
                                width: 270,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset.zero,
                                      blurRadius: 3,
                                    )
                                  ],
                                ),
                                child: Text(
                                  'Sẵn sàng nhận yêu cầu sửa chữa',
                                  style: h5.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isReady,
                    child: Expanded(
                      flex: 1,
                      child: FutureBuilder<Widget>(
                        future: request.call(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? snapshot.data!
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Đang tìm yêu cầu sửa chữa',
                                      style: h4.copyWith(
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: const CircularProgressIndicator(
                                        color: primaryColor,
                                        backgroundColor: primaryLightColor,
                                        strokeWidth: 6,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.red),
                                      ),
                                    ),
                                    Image.asset(
                                      imagePath + repairmanPNG,
                                      height: size.height * 0.35,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Nếu bạn đang bận hoặc chưa sẵn sàng',
                                        style: h4.copyWith(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () => Navigator.of(context)
                                            .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Dashboard(),
                                          ),
                                        ),
                                        child: Container(
                                          height: 40,
                                          width: 270,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                offset: Offset.zero,
                                                blurRadius: 3,
                                              )
                                            ],
                                          ),
                                          child: Text(
                                            'Dừng nhận yêu cầu sửa chữa',
                                            style: h5.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  const BottomNavigationAdmin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
