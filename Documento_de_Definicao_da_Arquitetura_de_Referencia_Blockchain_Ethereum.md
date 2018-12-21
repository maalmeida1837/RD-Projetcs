**Histórico de Revisões**


| **Data**    | **Versão** | **Descrição**                            | **Autor**           |
|-------------|------------|------------------------------------------|---------------------|
| 07/08/2018  | 0.1 | Criação do documento.           | Matheus Correia Ferreira |

# Objetivo do Documento de Definição de Arquitetura de Referência

Este Documento de Definição de Arquitetura de Referência do Blockchain foi elaborado com o propósito de apresentar uma linha de base arquitetural que deverá ser seguida por quaisquer objetivos de uso da tecnologia e foco na sua considerável abrangência e diferentes componentes. 

# Público-Alvo


**DIAT** 	| Divisão de Arquitetura Tecnológica - DIAT
--- 					| ---
**Descrição** 			| Responsável pela elaboração desta arquitetura de referência e de quaisquer itens do catálogo de tecnologias que estejam ligados a ela.
**Preocupações** 		| Garatir que a arquitetura de referência proposta sirva como base para a instanciação de documentos de arquitetura específicos que atenderão demandas referentes à tecnologia blockhain.
**Representante(s)** 	| Tiago Pina
| | Tel.: (21) 3616-8057 | 
| | E-mail: tiago.pina@dataprev.gov.br|

**DITF** 	| Divisão de Tecnologia e Serviços de Infraestrutura de TIC - DITF
--- 					| ---
**Descrição** 			| Responsável pela padronização das tecnologias de infraestrutura utilizadas na elaboração da arquitetura proposta.
**Preocupações** 		| Garantir que a arquitetura proposta esteja de acordo com os padrões definidos para as tecnologias utilizadas.
**Representante(s)** 	|  Bruno Maria
| | Tel.: (21) 3616-7725 |
| | E-mail: bruno.maria@dataprev.gov.br |

# Descrição Geral

Em seu nível mais básico, um blockchain nada mais é que uma estrutura de dados. Como o seu próprio nome indica, esta estrutura é formada por uma corrente (chain) de blocos (block). Ou seja, de uma maneira geral, à medida que novas transações ocorrem elas são agrupadas em um novo bloco e, então, adicionadas ao blockchain de modo que o bloco na qual elas estão contidas aponte para o bloco que era, até aquele momento, o último bloco presente na cadeia. Desta forma, ao longo do tempo esta corrente vai ficando mais extensa.

O termo blockchain, entretanto, é utilizado para referenciar bem mais do que esta lista encadeada de blocos; ele engloba um conjunto de tecnologias e protocolos que permitem que esta cadeia de blocos seja mantida em uma rede de modo que cada um dos nós que participam dela mantenha uma cópia do blockchain e que todas estas cópias apresentem o mesmo estado. É como um banco de dados distribuído, porém esta base carrega duas características que fazem com que ela seja única: todos os nós da rede têm uma cópia integral da base e transações realizadas no passado são imutáveis. Consequentemente, a alteração de um bloco que já esteja incluído na cadeia é, através de uma gama de estratégias, impedida pelos protocolos blockchain. A única ação que pode ser realizada na rede é a alteração do estado dos dados trocados através da inclusão de novas transações, que darão origem a novos blocos.

Essas particularidades da tecnologia estão intimamente ligadas com o contexto de negócio no qual ela surgiu: as criptomoedas. Como estas são trocadas através de uma rede pública (onde não há confiança entre os usuários e certamente há o interesse por parte de alguns deles em gerar registros falsos e inflar o dinheiro suas respectivas contas), os protocolos que gereciam a troca de informação entre os participantes precisavam garantir a integridade dos registros. E é por isso que o blockchain se baseia nesta lista encadeada distribuída entre todos os nós da rede, pois ela serve – dentro do contexto das criptomoedas – como um livro de registro de transações bancárias.

A inclusão de novas transações, que são assinadas digitalmente, no blockchain só pode ser feita mediante a concordância de algumas das demais partes, que verificarão o histórico do registro bancário para verificar se a quantidade de criptomoedas sendo enviadas de fato pertence ao usuário. Adicionalmente, a alteração do passado – mediante mudanças indevidas em algum bloco que já está incluído na cadeia – é extremamente trabalhosa por dois motivos centrais. Primeiramente, os links que existem entre os blocos são hashes complexos, calculados com base no conteúdo do bloco anterior, que exigem cálculos pesados; sendo assim, a tentativa de forjar uma transação passada exigiria o recálculo de muitos hashes para que a integridade da cadeia fosse mantida. Por fim, participantes que queiram forjar novas transações precisariam alterar não só a sua cópia do blockchain mas replicá-la através de toda a rede, ou pelo menos em mais da metade dos nós envolvidos nela, pois – caso contrário – transações feitas com criptomoedas geradas ilegalmente não serão validadas pelos outros nós. 

A estrutura geral de um blockchain pode ser vista na imagem a seguir, retirada do site do projeto Hyperledger Fabric [1]. Ela mostra o encadeamento dos blocos que contêm as transações.

![Blockchain](imagens/ledger.png)

