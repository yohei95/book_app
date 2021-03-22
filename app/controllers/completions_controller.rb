class CompletionsController < ApplicationController

  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    completion = current_user.completions.build(post_id: params[:post_id])
    completion.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    completion = Completion.find_by(post_id: params[:post_id], user_id: current_user.id)
    completion.destroy
    redirect_to post_path(params[:post_id])
  end
end
