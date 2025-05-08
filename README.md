# 🔍 DTValidador

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported-10.3+-green.svg)](https://www.embarcadero.com/products/delphi)

Um componente para validação de documentos brasileiros (CPF e CNPJ) com suporte ao novo formato alfanumérico de CNPJ que será implementado a partir de julho de 2026.

## 📋 Índice

- [Visão Geral](#-visão-geral)
- [Recursos](#-recursos)
- [Instalação](#-instalação)
- [Como Usar](#-como-usar)
- [Exemplos](#-exemplos)
- [Novo CNPJ Alfanumérico](#-novo-cnpj-alfanumérico)
- [Auto-Detecção de Formato](#-auto-detecção-de-formato)
- [Licença](#-licença)

## 🔭 Visão Geral

**DTValidador** é um componente Delphi VCL projetado para validar documentos brasileiros, com foco especial no novo formato de CNPJ alfanumérico que será implementado no Brasil a partir de julho de 2026, conforme a Instrução Normativa 2229 de 15 de outubro de 2024.

O componente realiza a validação de dígitos verificadores e o cálculo de módulo 11 para CPF, CNPJ tradicional e o novo CNPJ alfanumérico, seguindo todas as diretrizes especificadas pela Receita Federal do Brasil.

## ✨ Recursos

- **Validação de CPF** - Formato numérico com 11 dígitos
- **Validação de CNPJ** - Formato numérico atual com 14 dígitos
- **Validação de CNPJ Alfanumérico** - Novo formato com 12 caracteres alfanuméricos + 2 dígitos verificadores
- **Auto-detecção de tipo de CNPJ** - Identifica automaticamente se o CNPJ é numérico ou alfanumérico
- **Formatação de documentos** - Formatação com máscaras adequadas para cada tipo de documento
- **Mensagens detalhadas de erro** - Feedback detalhado sobre problemas de validação
- **Eventos OnValidate** - Para responder à validação de documentos

## 💻 Instalação

### Requisitos
- Delphi 10.3 ou superior
- VCL (Visual Component Library)

### Passos para instalação

1. **Clone o repositório ou baixe os arquivos**:
   ```bash
   git clone https://github.com/seu-usuario/DTValidador.git
   ```

2. **Abra o arquivo de pacote**:
   - Navegue até o diretório onde os arquivos foram salvos
   - Abra o arquivo `DTValidadorPackage.dpk` no Delphi

3. **Compile e instale o pacote**:
   - Clique com o botão direito no projeto no Project Manager
   - Selecione `Build` para compilar o pacote
   - Selecione `Install` para instalar o componente

4. **Verifique a instalação**:
   - O componente `TDTValidador` deve aparecer na aba `DT Inovacao` na Tool Palette

## 🚀 Como Usar

Para usar o componente em seu projeto:

1. **Adicione o componente ao seu formulário**:
   - Arraste o componente `TDTValidador` da Tool Palette para seu formulário, ou
   - Crie uma instância programaticamente:
   ```delphi
   DTValidador1 := TDTValidador.Create(Self);
   ```

2. **Configure o tipo de documento**:
   ```delphi
   DTValidador1.DocumentType := dtCPF; // ou dtCNPJ, dtCNPJAlfanumerico, dtCNPJAuto
   ```

3. **Defina o documento para validação**:
   ```delphi
   DTValidador1.Document := '123.456.789-09'; // Funciona com ou sem máscara
   ```

4. **Valide o documento**:
   ```delphi
   if DTValidador1.Validate then
     ShowMessage('Documento válido!')
   else
     ShowMessage('Documento inválido: ' + DTValidador1.LastError);
   ```

5. **Para responder à validação, use o evento OnValidate**:
   ```delphi
   procedure TForm1.DTValidador1Validate(Sender: TObject);
   begin
     if DTValidador1.IsValid then
       // Documento válido
     else
       // Documento inválido
   end;
   ```

## 📝 Exemplos

### Validação de CPF

```delphi
DTValidador1.DocumentType := dtCPF;
DTValidador1.Document := '123.456.789-09';

if DTValidador1.Validate then
  ShowMessage('CPF válido!')
else
  ShowMessage('CPF inválido: ' + DTValidador1.LastError);
```

### Validação de CNPJ Tradicional

```delphi
DTValidador1.DocumentType := dtCNPJ;
DTValidador1.Document := '12.345.678/0001-95';

if DTValidador1.Validate then
  ShowMessage('CNPJ válido!')
else
  ShowMessage('CNPJ inválido: ' + DTValidador1.LastError);
```

### Validação de CNPJ Alfanumérico

```delphi
DTValidador1.DocumentType := dtCNPJAlfanumerico;
DTValidador1.Document := 'A1B2C3D45678';

if DTValidador1.Validate then
  ShowMessage('CNPJ Alfanumérico válido!')
else
  ShowMessage('CNPJ Alfanumérico inválido: ' + DTValidador1.LastError);
```

### Auto-detecção e validação de CNPJ

```delphi
DTValidador1.DocumentType := dtCNPJAuto;
DTValidador1.Document := '12ABC34501DE35'; // Pode ser numérico ou alfanumérico

if DTValidador1.Validate then
begin
  if DTValidador1.DetectedDocType = dtCNPJ then
    ShowMessage('CNPJ numérico válido!')
  else
    ShowMessage('CNPJ alfanumérico válido!');
end
else
  ShowMessage('CNPJ inválido: ' + DTValidador1.LastError);
```

### Formatação de documento

```delphi
// Formata um CPF
FormattedCPF := DTValidador1.FormatarDocumento('12345678909', dtCPF);
// Resultado: 123.456.789-09

// Formata um CNPJ
FormattedCNPJ := DTValidador1.FormatarDocumento('12345678000195', dtCNPJ);
// Resultado: 12.345.678/0001-95

// Formata um CNPJ Alfanumérico
FormattedCNPJAlfa := DTValidador1.FormatarDocumento('12ABC34501DE35', dtCNPJAlfanumerico);
// Resultado: 12.ABC.345/01DE-35
```

## 🆕 Novo CNPJ Alfanumérico

A partir de julho de 2026, a Receita Federal do Brasil implementará um novo formato de CNPJ com caracteres alfanuméricos, conforme estabelecido pela Instrução Normativa 2229 de 15 de outubro de 2024.

### Características do novo formato:

- **Formato**: 14 caracteres no total
- **Raiz**: 8 posições alfanuméricas
- **Estabelecimento**: 4 posições alfanuméricas
- **Dígitos Verificadores**: 2 posições numéricas
- **Caracteres proibidos**: I, O, U, Q, F
- **Máscara**: XX.XXX.XXX/XXXX-XX (exemplo: A1.B2C.3D4/5E6F-78)

### Cálculo de dígitos verificadores:

O cálculo dos dígitos verificadores para o CNPJ alfanumérico segue usando o módulo 11, com a conversão de letras para valores numéricos pela tabela ASCII adaptada:
- A = 17, B = 18, C = 19, etc.

## 🔄 Auto-Detecção de Formato

Um dos principais diferenciais do **DTValidador** é sua capacidade de detectar automaticamente o formato de CNPJ:

```delphi
// Configure para auto-detecção
DTValidador1.DocumentType := dtCNPJAuto;

// Valide qualquer formato de CNPJ
DTValidador1.Document := '12.345.678/0001-95'; // Formato numérico
DTValidador1.Validate();
// ou
DTValidador1.Document := '12ABC34501DE35'; // Formato alfanumérico
DTValidador1.Validate();

// Verifique qual formato foi detectado
case DTValidador1.DetectedDocType of
  dtCNPJ: 
    ShowMessage('Detectado formato numérico tradicional');
  dtCNPJAlfanumerico:
    ShowMessage('Detectado novo formato alfanumérico');
end;
```

Esta funcionalidade é especialmente útil durante o período de transição, quando ambos os formatos estarão em circulação.

## 📄 Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

link do Grupo: https://chat.whatsapp.com/DWuCUTRdWbND4biPWUyChH
---

Desenvolvido por [DT Componentes] | © 2025 | Contribuições são bem-vindas!
