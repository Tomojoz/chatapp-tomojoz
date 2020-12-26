class TasksController < ApplicationController
    before_action :authenticate_user!

    def show
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
    end

    def new
        @board = Board.find(params[:board_id])
        @task = @board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save!
            redirect_to board_task_path(board, @task)
        else
            render :new
        end
    end

    def edit
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
    end

    def update
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@board, @task)
        else
            render :edit
        end
    end

    def destroy
        # board = current_user.boards.find(params[:id])
        # board.destroy!
        # redirect_to root_path, notice: '削除に成功しました'
        board = Board.find(params[:board_id])
        task = board.tasks.find(params[:id])
        task.destroy!
        redirect_to board_path(board), notice: 'Successed!'
    end

    private
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :eyecatch)
    end
end