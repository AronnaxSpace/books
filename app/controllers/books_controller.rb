# frozen_string_literal: true

# BooksController
class BooksController < ApplicationController
  helper_method :book

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if book.save
      redirect_to book_url(book), notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if book.update(book_params)
      redirect_to book_url(book), notice: 'Book was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book.destroy!

    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def book
    @book ||= Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:cover, :title, :author_id)
  end
end
