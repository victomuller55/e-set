class EmailModel {
  String from;
  String subject;
  String body;
  List<dynamic> labels;

  EmailModel({
    required this.from,
    required this.subject,
    required this.body,
    required this.labels,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      from: json['from'],
      subject: json['subject'],
      body: json['body'],
      labels: json['labels'],
    );
  }
}
