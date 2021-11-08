***Settings***
Resource        ../resources/resource.robot
#Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

***Test Cases***
Caso de Teste 01: Pesquisar Produto Existente
    Acessar pagina home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar Produto Nao Existente
    Acessar pagina home do site
    Digitar o nome do produto "ItemNaoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de error: "No results were found for your search "ItemNaoExistente""

Caso de Teste 03: Listar Produtos
    Acessar pagina home do site
    Passar o mouse por cima da categoria "Women"
    Clicar na sub categoria "Summer Dresses"
    
Caso de Teste 04: Adicionar Produtos no Carrinho
    Acessar pagina home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "t-shirt" foi listado no site
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"

Caso de Teste 05: Remover Produtos
    Acessar pagina home do site
    #AGREGAR PRODUTO AO CARRINHO
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "t-shirt" foi listado no site
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"
    #REMOVER PRODUTO DO CARRINHO
    Clicar no ícone carrinho de compras
    Clicar no botão de remoção de produtos (delete) no produto do carrinho

Caso de Teste 06: Adicionar Cliente
    Set Test Variable       &{CLIENTE}  nome=Pedro  sobrenome=Smith  password=230992  endereço=3a Av AE7  cidade=Pueyrredon  estado=Florida  cep=71720  pais=United States  telefone=2235767676  alias=Endereço A
    Acessar pagina home do site
    Clicar no botão superior direito “Sign in”
    Inserir um e-mail válido    ${CLIENTE.nome}     ${CLIENTE.sobrenome}
    Clicar no botão "Create an account"
    Preencher os campos obrigatórios    ${CLIENTE.nome}  ${CLIENTE.sobrenome}  ${CLIENTE.password}  ${CLIENTE.endereço}  ${CLIENTE.cidade}  ${CLIENTE.estado}  ${CLIENTE.cep}  ${CLIENTE.pais}  ${CLIENTE.telefone}  ${CLIENTE.alias}
    Clicar em "Register"para finalizar o cadastro