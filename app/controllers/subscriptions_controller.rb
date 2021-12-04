class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  # PATCH/PUT /subscriptions
  def update
    respond_to do |format|
      if current_user.update(subscription_params)
        format.html { redirect_to competitions_path, notice: "Thanks for subscribing." }
      else
        format.html { render competitions_path, status: :unprocessable_entity, notice: "Unable to subscribe!" }
      end
    end
  end

  private
    # TODO: a better way to handle this could be a separate table for Subscriptions
    def subscription_params
      params.require(:user).permit(:is_free)
    end
end
