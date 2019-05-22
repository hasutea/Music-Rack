class Admins::PaymentsController < ApplicationController

	before_action :authenticate_admin!

  layout "admin"

  def show
  end

  def update
  end

end
