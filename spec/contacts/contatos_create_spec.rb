describe 'Get contacts' do 

    context 'create contact' do 
        before {
            @headers = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
            }

            @body = {
                "name": Faker::Name.first_name,
                "last_name": Faker::Name.last_name,
                "email": Faker::Internet.email,
                "age": "30",
                "phone": "123123123",
                "address": "Rua teste",
                "state": "Minas Gerais",
                "city": "Uberlandia"
            }.to_json
        }

        it 'test case 3 - create a new contact' do
            @new_contact = Contatos.post('', body: @body, headers: @headers)

            expect(@new_contact.code).to eq(201)
            expect(@new_contact['data']['id']).not_to eq('')
            expect(@new_contact['data']['id']).not_to eq(nil)
        end

        it 'test case 4 - use a registered email' do
            @body["email"] = "bruno@gmail.com"
            @new_contact = Contatos.post('', body: @body, headers: @headers)
            expect(@new_contact.code).to eq(422)
        end
    end
end