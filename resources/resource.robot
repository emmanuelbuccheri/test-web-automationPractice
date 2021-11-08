***Settings***
Library     Browser
Library     String

***Variables***
${URL}          http://automationpractice.com/

***Keywords***
### Setup e Teardown
Abrir Navegador
    New Browser     headless=False

Fechar Navegador
    Close Browser

### Ações
Acessar pagina home do site
    New Browser     headless=False
    New Page        ${URL}
    Get Title       equal       My Store

Clicar no botão pesquisar
    Click           css=#searchbox > button

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Fill Text      id=search_query_top    ${PRODUTO}

Passar o mouse por cima da categoria "Women"
    Hover                       xpath=//*[@id="block_top_menu"]/ul/li[1]/a
    Wait For Elements State     css=#block_top_menu > ul > li:nth-child(1) > ul

Clicar na sub categoria "Summer Dresses"
    Click           xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Get Title       equal       Summer Dresses - My Store

Clicar no botão "Add to cart" do produto
    Click                          css=#center_column > ul > li > div > div.left-block
    Wait For Elements State        xpath=//*[@id="add_to_cart"]/button/span
    Click                          xpath=//*[@id="add_to_cart"]/button/span
    Wait For Elements State        css=#layer_cart > div.clearfix > div.layer_cart_product.col-xs-12.col-md-6
    Get Text                       text="Product successfully added to your shopping cart"

Clicar no botão "Proceed to checkout"
    Wait For Elements State         css=#layer_cart > div.clearfix > div.layer_cart_product.col-xs-12.col-md-6 > h2
    Click                           xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    Get Text                        text=SHOPPING-CART SUMMARY

Clicar no ícone carrinho de compras
    Wait For Elements State         css=#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a
    Click                           css=#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a
    Get Text                        text=SHOPPING-CART SUMMARY
    Get Title                       equal       Order - My Store

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Click       xpath=//*[contains(concat(" ", normalize-space(@class), " "), " cart_quantity_delete ")]
    Get Text    text=Your shopping cart is empty.

Clicar no botão superior direito “Sign in”
    Click       text=Sign in
    Get Title   equal   Login - My Store

Inserir um e-mail válido
    [Arguments]     ${nome}     ${sobrenome}
    ${E-mail Customizado}   Crear Email Customizado     ${nome}     ${sobrenome}
    Fill Text   id=email_create     ${E-mail Customizado}

Crear Email Customizado
    [Arguments]     ${nome}     ${sobrenome}
    ${Random String}    Generate Random String
    ${E-mail}=      Set Variable  ${nome}${sobrenome}${Random String}@testerobot.com
    [Return]   ${E-mail}

Clicar no botão "Create an account"
    Click       id=SubmitCreate
    Get Text    text=CREATE AN ACCOUNT

Preencher os campos obrigatórios
#recebe os dados como argumentos
    [Arguments]         ${NOME_US}  ${SOBRENOME_US}  ${PASSWORD}  ${ENDEREÇO}  ${CIDADE}  ${ESTADO}  ${CEP}  ${COUNTRY}  ${TELEFONE}  ${ALIAS}
    Click               id=id_gender2
    Fill Text           id=customer_firstname       ${NOME_US}
    Fill Text           id=customer_lastname        ${SOBRENOME_US}
    Fill Text           id=passwd                   ${PASSWORD}
    Fill Text           id=address1                 ${ENDEREÇO}
    Fill Text           id=city                     ${CIDADE}
    Select Options by   id=id_state                 text    ${ESTADO}
    Fill Text           id=postcode                 ${CEP}
    Select Options by   id=id_country               text    ${COUNTRY}
    Fill Text           id=phone_mobile             ${TELEFONE}
    Fill Text           id=alias                    ${ALIAS}

Clicar em "Register"para finalizar o cadastro
    Click   id=submitAccount
    Wait For Elements State         css=#header > div.nav > div > div > nav > div:nth-child(1)

#### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait For Elements State         css=#center_column > h1
    Get Title                       equal       Search - My Store
    Get Text                        text=${PRODUTO}

Conferir mensagem de error: "${MENSAGEM_ALERTA}"
    Wait For Elements State         css=#center_column > p
    Get Text                        text=${MENSAGEM_ALERTA}
