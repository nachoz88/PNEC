class ReceiptMailer < ApplicationMailer
    default from: 'PNEC Enterprises'
 
  def receipt_email(email, total, order_id, name)
   @name=name
   @email=email
   @total=total
   @order_id=order_id
   attachments.inline['pnec.png'] = File.read('public/images/pnec.png')
    mail(to: email , subject: 'Payment Successfull')

  end
end
