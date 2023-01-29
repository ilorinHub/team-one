class CorrespondenceModel {
  DateTime date;
  String sender;
  String sendingOrganization;
  String senderAddress;
  String subject;
  String content;
  String receiver;
  String receiverAddress;
  String receivingOrganization;
  CorrespondenceModel({
    required this.date,
    required this.sender,
    required this.sendingOrganization,
    required this.senderAddress,
    required this.subject,
    required this.content,
    required this.receiver,
    required this.receiverAddress,
    required this.receivingOrganization,
  });
}
