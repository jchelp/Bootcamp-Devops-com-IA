Anotações dia 06/11/2025

Ferramenta de withboard - https://excalidraw.com/

Comandos Docker Essenciais
1
2
3
O Docker é uma ferramenta poderosa para criar, gerenciar e executar containers. Abaixo estão alguns dos comandos mais utilizados para trabalhar com imagens, containers e recursos do Docker.

Gerenciamento de Imagens

Listar imagens locais: docker images

Baixar uma imagem do Docker Hub: docker pull <nome_da_imagem>

Remover uma imagem: docker rmi <nome_da_imagem>

Inspecionar uma imagem: docker image inspect <nome_da_imagem>

Atualizar uma imagem: docker image pull <nome_da_imagem>

Gerenciamento de Containers

Criar e executar um container: docker run --name <nome_do_container> <nome_da_imagem>

Executar um container em segundo plano: docker run -d <nome_da_imagem>

Executar um container com mapeamento de portas: docker run -p <porta_host>:<porta_container> <nome_da_imagem>

Executar um container interativo: docker run -it <nome_da_imagem> bash

Parar um container: docker stop <nome_do_container>

Reiniciar um container parado: docker start <nome_do_container>

Remover um container parado: docker rm <nome_do_container>

Inspeção e Logs

Listar containers em execução: docker ps

Listar todos os containers (incluindo parados): docker ps -a

Ver logs de um container: docker logs -f <nome_do_container>

Inspecionar um container: docker inspect <nome_do_container>

Gerenciamento de Recursos

Limitar uso de memória: docker run -it --rm -m 512M <nome_da_imagem>

Balancear uso de CPU: docker run -it --rm -c 512 <nome_da_imagem>

Ver estatísticas de uso de recursos: docker container stats

Volumes e Portas

Mapear volumes: docker run -v <diretório_host>:<diretório_container> <nome_da_imagem>

Mapear portas: docker run -p <porta_host>:<porta_container> <nome_da_imagem>

Esses comandos são fundamentais para o uso diário do Docker, permitindo criar, gerenciar e monitorar containers de forma eficiente.