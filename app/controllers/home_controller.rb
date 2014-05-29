class HomeController < ApplicationController
  layout "external"
  skip_before_filter :authenticate
  
  def index
  end
end
