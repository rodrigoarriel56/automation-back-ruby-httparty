module Contatos
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com/contacts'
    format :json
end
