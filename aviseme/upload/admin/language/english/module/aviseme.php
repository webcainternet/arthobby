<?php

// Heading
$_['heading_title'] = 'Aviso de Disponibilidade de Produto';
$_['heading_title_config'] = 'Configurações';

//Columns
$_['column_product'] = 'Produto';
$_['column_emails'] = 'Total de emails';
$_['column_action'] = 'Ações';

//entries
$_['entry_email_subject'] = 'Assunto do e-mail';
$_['entry_email_content'] = 'Conteúdo do email <span class="help">Mensagem que será enviada para aviso de disponibilidade de produto. Seguem algumas constantes importantes para usar no conteúdo da mensagem:<br><br><strong>[PRODUTO]</strong> = nome do produto<br><strong>[LINK]</strong> = nome e link do produto<br><strong>[LOJA]</strong> = nome da loja<br><br>As constantes acima com letras maiusculas e entre colchetes serão automaticamente substituídas no envio do email.</span>';
$_['entry_export_format'] = 'Formato de arquivo para exportar emails';
$_['entry_options_allow'] = 'Permitir opções <span class="help">Permitir que o visitante da loja também escolha opções dos produtos na solicitação.</span>';
$_['entry_status'] = 'Situação';

//buttons
$_['button_config'] = 'Configurações';

// Text
$_['text_notification'] = 'Notificar clientes';
$_['text_export'] = 'Exportar emails';
$_['text_format_xls'] = 'Exportar em .xls(Arquivo do Excel)';
$_['text_format_csv'] = 'Exportar em .csv';
$_['text_subject'] = 'O seu produto favorito está novamente em estoque';
$_['text_html'] = '<html><head></head><body style="font-family:Arial;font-size:13px;">
                  <p>Prezado(a) Cliente,</p>
                  <p>O seu produto favorito está novamente em estoque na nossa loja. Passe lá e aproveite!<br>Esperamos sua visita em breve!</p>
                  <b>Produto</b>: [PRODUTO]<br><b>Link do produto</b>: [LINK]</p><p>Atenciosamente,<br>Equipe [LOJA]</p></body></html>';
$_['text_success'] = 'As configurações do módulo foram concluídas.';

//errors
$_['error_email_subject'] = 'O assunto do e-mail é necessário.';
$_['error_email_content'] = 'Escreva uma mensagem com mais de 10 caracteres que será enviada por email para aviso de disponibilidade.';
?>