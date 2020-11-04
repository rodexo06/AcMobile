import 'package:AcPoliticos/src/database/select.dart';
import 'package:AcPoliticos/src/models/legislatura.dart';

class FiltroController {
  var select = Select();
  Future<List<Legislatura>> loadLegis() async {
    return await select.getAllLegislaturas();
  }
}
