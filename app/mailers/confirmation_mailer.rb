class ConfirmationMailer < ApplicationMailer
     default from: 'PNEC Enterprises'
 
  def confirmation_email(token)
      @token=token
      attachments.inline['pnec.png'] = File.read('public/images/pnec.png')
    mail(to: email , subject: 'Payment Successfull')
      
  end
end
