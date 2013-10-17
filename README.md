SRA
===

##Usando o Git:
Este repositório pode ser baixado pelo comando:

	git clone https://github.com/gbrego/SRA.git 

Atualizar a lista de branches:

	 git fetch --prune

Mudando de Branchs:
	 
	 git checkout <nome da branch>

Criando uma Branch:
         
         git checkout -b <nome da branch>

Adicionando arquivos a um commit:
         
         git add <nome do arquivo>

Adicionando todos os arquivos:
         
         git add .

Antes de commitar qualquer arquivo:
         
         git status

Commitando:
         
         git commit

Após a abrir a tela de mensagem:

        Mensagem do Commit
        Signed-off-by: Nome Completo <email@email.com>

Push do Commit para o Github:
        
        git push origin <branch>

Resetando o repositório para o estado do último commit :
        
        git reset --hard       
