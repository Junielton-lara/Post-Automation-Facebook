# Automação POST na pagina Coração de anjo no facebook

Temos aqui o projetos responsavel por efetuar POST na pagina Coração de anjo, onde é efetuado postagens com mensagens biblicas todos os dias as 08:00h.



## Qual o objetivo deste repositório?

-Efetuar POST na pagina Coração de anjo:https://www.facebook.com/szdeanjo/

-Execução via pipeline configurada em: https://dev.azure.com/

-Imagem linux publicada em https://hub.docker.com/

## 💻   Tecnologias

- Robot framework
- Python
- Linux



#    💻                            Libraries                              #

- Library  SeleniumLibrary
- Library  RequestsLibrary
- Library  String


#    🔖                            Dependencias                           #

- robotframework
- robotframework-seleniumlibrary
- robotframework-requests
- requests
- pyyaml
- pillow

## Comando base pipeline:
robot -d results -x outputxunit.xml -v AMBIENTE:face  ./cases/automation_post.robot

## Responsáveis

| -  |  -  |
| - | - |
| Junior lara |  junieltonlara01@gmail.com |
---
## Qualquer duvida estou a disposição
