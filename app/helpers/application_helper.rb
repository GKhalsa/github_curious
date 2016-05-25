module ApplicationHelper

  def login_or_logout
    if current_user
      link_to "logout", logout_path, method: :delete
    else
      link_to "Login", github_login_path
    end
  end

  def login_to_page
    if current_user
      link_to "welcome", user_path(current_user)
    else
      link_to "Login", github_login_path      
    end
  end

end
