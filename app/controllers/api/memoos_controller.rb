class Api::MemoosController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create # どうやらこの記述が必要
	# skip_before_filter :verify_authenticity_token, only: :create # どうやらこの記述が必要
	 def create
	 	# binding

    memo = Memoo.new(create_params)

    # エラー処理
    unless memo.save # もし、memoが保存できなかったら
      @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    end
  end


  private
  def create_params
    params.permit(:text)
  end
end
