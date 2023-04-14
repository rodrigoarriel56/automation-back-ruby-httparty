describe 'Get contacts' do 

    before(:all) do
        @contatos = Contatos.get('')
    end

    context 'get contacts' do 
        it 'test case 1 - lista nao vazia' do
            expect(@contatos['data'].length()).to be > 0
            expect(@contatos.code).to eq(200)
        end

        it 'test case 2 - outro teste' do
            expect(@contatos['data'][0]['id']).to eq("1000")
        end
    end

end