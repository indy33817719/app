class ContactMailer < ApplicationMailer
  default from: 'from@example.com'

  def contact_mail(contact)
    @contact = contact

    mail(
      subject: '問い合わせがありました',
      to: ENV['MAIL']
    )
  end
end
