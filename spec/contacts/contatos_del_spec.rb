describe 'Edit contacts' do 

    context 'get contacts' do 

        it 'delete' do
            #forma simples
            #HTTParty.delete('https://api-de-tarefas.herokuapp.com/contacts/1034')
     
            #usando modulo
            @req = Contatos.delete('/contacts/1000')
            puts @req
            puts @req.code
            
        end 
    end
end