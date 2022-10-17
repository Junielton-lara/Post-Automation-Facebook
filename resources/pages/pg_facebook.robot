*** Variables ***
&{post}
...  btn_post=xpath=//span[contains(.,'No que você está pensando?')]
...  input_comentario=xpath=//p[contains(@class,'x16tdsg8 x1mh8g0r xat24cr x11i5rnm xdj266r')]
...  btn_efetuar_post=xpath=//span[contains(.,'No que você está pensando?')]
...  btn_concluir_post=xpath=//*/text()[normalize-space(.)='Publicar']/parent::*
...  btn_mudar_conta=xpath=//*/text()[normalize-space(.)='Mudar agora']/parent::*

&{login}
...  input_email=id=email
...  input_senha=id=pass
...  btn_login=//*[@id="loginbutton"]