Devido a estas características, a tecnologia blockchain passou a ser empregada em diversos contextos de negócio que vão além do campo das criptomoedas; mais especificamente, o blockchain é utilizado em casos onde participantes (ou organizações) trocam dados através de uma rede, e deseja-se que haja consenso entre as partes em relação às transações que são executadas assim como em relação ao estado dos dados (que no caso das criptomoedas corresponderia ao dinheiro na carteira de cada usuário). Dentre as áreas de negócio onde o blockchain foi aplicado, pode-se citar:

* Rastreamento de medicamentos desde sua fabricação até o seu consumo;
* Compartilhamento de dados de pesquisas médicas;
* Manutenção de dados do cidadão de maneira uniforme entre diversos entes do governo;
* Cadeias de produção.

Dada esta abrangência, este documento busca definir as bases da arquitetura do blockchain na Dataprev através da descrição dos componentes chave na implantação de uma rede deste tipo. A arquitetura aqui apresentada deve ser instanciada quando projetos que necessitem do uso da tecnologia venham a surgir.

# Aderência

O propósito desta seção é contextualizar as bases que culminaram nas decisões tomadas para a geração da arquitetura alvo. Aqui são discutidos os princípios arquiteturais respeitados, padrões arquiteturais instanciados e padrões tecnológicos adotados.

## Princípios Arquiteturais

O propósito desta seção é referenciar os princípios existentes, os quais foram respeitados durante o processo decisório que culminou na arquitetura alvo. Os princípios selecionados devem representar ideias consensuais. Esta seção também indica princípios que foram criados durante o trabalho arquitetural. Os princípios criados devem ser disponibilizados no catálogo de princípios da organização e referenciados aqui pela sua identificação global.

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAN03 | As decisões de gerenciamento de informações são tomadas sob a perspectiva do alinhamento de negócios para gerar o máximo benefício para a empresa como um todo. | Reúso   |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAN06 | A abordagem para a condução do negócio de TIC devem ser o de alinhamento com as melhores práticas do mercado em relação a controle, processamento e gerenciamento. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAD01 | As informações são um ativo valioso para a empresa e são gerenciadas com base nesse conceito. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAD02 | Os usuários têm acesso às informações necessárias para o desempenho de suas tarefas. Desta forma, as informações são compartilhadas entre diferentes áreas e cargos corporativos, dependendo dos níveis de segurança estabelecidos para esse conjunto particular de informações. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAD03 | As informações estão acessíveis para que os usuários realizem suas tarefas. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAD05 | As informações são protegidas de uso não autorizado e quebra de sigilo. Em adição aos aspectos usuais de segurança (integridade, disponibilidade, confidencialidade, incontestabilidade e autenticidade), este princípio inclui, mas não se limita, a proteção de informação anterior às decisões, sensíveis, proprietárias e sensíveis à seleção da fonte. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAA02 | A tecnologia deve ser transparente para os usuários de modo a permitir que estes se concentrem em seu trabalho sem outras preocupações. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAA04 | Sistemas de TI são concebidos para gerar mudança e refletem alterações nas leis, necessidades sociais ou outros tipos de mudanças. A adaptabilidade e flexibilidade reduzem a complexidade e promovem a integração, o que melhora as atividades de negócios de uma empresa. Customização excessiva aumenta os custos e reduz a capacidade de adaptação. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAA08 | As regras de negócios e funcionalidade de um sistema são consistentes com a missão do sistema. Há uma aderência completa ao domínio funcional em que o sistema está localizado. | Reúso |

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PAI03 | Software e hardware devem seguir padrões estabelecidos que promovam a interoperabilidade entre dados, aplicativos e tecnologia. | Reúso |

## Padrões Arquiteturais

O propósito desta seção é referenciar os padrões arquiteturais instanciados na solução adotada. Esta seção também indica padrões que foram criados durante o trabalho arquitetural.

|    **ID**          |  **Rótulo Descritivo**    | **Situação** |
|--------------------|---------------------------|--------------|
| PA01 | Padrão Arquitetural Blockchain | Novo   |
| PA02 | Padrão Arquitetural Ethereum | Novo |

## Padrões Tecnológicos

O padrão tecnológico que serviu de base para o desenvolvimento desta arquitetura de referência é o "Padrão de Tecnologia de Infraestrutura de TIC (PTI) - Blockchain Ethereum" [2].

# Definição

O propósito desta seção é apresentar as definições associadas à arquitetura de referência.

## Propósito

O propósito desta arquitetura de referência é prover uma base genérica que especifique os principais componentes envolvidos na implantação de uma rede blockchain. Sendo assim, as seções aqui detalhadas devem ser instanciadas à medida que projetos que utilizem a tecnologia surjam.

Em geral, o uso do blockchain deve se considerado quando a necessidade de negócio tenha as seguintes características [3]:

* Há a necessidade de um banco de dados compartilhado;
* Há diversas partes (organizações) envolvidas na manutenção desta base;
* O processo de decisão destas partes sobre os dados trocados é transparente;
* Há regras uniformes regendo a comunicação entre os participantes da rede;
* Deseja-se manter um histórico de todas as transações que ocorreram na rede e na base de dados;
* Não há uma autoridade central que controla os dados;
* Velocidade na execução de transações não é uma prioridade;
* Volume de transações não é alto (menor do que 10.000 por segundo).

Por fim, historicamente redes blockchain têm sido aplicadas em contextos que podem ser agrupados em três categorias distintas, que são listadas a seguir. É importante notar que a arquitetura de referência aqui apresentada só atende ao terceiro cenário: o de um blockchain Blockchain B2B.

