def logged_in?
  User.exists?(id: session['id'])
end

def current_user
  User.find(session['id'])
end
