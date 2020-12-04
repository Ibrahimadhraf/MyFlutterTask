import 'package:flutter/material.dart';
import 'package:task/Widgets/custom_alert_dialog.dart';
import 'package:task/helpers/sizeConfig.dart';
import 'package:task/models/repos_model.dart';
import 'package:task/presenters/repos_presenter.dart';

class ReposScreen extends StatefulWidget {
  String login;

  ReposScreen(this.login);

  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> implements ReposContract {
  CustomAlertDialog customAlert;
  bool _isLoading = false;
  bool isList=true;
  List<ReposModel> repos;
  ReposPresenter presenter;
  _ReposScreenState(){
    presenter=ReposPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    if (!_isLoading) presenter.loadRepos(context, widget.login);
  }
  @override
  Widget build(BuildContext context) {
    print("Login is:${widget.login}");

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.teal,
        title: Text(widget.login),
      ),
    body:  !_isLoading
      ? Center(
      child: Center(
    child: CircularProgressIndicator(
    backgroundColor: Colors.grey,
    valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan),
    )))
        : SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(child: createList(repos)),
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
          )
        ],
      ),
    )
    );
  }

  @override
  void onLoadReposFailed(onError) {
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

  @override
  void onLoadReposSuccess(List<ReposModel> c) {
    setState(() {
      print("response is:${c.length}");
      repos = c;
      _isLoading = true;
    });
  }
  Widget createList(List<ReposModel> responseList ) {
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

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    i.name,
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
