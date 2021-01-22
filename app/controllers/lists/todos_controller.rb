class Lists::TodosController < ApplicationController

  def index
    @todo = Todo.new
    @todos = @list.todos
  end

  def create
    @todo= Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to lists_path, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @todo}
      else
        @todo = List.all
        format.html { render :index }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    before_action :set_list

    def set_list
      @list= List.find(params[:list_id])
    end

    def todo_params
      params.require(:todo).permit(:description).merge(list_id: @list.id)
    end
end
