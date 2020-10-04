class ApiController < ApplicationController
  def index
    cookies[:hoge] = { :value => 't', :expires => 1.days.from_now, :httponly => true }
  end
end
