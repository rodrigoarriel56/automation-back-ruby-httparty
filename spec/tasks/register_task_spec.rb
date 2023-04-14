describe 'Register' do 
    def login(email_field , password_field)
        @body = {
            session: {
                email: email_field,
                password: password_field
            }
        }.to_json

        @login = Login.post('/sessions', body: @body)
    end

    context 'register tasks' do
        before {login('testemarlon@gmail.com', '123456')}
        it 'with right info' do
            @header = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
                Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }

            @body = {
                task: {
                    title: 'criei tarefa',
                    description: 'descricao da tarefa',
                    deadline: '2020-06-21 15:00:00'
                }
            }.to_json

            @task = Register.post('/tasks', body: @body, headers: @header)
            
            expect(@task.code).to eq(201)
            expect(@task.parsed_response['data']['attributes']['title']).to eq 'criei tarefa'
        end

        it 'with wrong info' do
            @header = {
                'Content-Type': 'application/json',
                Accept: 'application.vnd.tasksmanager.v2',
                Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }

            @body = {
                task: {
                    title: '',
                    description: 'descricao da tarefa',
                    deadline: 'abcde'
                }
            }.to_json

            @task = Register.post('/tasks', body: @body, headers: @header)

            expect(@task.code).to eq(422)
            expect(@task.parsed_response['errors']['title'][0]).to eq 'não pode ficar em branco'
        end
    end
end