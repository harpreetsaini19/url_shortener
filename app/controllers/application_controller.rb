class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :set_base

  def set_base
    @base_url = request.protocol.to_s + request.host_with_port.to_s + "/"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end 
end