* Blockchain C2C (Consumer to Comsumer) - Modelo de comércio entre consumidores, de um para um, e foi o primeiro modelo aplicado ao Blockchain. O caso de uso mais famoso é o Bitcoin, que iniciou o conceito de economias virtuais. É o conceito de redes públicas: participantes anônimos transacionando um ativo relacionado a um valor.

* Blockchain B2C (Business to Comsumer) - Modelo transaciona bens de um participante (fonte) para muitos destinatários. Este modelo pode se conectar a aplicações consumidas por usuários ou empresas conectadas ao fornecedor. Neste caso, o blockchain poderá ser parte de uma aplicação mobile, um componente dentro de uma aplicação cliente-servidor ou até registrando transações provenientes de um browser. Graças a capacidade de conectividade que as APIs oferecem, as opções de implementação tecnológica são infinitas.

* Blockchain B2B (Business to Business) - Este modelo também é conhecido como permissionado. Numa rede de comércio privada (ou permissionada), os participantes (empresas, sistemas, objetos, áreas, processos ou até pessoas) se conhecem. Este conceito se refere a que o participante é registrado dentro da rede que certifica, identifica, garante a privacidade e a auditabilidade do membro.

## Benefícios

A IBM cita cinco grandes benefícios alavancados pelo uso do blockchain [4]:

* Transparência – Uma vez que o livro de registro de transações é distribuído, sendo ele mantido por todos os nós da rede, há transparência entre os participantes da rede no que se refere às operações realizadas sobre os dados.

* Segurança – Numa rede blockchain, diversos mecanismos de segurança zelam pela integridade da mesma. Transações só são adicionadas ao blockchain depois de validadas por determinados nó; quando esta adição ocorre, a transação é encriptada antes de ser armazenada; por fim, o armazenamento dos dados e transações se dá em todos os nós, o que faz com que seja mais difícil que hackers forjem transações ou alterem o passado.

* Rastreabilidade – A manutenção de todo o histórico de transações da rede faz com que seja possível mapear o histórico completo de todos os dados trocados.

* Eficiência e Velocidade – Processos que envolvem documentos físicos e contratos estipulados em papel são difíceis de validar e suscetíveis a falhas humanas. Se o processo e o contrato forem estipulados digitalmente, de uma maneira que todos os entes envolvidos nele possam validá-lo rapidamente, ganha-se eficiência e velocidade na troca de informações.

* Custos Reduzidos – O uso do blockchain elimina intermediários em negociações, pois todos os detalhes que governam a troca de ativos e informações são estipulados na parte lógica da rede: o contrato inteligente. Tendo em vista que este precisa ser instalado por todos os participantes, e que a troca de informações não ocorre caso este não seja igual em todos os pontos da rede, os custos com esta intermediação são reduzidos.

## Limitações

* Blockchain C2C e Blockchain B2C - Uma vez que o roadmap imediato da empresa indica que suas redes blockchain serão do tipo Blockchain B2B, esta arquitetura foi criada com base em uma tecnologia blockchain desenvolvida com este cenário em mente. Em consequência, este documento não contempla redes do tipo Blockchain C2C e Blockchain B2C, pois ajustes são necessários para atender a estes casos.

## Arquitetura de Referência

A arquitetura blockchain implementada será baseada no projeto Ethereum [5]. Segundo a definição encontrada no próprio site oficial da plataforma, o Ethereum pode ser definido como uma plataforma decentralizada na qual contratos inteligentes podem ser executados.

Contratos inteligentes - termo este mencionado com frequência junto à tecnologia blockchain - é uma representação digital de um contrato físico. Ou seja, uma vez que o objetivo de uma rede blockchain é gerenciar, formalizar, e registrar transações, negócios, ou trocas de informação entre as partes envolvidas, o contrato inteligente nada mais é que um código no qual estas regras serão definidas. Para se comunicar através de uma rede blockchain, as partes envolvidas precisam todas ter este contrato instalado no hospedeiro que faz a comunicação com a rede. Desta forma, garante-se que quaisquer transações efetuadas respeitarão um conjunto de regras anteriormente acordado e implementado pelas partes.

Em arquiteturas tradicionais, toda aplicação precisa de seu próprio conjunto de servidores, que executarão o código em silos isolados. Assim, não só o compartilhamento de dados é dificultado, mas o comprometimento ou falha de qualquer aplicação afeta inúmeros usuários e diversas outras aplicações. Em um blockchain, qualquer parte pode configurar um nó que replicará todos os dados necessários para o seu funcionamento e para o funcionamento de aplicações que dependam do blockchain [5].

### Arquitetura de Negócio

A arquitetura de negócio mostra uma visão de alto nível de uma rede blockchain baseada na tecnologia Ethereum. Em um consórcio formado por um determinado número de organizações que desejam ou compartilhar dados ou negociar e trocar ativos, cada uma delas deve configurar um nó que - através de uma rede externa - se comunicará com os nós das demais organizações.

![Visão de Negócio](imagens/visao_negocio.png)

Nesses nós, será instalado o contrato inteligente que contém a lógica que governará as transações que ocorrerão na rede. A persistência tanto destas transações quanto dos itens e ativos com os quais elas interagem será feita ou no próprio nó ou em outro item de infraestrutura de cada organização. Isto é necessário porque o funcionamento e a segurança de um blockchain são baseados no armazenamento dos dados completos por todas as partes.

