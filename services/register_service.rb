module Register
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com'
    format :json
end