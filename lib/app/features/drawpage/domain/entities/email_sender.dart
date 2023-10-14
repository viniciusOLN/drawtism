import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class EmailSender {
  String body;
  String subject;
  List<String> recipients;
  List<String> attachmentPaths;

  EmailSender({
    required this.body,
    required this.subject,
    required this.recipients,
    required this.attachmentPaths,
  });

  // Future<void> sendEmail({
  //   required String body,
  //   required String subject,
  //   required List<String> recipients,
  //   required List<String> attachmentPaths,
  // }) async {
  //   final Email email = Email(
  //     body: body,
  //     subject: subject,
  //     recipients: recipients,
  //     attachmentPaths: attachmentPaths,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  void sendEmail() {
    final mailer = Mailer(
      "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",
    );
    final toAddress = Address("vinicius853o@gmail.com");
    final fromAddress = Address("viniciusnascimento@aluno.uespi.br");
    final content = Content('text/plain', 'teste');
    final subject = "Teste";

    final personalization = Personalization([toAddress]);

    final email = Email(
      [personalization],
      fromAddress,
      subject,
      content: [content],
    );

    mailer.send(email).then((result) => {print(result.isValue)});
  }
}