#### Modelo de Negócio

Dentro deste contexto de negócio, a Dataprev oferecerá quatro tipos de contratos para aqueles que queiram fazer parte da rede blockchain estabelecida. Para cada nível de contrato, será necessário uma infraestrutura local diferente, que atenderá às capacidades acordadas entre a Dataprev e seus clientes. Estas infraestruturas serão mais detalhadas na seção de arquitetura tecnológica. 

Os contratos oferecidos serão:

1) Fundador da Blockchain Privada

* Recebe um nó com capacidade de processar e armazenar as transações;

* Pode acessar o portal de estatisticas da rede e de administração dos usuários e organizações.


2) Associado Blockchain Básico

* Recebe autorização de conectar um nó na rede privada.

            

3) Associado Blockchain Premium

* Recebe um nó conectado à rede privada suportado e operado pela Dataprev;
        
* Tem acesso a sua chave privada para realizar transações diretamente no nó;

* Pode acessar o portal de administração de sua chave.


4) Associado Blockchain Platinum

* Recebe um nó conectado à rede privada suportado e operado pela Dataprev;

* Pode acessar o portal de administração de sua chave e de administração dos usuários e organizações;

* Pode acessar o portal que permite realizar transações através de usuario e senha;

* Sua chave fica sob guarda da Dataprev;

* Tem acesso a APIs para realizar transações.

### Arquitetura Tecnológica

A imagem a seguir mostra, com detalhes, a infraestrutura básica sugerida para cada uma das organizações envolvidas na rede blockchain.

![Visão Tecnológica](imagens/visao_infraestrutura_basica.png)

Assim como apresentado na visão de negócio, nota-se a presença de um nó no qual um contrato inteligente está instalado. Em adição a estes dois itens, há outro componente essencial: o Geth. Ele aparece como a parte mais importante da arquitetura, pois ele é a implementação - em linguagem Go - do protocolo Ethereum propriamente dito. Ao ser instalado em um nó, ele funciona como uma interface de linha de comando. Através do Geth, é possível - dentre outras funcionalidades - criar e instalar contratos inteligentes; invocar transações e, consequentemente, enviá-las para outros nós da rede; assim como explorar o histórico de blocos gerados.

Desta forma, o Geth, assim como o nó de comunicação e o contrato inteligente, é essencial, porque é através dele que as funcionalidades chave de uma rede Ethereum são executadas e é ele o responsável por manter a estrutura de dados do blockchain.

Complementando a arquitetura vista na figura anterior, que traz o delineamento dos elementos chave que todas as partes interessadas em participar do blockchain devem instalar, a figura a seguir expande esta visão básica para um escopo mais completo. A arquitetura observada nela adiciona componentes opcionais que são, todavia, importantes de acordo com o intuito que a organização tem ao entrar na rede blockchain.

![Visão Tecnológica](imagens/visao_infraestrutura_detalhada_v3.png)

Nela, a arquitetura tecnológica apresenta um backend REST e um servidor de banco de dados no qual o SGBD Postgres encontra-se instalado. O objetivo do backend é evitar que usuários do blockchain (que podem ser administradores, agentes humanos, ou aplicações) tenham acesso direto ao nó no qual o Geth e o contrato inteligente estão instalados, já que recomenda-se que estes estejam em uma camada mais interna da rede que seja protegida contra acessos externos. Desta forma, qualquer tipo de comunicação com a rede Ethereum somente poderá ser realizada através de chamadas feitas aos métodos expostos por este backend que, localizado em outro host, estará disponível para ser chamado de fora da organização.

Além de intermediar a comunicação de aplicações e outros tipos de usuários com o contrato inteligente e a rede Ethereum, também é função do backend persistir os dados do blockchain em um servidor de banco de dados. Esta necessidade advém do fato de que espera-se que, no âmbito governamental no qual a Dataprev está inserida, a tecnologia blockchain seja usada para o compartilhamento de dados entre diferentes órgãos do governo. Assim sendo, é importante que estes sejam armazenados em um SGBD - cuja tecnologia sugerida é Postgres - para que eles estejam disponíveis para uso dentro da empresa. Este processo de gravação de novos dados na base Postgres deve ser ativado mediante a ocorrência de eventos na rede Ethereum; por isto, é necessário que o backend consulte os eventos do Geth.

Outros componentes adicionais que podem ser observados nesta visão expandida da arquitetura tecnológica são o host de chaves e a existência de dois nós, cada qual com o seu respectivo Geth. O host de chaves é responsável por armazenar as chaves privadas e públicas que identificarão os nós no momento em que estes se comunicam com a rede; tendo em vista que a violação da confidencialidade destas chaves permitirá que a rede seja invadida (e que leituras e gravações indevidas sejam executadas), é imperativo garantir a segurança das mesmas. A maneira de alcançar este objetivo será detalhada na seção de arquitetura de segurança.

Os dois Geths, por sua vez, são necessários devido às diferentes configurações que serão aplicadas a cada um dos nós nas organizações que optarem por implantar ambos. Como mostrado na primeira figura apresentada nesta seção, organizações que desejam participar da rede blockchain precisam ter, obrigatoriamente, um nó de comunicação com o contrato inteligente e o Geth instalados. Entretanto, para organizações que desejam, além de se comunicar com a rede, executar a mineração de novos blocos e fazer a adição destes ao blockchain, dois nós serão requeridos.

