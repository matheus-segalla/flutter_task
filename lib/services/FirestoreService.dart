import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _profilesCollection =
  FirebaseFirestore.instance.collection('profiles');

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await _profilesCollection.doc(userId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        return null; // O documento não existe
      }
    } catch (e) {
      print('Erro ao buscar dados do usuário: $e');
      return null;
    }
  }

// Outros métodos para escrever ou atualizar dados no Firestore podem ser adicionados aqui
}
