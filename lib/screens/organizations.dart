import 'package:flutter/material.dart';
import 'package:task/Widgets/custom_alert_dialog.dart';
import 'package:task/helpers/sizeConfig.dart';
import 'package:task/models/organization_model.dart';
import 'package:task/presenters/organization_presenter.dart';
import 'package:task/screens/repos.dart';

class OrganizationsScreen extends StatefulWidget {
  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen>
    implements OrganizationsContract {
  CustomAlertDialog customAlert;
  OrganizationPresenter organizationPresenter;
  bool _isLoading = false;
  List<OrganizationsModel> organizations = [];
   bool isList=true;
  _OrganizationsScreenState() {
    organizationPresenter = OrganizationPresenter(this);
  }

  @override
  void initState() {

    super.initState();
    if (!_isLoading) organizationPresenter.loadOrganization(context);
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: !_isLoading
          ? Center(
              child: Center(
                  child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan),
            )))
          : SafeArea(
              child:Stack(
                children: [


                     SingleChildScrollView(child: createList(organizations)),
                  Container(
                      color:Colors.white,
                    height: SizeConfig.safeBlockVertical * 9,
                    child: Center(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                                onPressed: (){
                                  setState(() {
                                    isList=true;
                                  });
                                },
                                color: Colors.black12,
                                child:
                            Text('List',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.fontSize15,

                              )
                            )

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(onPressed: (){
                              setState(() {
                                isList=false;
                              });
                            },
                                color: Colors.black12,
                                child:
                            Text('Grid' ,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.fontSize15,

                            ),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              )),
    );
  }

  @override
  void onLoadOrganizationsComplete(List<OrganizationsModel> c) {
    setState(() {
      print("response is:${c.length}");
      organizations = c;
      _isLoading = true;
    });
  }

  @override
  void onLoadOrganizationsFailed(onError) {
    print("Error is is:$onError");
    setState(() {
      _isLoading = true;
    });
    setState(() {
      customAlert = new CustomAlertDialog(
        message: onError.message,
        success: false,
        context: context,
      );
      customAlert.showAlert();
    });
  }

  Widget createList(List<dynamic> responseList ) {
    return Wrap(
        children: responseList
            .map((i) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          width: isList?SizeConfig.blockSizeHorizontal * 100:SizeConfig.blockSizeHorizontal * 30,
          height: SizeConfig.safeBlockVertical * 5,
          child: FlatButton(
            color: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReposScreen(i.login)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    i.login,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.fontSize15,
                        color: Colors.white),
                  )),
            ),
          ),
        ))
            .toList());
  }
}