A diferença entre ambos é que enquanto o nó de comunicação interage com o backend, o nó de mineração não, dando - assim - mais isolamento a ele. Além disto, também para efeitos de segurança, este nó terá a sua porta RPC fechada, impedindo assim quaisquer tipos de chamadas remotas.

Em relação à tecnologia aplicada na construção do backend, recomenda-se a utilização de Node. Isto se deve ao fato de que a comunicação com o Ethereum é feita através de web3, uma API Javascript que implementa o protocolo JSON RPC, e o Node facilita esta integração. É importante também notar que o backend pode ser escalado através da criação de mais nós, permitindo assim que o acesso a ele seja balanceado.

Nas quatro seções a seguir, serão mostradas quatro visões de infraestrutura. Cada uma delas está relacionada a um tipo de contrato assinado entre a organização interessada em participar do blockchain e a Dataprev.

Estes contratos, assim como as funcionalidades contempladas em cada um deles, foram detalhados na seção do documento que trata da arquitetura de negócio; mais especificamente, no item que aborda o modelo de negócio que a Dataprev adotará para a tecnologia. Entretanto, para efeitos de clareza e leitura, estas funcionalidades são novamente descritas aqui, sendo sempre seguidas dos diagramas de arquitetura que as representam.


###### Características dos Servidores
#### Os Servidores abaixo serão disponibilizado somente IAAS, pois o blockchain Ethereum não possui padronização.

**<i>Mineração</i>** - Um (1) servidor IaaS RHEL_7.x_x86_64 

Dentro do esforço atual de padronização e conformidade na camada tecnológica, foi observada a oportunidade de utilização do catálogo de ambiente padronizado pelo departamento de arquitetura.

É recomendada a utilização dos seguintes blocos e soluções de tecnologias para a infraestrutura Blockchain:

