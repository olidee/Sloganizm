require 'rubygems'
require 'sinatra'
require 'haml'
require 'sanitize'


class App < Sinatra::Application

  def formatSlogan(string)
    @sloganArr = Array.new
    if(string.length > 2)
      @sloganArr = string.scan(/\w[^.!?]+\S+/)
      @sloganArr = @sloganArr[0].split(' ') << @sloganArr[1]
    else @sloganArr[0] = string
    end
    return @sloganArr
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
