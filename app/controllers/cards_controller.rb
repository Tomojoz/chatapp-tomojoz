class CardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @cards = Card.all
    end

    def new
        @board = Board.new
        @card = @board.cards.build
    end

    def create
        @board = Board.new
        @card = @board.cards.build(card_params)
        if @card.save
            redirect_to board_cards_path(@card), notice: '保存しました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    def edit
        @card = current_user.boards.find(params[:id])
    end

    def update
        @card = current_user.boards.find(params[:id])
        if @card.update(card_params)
            redirect_to card_board_path(@board), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    private
    def card_params

        params.require(:card).permit(:title, :description)

    end
end
