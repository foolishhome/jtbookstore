class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def search
    res = Book.search do
      keywords params[:stext]
    end
    @searchresult = res.results

    respond_to do |format|
      format.html
      format.json { head :no_content }
      format.js {render :layout => false}
    end
  end

  require 'resque'
  require 'thrift'
  #$:.push("../thrift")
  require 'Authentication'
  require 'myauth_constants'


  def cox
    puts 'xxxxxxxxxxxxxxxxx'
  end

  def sendmail
    @uid = params[:id]

    # Do anything here, like access models, etc

    begin
      transport = Thrift::BufferedTransport.new(Thrift::HTTPClientTransport.new('http://127.0.0.1:4000/ccb'))
      protocol = Thrift::BinaryProtocol.new(transport)
      client = MyAuth::Authentication::Client.new(protocol)
      transport.open

      user = MyAuth::User.new
      user.username = 'james'
      user.password = 'fuckyou'

      puts "Login: #{client.login(user)}"
    rescue => e
      logger.error "shirft error: #{e.message}"
      puts "shirft error: #{e.message}"
    end

    Resque.enqueue MailWorker

    redirect_to :root
  end

end

