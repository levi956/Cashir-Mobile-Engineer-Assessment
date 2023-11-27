import 'package:cashir_assessment/app/modules/authentication/data/models/submit_kyc_model.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repository/interface/authentication_repository_interface.dart';

@lazySingleton
class SubmitKycController extends BaseController<SubmitKycModel, void> {
  SubmitKycController({
    required AuthenticationRepositoryInterface repository,
  }) : super(function: repository.simulateKycResigeration);

  void submitKyc({
    required String address,
    required String meterBill,
    required String nin,
  }) {
    SubmitKycModel model = SubmitKycModel(
      address: address,
      meterBill: meterBill,
      nin: nin,
    );
    trigger(model);
  }
}
