module MailWorker
  @queue = :mail_worker_queue

  include Rails.application.routes.url_helpers

  #require 'thrift'
  #$:.push File.expand_path("#{Rails.root}/app/thrift", __FILE__)
  #require 'Authentication'
  #require 'myauth_constants'

  def self.perform()
    # Do anything here, like access models, etc
    puts "begin email box"

    #Rails.application.routes.url_helpers.cox_book_url(cox_book)
    #routes.default_url_options = {:host => "127.0.0.1"}
    #url_for(:controller => 'book', :action => 'cox')

    puts 'end mail'

  #begin
  #  transport = Thrift::BufferedTransport.new(Thrift::HTTPClientTransport.new('http://127.0.0.1:4000/ccb'))
  #  protocol = Thrift::BinaryProtocol.new(transport)
  #  client = MyAuth::Authentication::Client.new(protocol)
  #  transport.open
  #
  #  user = MyAuth::User.new
  #  user.username = 'james'
  #  user.password = 'fuckyou'
  #  puts 'do email job'
  #  puts "Login: #{client.login(user)}"
  #  puts 'end email job'
  #rescue Exception => e
  #  logger.error "shirft error: #{e.message}"
  #  puts "shirft error: #{e.message}"
  #end


  end

end
