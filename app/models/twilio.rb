require 'rubygems'
# require 'twilio-ruby'
# require_relative 'scraper.rb'
require "nokogiri"
require "open-uri"

def send_sms(number)
  @doc = Nokogiri::HTML(open("http://www.yogscast.com/browse/family/tag/lewis-simon/page/0"))
  @items = @doc.xpath("//ul[1]/li[1]/figure/figcaption/a/h2").collect {|node| node.text.strip}
  @weather = Nokogiri::HTML(open("http://www.accuweather.com/en/us/cambridge-ma/02139/weather-forecast/329319"))
  @idk = @weather.xpath("//div[3]/strong").collect {|node| node.text.strip}

#   if @weather == params[:weather] 
    def video
      @items.first
    end 
 #   else 
#     return nil
#   end
#   if @youtube == params[:youtube]
     def temp
       @idk.join(', ')
     end
#   else 
#     return nil
#   end

  
    account_sid = 'AC08bf7964c999ba6530d09fe6f0772595'
    auth_token = 'd06a7e53d00596d8af42ec90be3844c1'
  @client = Twilio::REST::Client.new account_sid, auth_token 
 
      @client.account.messages.create({
      :from => '+14803604355', 
        :to => number,
        :body => "Good morning! The high today is #{temp} and the #1 YouTube #{video}. Have a great day!",
      })
  end
  

