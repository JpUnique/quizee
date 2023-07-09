class Documents {
  String? doc_titles;
  String? doc_url;

  String images;

  Documents(this.doc_titles, this.doc_url, this.images);

  static List<Documents> doc_list = [
    Documents(
      "Chapter A: The 7 Dimension of Applied Behavior Analysis",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABILITY-Chapter%20A%20-%20Measurement%20(RBT%20Task%20List).pdf?alt=media&token=aaf506bf-bdcd-4b48-b348-e89a8019adbe",
      "assets/images/chapterA.png",
    ),
    Documents(
      "Chapter B: Measurement",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABILITY-Chapter%20A%20-%20Measurement%20(RBT%20Task%20List).pdf?alt=media&token=aaf506bf-bdcd-4b48-b348-e89a8019adbe",
      "assets/images/measure.png",
    ),
    Documents(
      "Chapter C: Assessments",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABILITY-Chapter%20B-%20ASSESSMENT%20(RBT%20Task%20List).pdf?alt=media&token=0f449169-21a8-407d-96b0-e78f17231af1",
      "assets/images/assessment.png",
    ),
    Documents(
      "Chapter D: Skills Acquisition Part 1",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABILITY-Chapter%20C%20-%20SKILL%20ACQUISITION%20%E2%80%9CPART%20%201%E2%80%9D%20(RBT%20Task%20List).pdf?alt=media&token=ad3b2fea-54e0-4ed5-973e-aecf35a7a844",
      "assets/images/skillone.png",
    ),
    Documents(
      "Chapter E: Skills Acquisitions Part 2",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABILITY-Chapter%20C%20-%20SKILL%20ACQUISITION%20%E2%80%9CPART%20%202%E2%80%9D%20(RBT%20Task%20List).pdf?alt=media&token=e95e403d-fec4-4bf0-a64c-747830da0a97",
      "assets/images/skilltwo.png",
    ),
    Documents(
      "Chapter F: Behaviour Reduction",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2Fuc%3Fexport%3Ddownload%26id%3D1TxFo-USEhujGW_L-6cSiQ6Ybeq8zmOz_?alt=media&token=d267a5e0-085f-4a28-aea8-36245ba4bc54",
      "assets/images/behavior.png",
    ),
    Documents(
      "ABA Glossary",
      "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/pdfs%2FABA%20GLOSSARY.pdf?alt=media&token=8ede013c-eb18-4569-9d17-b949b983f51c",
      "assets/images/glossary.png",
    ),
  ];
}
