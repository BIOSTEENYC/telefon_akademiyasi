import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Telefon Akademiyasi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/home/background.jpg")
            )
          ),
          child: Column(
            children: [
              const BannerIcon(),
              Expanded(
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
                  if(MediaQuery.of(context).orientation == Orientation.portrait){
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        SizedBox(height: 8,),
                        PhoneInterface(),
                        IsOne(),
                        SizedBox(height: 8,),
                        AppManagement(),
                        IsTwo(),
                        BatterySave(),
                        SizedBox(height: 4,),
                        DataManagement(),
                        SizedBox(height: 8,),
                        Connectivity(),
                        IsThree(),
                        SizedBox(height: 8,),
                        Security(),
                        IsFour(),
                        SizedBox(height: 8,),
                        GoogleServices(),
                        SizedBox(height: 8,),
                        Multimedia(),
                        SizedBox(height: 8,),
                        Preformance(),
                        SizedBox(height: 8,),
                        SocialNetwork(),
                        SizedBox(height: 8,),
                        IsFive(),
                        SizedBox(height: 8,),
                        Games(),
                        SizedBox(height: 8,),
                        Healty(),
                        SizedBox(height: 8,),
                        Maps(),
                        SizedBox(height: 8,),
                        IsSix(),
                        SizedBox(height: 8,),
                        CloudServices(),
                        SizedBox(height: 8,),
                        Customize(),
                        SizedBox(height: 8,),
                        FixProblem(),
                        SizedBox(height: 8,),
                        IsSn(),
                        SizedBox(height: 100,)
                      ],
                    );
                  }
                  else{
                    return Row(
                      children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 3,
                        child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          SizedBox(height: 8,),
                          PhoneInterface(),
                          IsOne(),
                          SizedBox(height: 8,),
                          AppManagement(),
                          IsTwo(),
                          BatterySave(),
                          SizedBox(height: 4,),
                          DataManagement(),
                          SizedBox(height: 8,),
                          Connectivity(),
                          IsThree(),
                          SizedBox(height: 8,),
                          Security(),
                          IsFour(),
                          SizedBox(height: 8,),
                          GoogleServices(),
                          SizedBox(height: 8,),
                          Multimedia(),
                          SizedBox(height: 8,),
                          Preformance(),
                          SizedBox(height: 8,),
                          SocialNetwork(),
                          SizedBox(height: 8,),
                          IsFive(),
                          SizedBox(height: 8,),
                          Games(),
                          SizedBox(height: 8,),
                          Healty(),
                          SizedBox(height: 8,),
                          Maps(),
                          SizedBox(height: 8,),
                          IsSix(),
                          SizedBox(height: 8,),
                          CloudServices(),
                          SizedBox(height: 8,),
                          Customize(),
                          SizedBox(height: 8,),
                          FixProblem(),
                          SizedBox(height: 8,),
                          IsSn(),
                          SizedBox(height: 100,)
                        ],
                                              ),),
                      const Expanded(child: SizedBox()),
                      ],
                    );
                  }
                }
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
