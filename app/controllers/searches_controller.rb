class SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]
    
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])
    elsif @range == "Group"
      @groups = Group.looks(params[:search], params[:word])
    else
      @categories = Category.looks(params[:search], params[:word])
    end
    @book = Book.new
  end
  
end
