import 'package:drawtism/app/features/drawpage/domain/entities/infos_email.dart';
import 'package:drawtism/app/utils/secret_key.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class EmailSender {
  String toAddress;
  List<Content> contents;
  List<Attachment> attachments;
  final String _fromAddress = "vinicius8532o@gmail.com";
  String subject = "Aplicativo Aquarela Autista";

  EmailSender({
    required this.toAddress,
    required this.attachments,
    required this.contents,
    required this.subject,
  });

  void sendEmail() {
    final mailer = Mailer(SECRET_KEY);
    final toAddress = Address(this.toAddress);
    final fromAddress = Address(_fromAddress);
    final personalization = Personalization([toAddress]);

    final email = Email(
      [personalization],
      fromAddress,
      subject,
      content: contents,
      attachments: attachments,
    );

    mailer
        .send(email)
        .then((result) => {print(result.isValue)})
        .onError((error, stackTrace) => {print(error)});
  }

  static String templateEmail(InfosEmail infos) {
    return "Informações referente as atividades feitas por:"
        " <br><br><b>${infos.username}</b><br><br>"
        "<b>Quantidade de Atividades:</b> ${infos.attempts}<br><br>"
        "<b>Primeira Atividade:</b><br><br>"
        "   Tentativas: ${infos.listAttempts[1]}<br>"
        "   Tempo: ${infos.timeDurations[1]['init']} - ${infos.timeDurations[1]['end']}<br><br>"
        "<b>Segunda Atividade:</b><br><br>"
        "   Tentativas: ${infos.listAttempts[2]}<br>"
        "   Tempo: ${infos.timeDurations[2]['init']} - ${infos.timeDurations[2]['end']}<br><br>"
        "<b>Terceira Atividade:</b><br><br>"
        "   Tentativas: ${infos.listAttempts[3]}<br>"
        "   Tempo: ${infos.timeDurations[3]['init']} - ${infos.timeDurations[3]['end']}<br>";
  }
}
