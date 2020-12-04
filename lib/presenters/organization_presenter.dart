import 'package:flutter/cupertino.dart';
import 'package:task/dependency_injection.dart';
import 'package:task/models/organization_model.dart';
import 'package:http/http.dart' as http;
abstract class OrganizationsContract {
  void onLoadOrganizationsComplete(List<OrganizationsModel> c);
  void onLoadOrganizationsFailed(onError);
}
class OrganizationPresenter{
  OrganizationsContract organizationsContract;
  OrganizationsRepo organizationsRepo;
  OrganizationPresenter(this.organizationsContract){
        organizationsRepo=new Injector().organizationsRepo;
  }
void loadOrganization(BuildContext context){
     organizationsRepo
     .getAllOrganizations(context,http.Client())
         .then((value) => organizationsContract.onLoadOrganizationsComplete(value))
         .catchError((onError)=>organizationsContract.onLoadOrganizationsFailed(onError));
}
}