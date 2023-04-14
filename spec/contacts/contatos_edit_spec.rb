describe 'Edit contacts', :undertest do 


    context 'get contacts' do 
        it 'complete change' do
            @body_put = {
                "name": "Pamella Milan",

                "last_name": "Pam",
     
                "email": "pamella_teste1@teste.com",
     
                "age": "29",
     
                "phone": "11979522467",
     
                "adress": "Rua Teste",
     
                "state": "Sao Paulo",
     
                "city": "Itapevi"
            }.to_json

            @req = Contatos.put('', body: @body_put)
            puts @req.code  
        end

    end

end