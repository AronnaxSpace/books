# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authorize_access
  before_action :set_lists, only: :show

  def index
    @pagy, @books = pagy(Book.all, items: 24)
  end

  def show 
    @reviews = Review.where(book_id: @book.id).first(3)
    @number_of_reviews = Review.where(book_id: @book.id).size
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_update_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_lists
    @lists = current_user&.lists || []
  end

  def authorize_access
    if @book.present?
      authorize @book
    else
      authorize Book
    end
  end

  def book_params
    params.require(:book).permit(:title, :original_title, :description, :author_id, :goodreads_url, :image, :year_of_publication)
  end

  def book_update_params
    return book_params if @book.user

    book_params.merge(user: current_user)
  end
end
