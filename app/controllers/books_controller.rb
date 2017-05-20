class BooksController < ApplicationController
  def new
    @authors = Author.all
  end

  def create
    # This is the section that add the author
    if author_params[:existingname]
      @name = author_params[:existingname]
    else
      @name = author_params[:name]
      @author = Author.new(name: @name)
      
      if !@author.save
        flash[:errors] = @author.errors.full_messages
        return redirect_to '/books/new'
      end
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%"
      @name = @author[:id]
    end

    # this adds a book
    @book = Book.new(book_params, author: Author.find(@name))
    # @book["author_id"] = @name
    if @book.save 
      puts "book saved"

      # this adds a review
      @reviewscore = review_params[:score].to_i
      @reviewcomment = review_params[:comment]
      puts @reviewscore.class
      @review = Review.new(score: @reviewscore, comment: @reviewcomment, book: @book)
      @review[:user_id] = session[:user_id] #revisit this
      if @review.save
          return redirect_to '/'

          
      # this is if the review doesn't save
      else 
        flash[:errors] = @review.errors.full_messages
        return redirect_to '/books/new'
        #write flash erros into book.show erb
      end
    else
      puts "book did not save"
      flash[:errors] = @book.errors.full_messages
      return redirect_to '/'
    end
  end

  def show
  end

private
  def book_params
    params.require(:book).permit(:title)
  end
  def author_params
    params.require(:author).permit(:name, :existingname)
  end
  def review_params
    params.require(:review).permit(:score, :comment)
  end
end
