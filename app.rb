require 'rubygems'
require 'sinatra'
require 'haml'
require 'sanitize'

class App < Sinatra::Application
  get '/' do
    haml :index
  end

  post '/' do
    @slogan = (params[:slogan].to_s.empty? ? "wake up! life is short" : params[:slogan])
    @slogan = Sanitize.clean(@slogan)
    @title = @slogan
    haml :display, :locals => {:slogan => @slogan}
  end

end
