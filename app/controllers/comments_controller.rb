class CommentsController < ApplicationController
    def new
        @comment = current_user.comments.build
    end

    def create
        @comment = current_user.comments.build
        if @comment.save!
            redirect_to board_task_path(board, @task)
        else
            render :new
        end
    end
end