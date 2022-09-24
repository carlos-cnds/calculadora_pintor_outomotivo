import 'package:calculadora_pintor_automotivo/shared/local_repository/brand_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/formula_repository.dart';
import 'package:calculadora_pintor_automotivo/shared/local_repository/version_repository.dart';

class HomeRepository {
  static Future updateData() async {
    var versionServer = await VersionRepository.getVersion();
    if (versionServer != null) {
      var versionLocal = VersionRepository.getLocal();
      if (versionLocal == "" || versionServer != versionLocal) {
        await BrandRepository.getBrands();
        await FormulaRepository.getFormulas();
        VersionRepository.updateLocal(version: versionServer);
      }
    }
  }
}
