require 'rubygems'
# require 'twilio-ruby'
# require_relative 'scraper.rb'
require "nokogiri"
require "open-uri"

def send_youtube(number)
  @doc = Nokogiri::HTML(open("http://www.yogscast.com/browse/family/tag/lewis-simon/page/0"))
  @items = @doc.xpath("//ul[1]/li[1]/figure/figcaption/a/h2").collect {|node| node.text.strip}

  
  
    def video
      @items.first
    end 

  
    account_sid = 'AC08bf7964c999ba6530d09fe6f0772595'
    auth_token = 'd06a7e53d00596d8af42ec90be3844c1'
  @client = Twilio::REST::Client.new account_sid, auth_token 
 
      @client.account.messages.create({
      :from => '+14803604355', 
        :to => number,
        :body => "Good morning! The YouTube video for today is https://www.youtube.com/results?search_query=#{video.gsub(/[ ]/, '') }  by Yogscast. Have a great day!",
      })
  end
  

