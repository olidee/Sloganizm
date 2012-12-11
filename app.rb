require 'rubygems'
require 'sinatra'
require 'haml'
require 'sanitize'


class App < Sinatra::Application

  def formatSlogan(string)
    @sloganArr = string.split(' ')
  end

  get '/' do
    haml :index
  end

  post '/' do
    @slogan = (params[:slogan].to_s.empty? ? "wake up! life is short" : params[:slogan])
    @slogan = Sanitize.clean(@slogan).upcase
    @title = @slogan

    @slogan = formatSlogan(@slogan)

    haml :display, :locals => {:slogan => @slogan}
  end

end
