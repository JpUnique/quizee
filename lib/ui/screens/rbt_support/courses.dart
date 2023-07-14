//ignore_for_file: unused_local_variable


/*import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

final List<String> pdfUrls = [
  'https://drive.google.com/uc?export=download&id=12KVGnumV7lEzzl3iKXGmRvjGsWusM3ui',
  'https://drive.google.com/uc?export=download&id=13hMIR3qkkH81eG9F6BUGboyNhJdhbMFn',
  'https://drive.google.com/uc?export=download&id=1MrVZpuozAVog7NQ4bQzbjDN_lB0GalNa',
  'https://drive.google.com/uc?export=download&id=1DkL6WOAYbExInr7YEdSezMgbjGZ9DDS0',
  'https://drive.google.com/uc?export=download&id=1vmdUDqjYyT6YWLmjupayenTZ9OEkjm20',
  'https://drive.google.com/uc?export=download&id=1TxFo-USEhujGW_L-6cSiQ6Ybeq8zmOz_',
  'https://drive.google.com/uc?export=download&id=1AkAn4fTUfyi4qreM4R2iq9fjbCcVJXnn',
];

Future<String?> uploadPDFToFirebase(String url) async {
  try {
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final String fileName = url.split('/').last;
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('pdfs/$fileName');

      final UploadTask uploadTask = storageRef.putData(response.bodyBytes);
      final TaskSnapshot uploadSnapshot = await uploadTask;

      final String downloadUrl = await storageRef.getDownloadURL();

      return downloadUrl;
    } else {
      print('Failed to fetch PDF from URL: $url');
      return null;
    }
  } catch (error) {
    print('Error uploading PDF: $error');
    return null;
  }
}

void uploadPDFsToFirebase() async {
  for (final url in pdfUrls) {
    final String? downloadUrl = await uploadPDFToFirebase(url);

    if (downloadUrl != null) {
      // Do something with the download URL
      print('PDF uploaded successfully. Download URL: $downloadUrl');
    } else {
      // Handle the upload failure
      print('Failed to upload PDF from URL: $url');
    }
  }
}*/




