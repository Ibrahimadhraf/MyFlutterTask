import 'package:http/src/client.dart';
import 'package:task/helpers/constants.dart';
import 'package:task/models/organization_model.dart';
import 'package:task/network/api_client.dart';

class OrganizationService implements OrganizationsRepo{
  String token='';
  @override
  Future<List<OrganizationsModel>> getAllOrganizations(context, Client client) async{

    return await getCallService(Constants(context).organizationModelUrl, RequestType.GETORGANIZATION);
  }
}