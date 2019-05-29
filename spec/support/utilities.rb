def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

# ログインする
def sign_in_as(user)
  post login_path, params: { session: { email: user.email,
                                      password: user.password } }
end

# ログアウトする
def sign_out_as
  delete logout_path
end


# テストユーザーとしてログインする
def log_in_as(user)
  session[:user_id] = user.id
end


# テストユーザーとしてログインする（統合テスト）
def log_in_as_inte(user, password: 'password', remember_me: '1')
  post login_path, params: { session: { email: user.email,
                                        password: password,
                                        remember_me: remember_me } }
end

