module ApplicationHelper
  def link_for_admin
    if user_login?
      unless @current_user.admin?
        link_to "アカウント削除はこちら", user_path(@user), method: :delete, data: {confirm: "削除してよろしいですか？"}
      end
    end
  end
end
