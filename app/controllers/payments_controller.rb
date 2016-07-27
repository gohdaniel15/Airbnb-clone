class PaymentsController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find_by(id: params[:format])
    @payment = Payment.new
  end

  def create
    @reservation = Reservation.find(params[:payment][:reservation_id])

    result1 = Braintree::Customer.create( # Creates the customer. TO DO: put a form on the payment form to get customer's info
      :first_name => "Jen",
      :last_name => "Smith",
      :company => "Braintree",
      :email => "jen@example.com",
      :phone => "312.555.1234",
      :fax => "614.555.5678",
      :website => "www.example.com"
    )
    if result1.success?
      @customer_id = result1.customer.id
      result2 = Braintree::PaymentMethod.create( # Verifies customer's card.
        :customer_id => @customer_id,
        :payment_method_nonce => params[:payment_method_nonce],
        options: {
          verify_card: true
        }
      )
      if result2.success?
        @result = Braintree::Transaction.sale( # Creates the sale
          amount: @reservation.listing.price,
          payment_method_nonce: params[:payment_method_nonce],
          :options => {
            :submit_for_settlement => true
          }
        )
        if @result.success?
          @payment = Payment.create(user_id: current_user.id, amount: @reservation.listing.price, ref_number: @result.transaction.id, last_four: @result.transaction.credit_card_details.last_4, success: true)
          redirect_to @reservation.listing
        else
          @payment = Payment.create(user_id: current_user.id, amount: @reservation.listing.price, ref_number: @result.transaction.id, last_four: @result.transaction.credit_card_details.last_4, success: false)
          redirect_to @reservation.listing
        end
      else
        redirect_to @reservation.listing
      end
    else
      redirect_to @reservation.listing
    end

    # reserve to save the transaction details into database
  end
end
