json.call(user, :id, :email, :firstname, :lastname, :image)
json.token user.generate_jwt
