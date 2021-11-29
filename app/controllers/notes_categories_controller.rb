class NotesCategoriesController < ApplicationController
  before_action :set_notes_category, only: [:show, :update, :destroy]

  # GET /notes_categories
  def index
    @notes_categories = NotesCategory.all

    render json: @notes_categories
  end

  # GET /notes_categories/1
  def show
    render json: @notes_category
  end

  # POST /notes_categories
  def create
    @notes_category = NotesCategory.new(notes_category_params)

    if @notes_category.save
      render json: @notes_category, status: :created, location: @notes_category
    else
      render json: @notes_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes_categories/1
  def update
    if @notes_category.update(notes_category_params)
      render json: @notes_category
    else
      render json: @notes_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes_categories/1
  def destroy
    @notes_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes_category
      @notes_category = NotesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notes_category_params
      params.require(:notes_category).permit(:notes_id, :categories_id)
    end
end
