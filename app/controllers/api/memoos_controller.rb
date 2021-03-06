class Api::MemoosController < ApplicationController
  protect_from_forgery except: :create
	skip_before_action :verify_authenticity_token, :authenticate_user_from_token!, only: [:create,:show,:update] # どうやらこの記述が必要
	# skip_before_filter :verify_authenticity_token, only: :create # どうやらこの記述が必要
	 def create
	 	# binding
    memo = Memoo.new(create_params)
    # エラー処理
    unless memo.save # もし、memoが保存できなかったら
      @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
  end

  def show
  	# binding.pry
  	@memo = Memoo.all
  	render json: @memo
  end
  def update
  	# binding.pry
  	memo = Memoo.find(1)
  	memo.update(create_params)
  end
  private
  def create_params
    params.permit(:text)
  end
end