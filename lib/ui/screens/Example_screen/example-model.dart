class Examples {
  String? exp_title;
  String? exp_url;

  String images;

  Examples(this.exp_title, this.exp_url, this.images);

  static List<Examples> exp_list = [
    Examples(
        "ICON for BRUSH TEETH EXAMPLE.jpg",
        "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/Examples%2FICON%20for%20BRUSH%20TEETH%20EXAMPLE.jpg?alt=media&token=45707d8f-877d-43ef-94da-6d76adcd477f",
        "assets\images\Examples\ICON for BRUSH TEETH EXAMPLE.jpg"),
    Examples(
        'STEP 1',
        'https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/Examples%2FSTEP%201.jpg?alt=media&token=efc0b74f-1123-4f98-869f-37855929ebd0',
        'assets\images\Examples\STEP 1.jpg'),
    Examples(
        "STEP 2",
        "https://firebasestorage.googleapis.com/v0/b/quizee-759e9.appspot.com/o/Examples%2FSTEP%202.jpg?alt=media&token=86c1909c-5db4-47a3-9b1d-4a90f413b54c",
        'STEP 2.jpg')
  ];
}
