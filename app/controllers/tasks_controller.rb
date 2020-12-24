class TasksController < ApplicationController
    before_action :authenticate_user!

    def show
        @task = Task.find(params[:id])
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(tasks_params)
        @task.user_id = current_user.id
        if @task.save!
            redirect_to board_task_path(board, @task)
        else
            render :new
        end
    end

    private
    def tasks_params
        params.require(:task).permit(:title, :description, :deadline)
    end
end