describe 'Get contacts' do 

    context 'create user' do 
        before {

            @headers = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
            }
        }
        it 'test case 5 - create user' do
            
                @body = {
                    "user":{
                        "email": Faker::Internet.email,
                        "password": "1234567",
                        "password_confirmation": "1234567"
                    }
                }.to_json
            
            @new_user = Users.post('', headers: @headers, body: @body)
            expect(@new_user.code).to eq(201)
            expect(@new_user['data']['id']).not_to eq('')
            expect(@new_user['data']['id']).not_to eq(nil)
        end

        it 'test case 6 - create user with blank password' do
            
            @body = {
                "user":{
                    "email": Faker::Internet.email,
                    "password": "",
                    "password_confirmation": ""
                }
            }.to_json
        
            @new_user = Users.post('', headers: @headers, body: @body)
            expect(@new_user.code).to eq(422)
            expect(@new_user['errors']['password'][0]).to eq('não pode ficar em branco')

        end

        it 'test case 7 - create user with blank email' do
            
            @body = {
                "user":{
                    "email": "",
                    "password": "123456",
                    "password_confirmation": "123456"
                }
            }.to_json
        
            @new_user = Users.post('', headers: @headers, body: @body)
            expect(@new_user.code).to eq(422)
            expect(@new_user['errors']['email'][0]).to eq('não pode ficar em branco')
            expect(@new_user['errors']['email'][1]).to eq('não é válido')
        end

        it 'test case 8 - create user with wrong email pattern' do
            
            @body = {
                "user":{
                    "email": "teste",
                    "password": "123456",
                    "password_confirmation": "123456"
                }
            }.to_json
        
            @new_user = Users.post('', headers: @headers, body: @body)
            expect(@new_user.code).to eq(422)
            expect(@new_user['errors']['email'][0]).to eq('não é válido')
        end

    end

end