|Versão Catálogo | Categoria Item Catálogo  | Item Catálogo                     | Composição      | Profiles  |
|----------------|--------------------------|-----------------------------------|-----------------|-----------|
|  4.0          |   TECNOLOGIA             | [RHEL_7.x_x86_64_G](https://www-git.prevnet/arquitetura-corporativa/CAT/blob/CAT-v4.0/IaaS/rhel/rhel_7/RHEL_7.x_x86_64_G.md) |   -            |  -     | 



Identificação da tecnologia / ambiente                     | Descrição                             | Sistema Operacional  | vCPU  | Memória RAM   | Armazenamento Principal   | Armazenamento Adicional  | Camada  
---                                                        | ---                                   | ---                  | ---   | ---           | --- | --- | ---
Apache_2.4.x_x86_64   | Host de Chaves                           |  RHEL_7.x_x86_64_G | 4     | 8 GB          | 50 GB                     | 250 GB  | APP(Região 2)                 

##### Pontos de montagem do armazento adicional
Descrição do nó 					| Ponto de montagem | Tamanho 	| Sistema de arquivos
--- 								| --- 				| --- 		| ---
Proxy reverso 						| /u01				| 250 GB 	| ext4

**<i>Comunicação</i>** -Um (1) servidor IaaS RHEL_7.x_x86_64 



|Versão Catálogo | Categoria Item Catálogo  | Item Catálogo                     | Composição      | Profiles  |
|----------------|--------------------------|-----------------------------------|-----------------|-----------|
|  4.0          |   TECNOLOGIA             | [RHEL_7.x_x86_64_G](https://www-git.prevnet/arquitetura-corporativa/CAT/blob/CAT-v4.0/IaaS/rhel/rhel_7/RHEL_7.x_x86_64_G.md) |   -            |  -     | 



Identificação da tecnologia / ambiente                     | Descrição                             | Sistema Operacional  | vCPU  | Memória RAM   | Armazenamento Principal   | Armazenamento Adicional | Camada   
---                                                        | ---                                   | ---                  | ---   | ---           | --- | --- | ---
Apache_2.4.x_x86_64   | Host de Chaves                           |  RHEL_7.x_x86_64_G | 4     | 8 GB          | 50 GB                     | 250 GB   | APP(Região 2)                  

##### Pontos de montagem do armazento adicional
Descrição do nó 					| Ponto de montagem | Tamanho 	| Sistema de arquivos
--- 								| --- 				| --- 		| ---
Proxy reverso 						| /u01				| 250 GB 	| ext4

**<i>Futuro HSM</i>** -Um (1) servidor IaaS RHEL_7.x_x86_64 


|Versão Catálogo | Categoria Item Catálogo  | Item Catálogo                     | Composição      | Profiles  |
|----------------|--------------------------|-----------------------------------|-----------------|-----------|
|  4.0          |   TECNOLOGIA             | [RHEL_7.x_x86_64_G](https://www-git.prevnet/arquitetura-corporativa/CAT/blob/CAT-v4.0/IaaS/rhel/rhel_7/RHEL_7.x_x86_64_G.md) |   -            |  -     | 



Identificação da tecnologia / ambiente                     | Descrição                             | Sistema Operacional  | vCPU  | Memória RAM   | Armazenamento Principal   | Armazenamento Adicional | Camada   
---                                                        | ---                                   | ---                  | ---   | ---           | --- | --- | ---
Apache_2.4.x_x86_64   | Host de Chaves                           |  RHEL_7.x_x86_64_G | 4     | 8 GB          | 50 GB                     | 250 GB   | APP(Região 2)                  

##### Pontos de montagem do armazento adicional
Descrição do nó 					| Ponto de montagem | Tamanho 	| Sistema de arquivos
--- 								| --- 				| --- 		| ---
Proxy reverso 						| /u01				| 250 GB 	| ext4


**<i>Servidor de Backend</i>** -Um (1) servidor IaaS RHEL_7.x_x86_64 


|Versão Catálogo | Categoria Item Catálogo  | Item Catálogo                     | Composição      | Profiles  |
|----------------|--------------------------|-----------------------------------|-----------------|-----------|
|  4.0          |   TECNOLOGIA             | [RHEL_7.x_x86_64_G](https://www-git.prevnet/arquitetura-corporativa/CAT/blob/CAT-v4.0/IaaS/rhel/rhel_7/RHEL_7.x_x86_64_G.md) |   -            |  -     | 



Identificação da tecnologia / ambiente                     | Descrição                             | Sistema Operacional  | vCPU  | Memória RAM   | Armazenamento Principal   | Armazenamento Adicional  | Camada  
---                                                        | ---                                   | ---                  | ---   | ---           | --- | --- | ---
Apache_2.4.x_x86_64   | Host de Chaves                           |  RHEL_7.x_x86_64_G | 4     | 8 GB          | 50 GB                     | 250 GB  | APP(Região 2)                  

##### Pontos de montagem do armazento adicional
Descrição do nó 					| Ponto de montagem | Tamanho 	| Sistema de arquivos
--- 								| --- 				| --- 		| ---
Proxy reverso 						| /u01				| 250 GB 	| ext4

**<i>Servidores de Banco de Dados</i>** -Dois (2) servidores PostgreSQL_pgPool e PostgreSQL. 


|Versão Catálogo | Categoria Item Catálogo  | Item Catálogo                     | Composição      | Profiles  |
|----------------|--------------------------|-----------------------------------|-----------------|-----------|
|  4.0          |   TECNOLOGIA             | [T_PostgreSQL_9_6](https://www-git.prevnet/arquitetura-corporativa/CAT/blob/CAT-v4.0/Blocos/postgresql/postgresql_9_6/bloco_postgresql_9_6.md) |   Prata           | [Pg_Pool Admin] [Pg_Pool BD]    | 


Identificação da tecnologia / ambiente     | Sistema Operacional  | Nós | vCPU  | Memória RAM   | Armazenamento   |Camada  
 ---                                   | ---                  | ---   | --- | ---    |--- | ---     
PostgreSQL_pgPool_3.6.5     | RHEL_7.x_x86_64 | 2   | 2 | 2| 100 | APP(Região 2)  
PostgreSQL_9.6            | RHEL_7.x_x86_64  |  2   | 2   | 2| 100 | DATA(Região 3) 

#### Pontos de montagem do armazenamentoto adicional

Descrição do nó 					| Ponto de montagem | Tamanho 	| Sistema de arquivos
--- 								| --- 				| --- 		| ---
Database Server 					| /arch1 			| 40 GB 	| XFS
 				 					| /data1 			| 40 GB 	| XFS
 				 					| /pglog1 			| 20 GB 	| XFS


**Conectividade**

A tabela abaixo representa a conectividade entre os servidores da solução conforme item do CAT - Catálogo da Arquitetura Tecnológica.


Camada Origem 			| Servidor Origem								| Camada(s) Destino				| Servidor(es) Destino								| Serviço 							| Protocolo | Porta(s) 		| Gerência 			| Acesso pelo VIP
--- 					| --- 											| --- 							| --- 												| --- 								| --- 		| --- 			| --- 				| ---
 Externo 				| Switch de Conteúdo													| 		APP (RII)			|  	Nó Comunicação					|geth					| TCP 		| 30303		| Não		 		| Não
 APP (RII)				| Nó Minerador											| 		APP (RII)			| Nó Comunicação								| geth					| TCP 		| 30303		| Não		 		| Não
 APP (RII)				| Nó Comunicação													| 		APP (RII)			|  		Backend				| RPC					| TCP 		| 8085	| Não		 		| Não
 APP (RII)				| Backend													| 		APP (RII)			|  	Nó Futuro HSM					|HTTP					| TCP 		| 80		| Não		 		| Não
 APP (RII)				| Backend													| 		APP (RII)			|  PgPool					| Database					| TCP 		| 5432		| Não		 		| Não
 APP (RII)				| PgPool													| 		DATA (RI)			|  PostgreSQL					| Database				| TCP 		| 5433		| Não		 		| Não
 
**Nó Minerador dever ter a porta RPC bloqueada**

**Configurações do VIP**


Não será criado VIP.




#### Fundador da Blockchain Privada

Neste contrato a organização:

* Recebe um nó com capacidade de processar e armazenar as transações;

* Pode acessar o portal de estatisticas da rede e de administração dos usuários e organizações.

![Visão Fundador Blockchain Privada](imagens/visao_fundador_blockchain_privada.png)

#### Associado Blockchain Básico

Neste contrato a organização:

* Recebe autorização de conectar um nó na rede privada.

![Visão Associado Blockchain Básico](imagens/visao_associado_blockchain_basico_v2.png)    

#### Associado Blockchain Premium

Neste contrato a organização:

* Recebe um nó conectado à rede privada suportado e operado pela Dataprev;
        
* Tem acesso a sua chave privada para realizar transações diretamente no nó;

* Pode acessar o portal de administração de sua chave.

![Visão Associado Blockchain Premium](imagens/visao_associado_blockchain_premium_v2.png)

#### Associado Blockchain Platinum

Neste contrato a organização:

* Recebe um nó conectado à rede privada suportado e operado pela Dataprev;

* Pode acessar o portal de administração de sua chave e de administração dos usuários e organizações;

* Pode acessar o portal que permite realizar transações através de usuario e senha;

* Sua chave fica sob guarda da Dataprev;

* Tem acesso a APIs (Backend REST) para realizar transações.

![Visão Associado Blockchain Platinum](imagens/visao_associado_blockchain_platinum_v2.png)

### Arquitetura de Aplicação

A aplicação, responsável por realizar a integração dos componentes arquiteturais que fazem parte da infraestrutura ideal do blockchain, deverá ser desenvolvida em Node e a comunicação entre ela e os elementos do protocolo Ethereum deverá ser feita através da API Javascript web3. A imagem a seguir mostra a organização geral dos serviços oferecidos por este backend, que é o foco desta seção.

![Visão Aplicação](imagens/visao_aplicacao.png)

As aplicações que quiserem realizar operações no blockchain deverão interagir com uma interface REST. Esta interface proverá acesso a um serviço que irá expor métodos que permitirão a interação com os dados guardados no Ethereum, seja por meio de alterações, consultas, ou inserções.

Por sua vez, este Serviço REST irá interagir com outros serviços do backend. Em caso de consultas, ele poderá invocar a camada de acesso ao banco de dados Postgres para realizar a leitura das informações gravadas. Como descrito na seção de infraestrutura, a função desta base é replicar o estado dos dados do blockchain em uma estrutura que pode ser facilmente gerenciada e, ao mesmo tempo, ser beneficiada pelas funcionalidades do SGBD como índices, particionamento de tabelas, entre outras. Em caso de leitura ou inserção, entretanto, o Serviço REST invocará o serviço de comunicação com o blockchain. Neste contexto, este componente entrará em contato com a infraestrutura Ethereum da organização (o Geth) para que ele envie a transação para a rede e ela passe pelo processo de validação necessário para a sua gravação no blockchain.

Adicionalmente, o serviço que realiza a comunicação com o blockchain escutará os eventos lançados na rede; ou seja, as transações que foram validadas e gravadas no blockchain. O objetivo desta ação é que toda vez que um objeto for inserido ou atualizado, esta mudança seja persistida no banco de dados Postgres. Consequentemente, este serviço de comunicação não só envia transações para fora da organização mas também recebe operações realizadas pelos outros nós da rede.

O último serviço que pode ser visto na imagem é aquele que é responsável pela inicialização dos módulos, que interage tanto o serviço REST quanto aquele que faz a comunicação com o blockchain. 

É importante notar que caso estes serviços fiquem fora do ar durante determinado período de tempo, é imprescindível que eles tenham uma maneira de saber qual foi o último bloco da cadeia a ser lido e propagado na base de dados, pois - para efeitos de sincronização - será necessário identificar e persistir as transações executadas neste intervalo de indisponibilidade. Para isto, sugere-se que o banco de dados Postgres tenha uma tabela que armazene o número deste bloco.

### Arquitetura de Dados

O foco da arquitetura de dados do protocolo de blockchain Ethereum é o controle de acesso aos dados e transações que são trocados na rede.

![Visão Dados](imagens/visao_dados.png)

Para isto, o Ethereum permite que dois tipos diferentes de contratos sejam especificados. No primeiro, já discutido anteriormente, são definidos os eventos (ou transações) que serão emitidos no momento em que algum dado é inserido ou alterado por alguma das partes. Além destes, este contrato também apresentará as funções de negócio, que, através de determinada lógica, criam os eventos através do preenchimento dos atributos destes e fazem a emissão deles para sua posterior validação e persistência pelos nós da rede.

Por sua vez, o segundo tipo de contrato inteligente que pode ser especificado trata do controle de acesso a estas funções e eventos. Estes contratos definem papéis que podem ser atribuídos aos nós participantes da rede através da vinculação de um ou mais papéis ao identificador do nó ou organização. Adicionalmente, eles devem conter funções que gerenciem todo o ciclo de vida de um papel, desde a sua criação e atribuição até a sua eventual revogação. Por fim, é importante que o contrato de controle de acesso implemente funções que, ao serem invocadas pelo contrato inteligente, façam a verificação de se determinado usuário tem acesso a um atributo, dado, função, ou evento específico.

Assim, com a definição destes dois contratos e a sua devida integração, é possível dar segurança e especificar diferentes níveis de permissionamento para uma rede blockchain.

### Arquitetura de Segurança

#### Contrato de Controle de Acesso

O primeiro componente da arquitetura de segurança do blockchain Ethereum é o contrato de controle de acesso, que especifica papéis, atribui eles aos participantes, e constantemente verifica se determinada organização pode emitir uma transação. Uma descrição mais detalhada de seu funcionamento pode ser obtida na seção Arquitetura de Dados.

#### Chaves Privadas e HSM

O segundo componente desta arquitetura, por sua vez, são as chaves privadas de cada organização, que são o principal ponto sensível relacionado à segurança do blockchain Ethereum. Isto ocorre poque é através do uso destas que é possível atestar que a veracidade da identidade do órgão que está emitindo as transações. Tendo em vista esta funcionalidade, é essencial proteger as chaves privadas dos participantes para que estas não sejam comprometidas. Caso a confidencialidade de uma chave privada seja quebrada, aquele que obteve acesso a ela pode emitir transações em nome de um participante e ter acesso aos dados trocados no blockchain.

A solução recomendada para assegurar que chaves privadas sejam protegidas adequadamente é um HSM (*Hardware Security Module*). Este dispositivo físico tem entre suas capacidades o poder de gerar chaves privadas, mantê-las internamente em um ambiente inviolável, e se conectar a outros dispositivos por meio de HTTPS.

Apesar de seu uso ser indicado para a manutenção de todas as chaves privadas dos participantes da rede, ele é absolutamente obrigatório para o órgão que for o responsável pela gestão e utilização do contrato inteligente de ACL. Afinal, violações na confidencialidade da chave desta organização permitirão que a parte que a obteve altere os controles de acesso que restringem a leitura e escrita dos dados trocados na rede Ethereum.

#### Cofre de Senhas

Por fim, o terceiro componente da arquitetura de segurança é o cofre de senhas. Este tipo de ferramenta dá proteção às senhas administrativas de determinado ambiente, e - no caso do blockchain Ethereum - pode gerenciar as senhas de acesso ao HSM assim como quaisquer outras senhas críticas que façam parte do sistema. Através do cofre de senhas, após passar por uma verificação que busca comprovar se um analista pode ter acesso a uma senha, as ações tomadas por este usuário podem ser rastreadas, suportando assim o não-repúdio e aumentando a segurança da rede Ethereum.

#### Porta RPC do Nó de Mineração

A porta RPC do nó de mineração deve ser fechada para que chamadas externas a ele não sejam permitidas. É por este motivo que, na arquitetura tecnológica detalhada, quando uma organização deseja não só se comunicar com a rede mas também minerar novos blocos, dois nós com o Geth e o contrato inteligente instalados são necessários.

# Recomendações para a Área de Desenvolvimento

* Apesar do desenvolvimento de contratos inteligentes em Ethereum poder ser feito em diversas linguagens, recomenda-se o uso de Solidity devido ao conjunto de bibliotecas disponíveis.

* Recomenda-se a criação de um backend que intermediará toda a comunicação envolvendo aplicações e outros usuários com o blockchain.

* Recomenda-se que o backend seja desenvolvido em Node devido à sua compatibilidade com a API Javascript do Ethereum (web3).

# Recomendações para a Área de Operações

* A porta RPC do nó de mineração deve ser fechada para que chamadas externas a ele não sejam permitidas.

# Capacidade Técnica

Após a implementação da arquitetura de referência indicada neste documento, espera-se que demandas referentes à tecnologia blockchain e que requeiram o uso da plataforma Ethereum possam ser atendidas pela equipe de arquitetura.

# Glossário

|       **Termo**               |         **Significado**          |
|-------------------------------|----------------------------------|
| Backend | Sistema responsável pelas regras de negócio, webservices e APIs de uma aplicação. |
| Contrato Inteligente | Código que contém a lógica que governará as transações e trocas de informação realizadas na rede blockchain. |
| Geth | Implementação, em linguagem Go, do protocolo Ethereum. |
| HSM | *Hardware Security Module*. Dispositivo físico que armazena chaves privadas com total segurança. |
| JSON | Formato de troca de dados. |
| Node | Interpretador de código Javascript. |
| NPM | Node Package Manager. Faz a gestão dos pacotes do Node.js, um interpretador de código Javascript. |
| REST | Representational State Transfer. Estilo de arquitetura baseado em HTTP que define operações de escrita e leitura para persistência de dados. |
| RPC | *Remote Procedure Call*, ou chamada remota de procedimento. É uma tecnologia de comunicação que permite que um processo localizado em um nó chame um procedimento que se encontra em outra máquina, suportando assim a comunicação entre sistemas remotos e distribuídos. |
| SGBD | Sistema de gerenciamento de banco de dados. |
| Solidity | Linguagem de programação criada especialmente para o desenvolvimento de contratos inteligentes Ethereum. |
| web3 | API Javascript do Ethereum. Ela implementa o protocolo JSON RPC. |

# Referências Bibliográficas

[1] [Hyperledger Fabric](https://hyperledger-fabric.readthedocs.io/en/release-1.2/ledger/ledger.html)

[2] [Padrão de Tecnologia de Infraestrutura de TIC (PTI) - Blockchain Ethereum](http://www-planejamentotic.prevnet/arquivos/DITF_PTI_181_2018_M.pdf)

[3] [Quando usar a tecnologia blockchain?](https://medium.com/swlh/hyperledger-chapter-3-when-to-use-the-blockchain-technology-a5c414221bdf)

[4] [Benefícios do Uso de Blockchain - IBM](https://www.ibm.com/blogs/blockchain/2018/02/top-five-blockchain-benefits-transforming-your-industry/)

[5] [Site Oficial da Plataforma Ethereum](https://www.ethereum.org/)