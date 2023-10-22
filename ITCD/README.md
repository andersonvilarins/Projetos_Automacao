# Execute o Selenium Chrome com Robotframework no Docker

#### Criar imagem a partir do Dockerfile
```
docker build --rm -f "Dockerfile" -t ITCD_TA:qa .
```
docker build → docker pegará todos os comandos no Dockerfile e os construirá em uma imagem do Docker.

--rm → Após a conclusão da construção da imagem, ele exclui o contêiner usado para construir a imagem.

-f → Insira o caminho do Dockerfile onde você criará a imagem.

-t → Definir o nome da imagem do Docker e o nome da tag

. → construir a partir da localização atual

#### Crie um contêiner e execute o Robotframework com o comando
```
docker run --rm -v $(pwd):/workspace:cached -w /workspace ITCD_TA:qa python3 -m robot *.robot
```
--rm → Depois de executar ou usar este contêiner, ele excluirá o contêiner.

-v → Vincular montar um volume (mapear o volume local para a janela de encaixe)

v1 = volume do caminho no local

v2 = volume do caminho na janela de encaixe

-w → Diretório para usar no Docker

gcrobot:qa → Nome e tag da imagem do Docker que iremos construir e executar.