class Lists::TodosController < ApplicationController

  def index
    @todo = Todo.new
  end

  def create
    @todo= Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to list_todos_path(list_id: @list.id), notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo}
      else
        format.html { render :index }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to list_todos_path(list_id: @list.id), notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo}
      else
        format.html { render :index }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to list_todos_path(list_id: @list.id), notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    before_action :set_todo, only: [ :update, :destroy  ]
    before_action :set_list
    before_action :set_todo_lists

    def set_list
      @list= List.find(params[:list_id])
    end

    def set_todo_lists
      @todos = @list.todos
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:description, :status, :status_toggle).merge(list_id: @list.id)
    end
end
