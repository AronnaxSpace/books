# frozen_string_literal: true

# AuthorsController
class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_user!

  helper_method :author

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def create
    @author = Author.new(author_params)

    if author.save
      redirect_to author_url(author), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if author.update(author_params)
      redirect_to author_url(author), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    author.destroy!

    redirect_to authors_url, notice: t('.success')
  end

  private

  def authorize_user!
    authorize(author) if params[:id].present?

    authorize(Author)
  end

  def author
    @author ||= Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:portrait, :first_name, :last_name)
  end
end
