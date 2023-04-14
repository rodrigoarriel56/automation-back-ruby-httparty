describe 'List' do 
    def login(email_field , password_field)
        @body = {
            session: {
                email: email_field,
                password: password_field
            }
        }.to_json

        @login = Login.post('/sessions', body: @body)
    end

    context 'list tasks' do
        before {login('testemarlon@gmail.com', '123456')}
        
        it 'with right info' do
            @header = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
                Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }

            @tasks = Register.get('/tasks', headers: @header)
            expect(@tasks.code).to eq(200)
            expect(@tasks['data'].length()).to be > 0
        end

        it 'without auth info' do
            @header = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
            }

            @tasks = Register.get('/tasks', headers: @header)
            expect(@tasks.code).to eq(401)
            expect(@tasks['errors']).to eq('Acesso não autorizado!')
        end
    end
end