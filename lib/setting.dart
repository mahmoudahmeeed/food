import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_profile.dart';
import 'package:flutter_application_1/language.dart';
import 'package:flutter_application_1/loginsecurity.dart';



class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        right: false,
        left: false,
        child: 
        Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 190,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [Container(
                      width: MediaQuery.of(context).size.width,
                      color:const Color.fromRGBO(214, 228, 255, 1),
                    ),
                    Positioned(
                      bottom: -45,
                      left: MediaQuery.of(context).size.width / 2.0 - 45,
                      child:const CircleAvatar(
                      radius: 45,
                        backgroundImage: AssetImage("images/profile-circle.256x256.png"),

                      ),
                    )
                    ],
                  ),
                  ),
                 const SizedBox(
                    height:45 ,
                  ),
                  const Padding(
                     padding:  EdgeInsets.symmetric(horizontal:  8.0),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("mahmoud",
                          style:  TextStyle(
                                    color: Color(0xFF111827),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),),
                       ],
                     ),
                   ),
                 const SizedBox(height: 20,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),
                          );
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                   ],),
                  const SizedBox(height: 10,),
                  const Center(
                              child: Text(
                                'No bio added yet',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                             const SizedBox(
                  height: 20,
                ),
                 Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F4F5),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'General',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SizedBox(
                  height: 350,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xffD6E4FF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              size: 20,
                              color: const Color(0xFF3366FF),
                              generalIcons[index],
                            ),
                          ),
                          title: Text(
                            generalTitles[index],
                            style: const TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            switch (index) {
                              case 0:
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile(),
                                    ),
                                  );
                                  break;
                                }
                              
                              case 1:
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SetLanguageScreen(),
                                    ),
                                  );
                                  break;
                                }
                                case 2:
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginAndSecurityScreen(),
                                    ),
                                  );
                                  break;
                                }
                            }
                          },
                          trailing: const Icon(
                            Icons.arrow_forward_outlined,
                            color: Color(0xFF111827),
                            size: 16,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      );
                    },
                    itemCount: generalTitles.length,
                  ),
                ),
              ],
            ),
           const Positioned(
              top: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                     
                ],
              ))
          ],
        )
      ),
    );
  }
  var generalIcons = [
    Icons.person,
    Icons.notifications,
    Icons.lock_outline_rounded
  ];
  var generalTitles = [
    'Edit Profile',
    'Language',
    'Login & Security'
  ];

}