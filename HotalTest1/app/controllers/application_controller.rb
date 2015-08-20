class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   
=begin
  before_filter :configure_charsets
  def configure_charsets
    @response.name["Content-Type"] = "text/html; charset=utf-8"
    suppress(ActiveRecord::StatementInvalid) do
      ActiveRecord::Base.connection.execute 'set names utf8'
    end
  end
 
=end
  before_filter :authenticate_user!
  protect_from_forgery with: :exception
end
