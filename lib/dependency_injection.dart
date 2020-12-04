
import 'package:task/models/organization_model.dart';
import 'package:task/models/repos_model.dart';
import 'package:task/services/organizationss_service.dart';
import 'package:task/services/repos_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();
  OrganizationsRepo get  organizationsRepo{
     return new OrganizationService();
  }
   ReposRepositoty get reposRepositoty{
    return new ReposService();
   }
}
