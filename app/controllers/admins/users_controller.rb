class Admins::UsersController < ApplicationController


  def index
    #with_deleted 退会済み会員関係なくデータ取得
	 @users=User.page(params[:page])
  end

  def show
	 @user=User.with_deleted.find(params[:id])
  end

  def edit
  	@user=User.with_deleted.find(params[:id])
    # pp @user  メンターさんが入れて便利な機能と思われる
  end
  def update
    # edit.htmlラジオボタンにてtrue or false 選択
    # trueの場合会員復活　false=退会処理
	   user=User.with_deleted.find(params[:id])
	   if params[:user][:deleted_at] == "true"
	   user.update(user_params)
     user.restore
	   redirect_to admin_user_path(user.id)
	else
		user.update(user_params)
     user.destroy
		redirect_to admin_user_path(user.id)
  end
end
  private
  def user_params
    params.require(:user).permit(:first_name, :family_name, :family_name_kana, :family_name_kana, :email, :tel,:deleted_at)
  end
end
