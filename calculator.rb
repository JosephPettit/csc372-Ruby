# Class used to preform basic finance calculations, monthly payment and amortization break down
class Calculator

   def self.monthly_payment(loan)
     (loan.amount * (loan.interest / 1200)) / (1 - (1 + (loan.interest / 1200))**-loan.term)
   end

   def self.amortization_table(loan)
     payment = loan.payment
     principal = loan.amount
     term = loan.term
     interest = loan.interest / 1200.0

     term.times do
       start_principal = principal
       interest_payment = interest * principal
       principal_payment = payment - interest_payment
       principal -= principal_payment

       puts "beg bal = #{start_principal.round(2)} pay = #{payment.round(2)} int = #{interest_payment.round(2)} princ = #{principal_payment.round(2)} end = #{principal.round(2)}"
     end
   end
end
