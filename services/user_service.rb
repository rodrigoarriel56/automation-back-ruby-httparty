module Users
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com/users'
    format :json
end
