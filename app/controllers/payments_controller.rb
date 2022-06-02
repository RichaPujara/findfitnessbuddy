class PaymentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:webhook]
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        @workout_session = WorkoutSession.find(params[:workout_session_id])
        @booking = @workout_session.bookings.create(user_id: current_user.id)
    end

    def webhook
        puts "In webhooks"
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        workout_session_id = payment.metadata.workout_session_id
        user_id = payment.metadata.user_id
        p "Workout session #{workout_session_id}"
        p "User #{user_id}"
        render plain: "Successful payment"
    end
end
