# 🚀 Como Fazer Push Sem Travar

## ⚠️ Se o `git push` Travar

Se o comando `git push` ficar travado esperando autenticação, siga estes passos:

### Solução 1: Usar Token na URL (Temporário)

```bash
cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"

# Substitua SEU_NOVO_TOKEN pelo token que você criou
git push https://SEU_NOVO_TOKEN@github.com/jchelp/Bootcamp-Devops-com-IA.git main

# IMPORTANTE: Depois remova o token da URL novamente:
git remote set-url origin https://github.com/jchelp/Bootcamp-Devops-com-IA.git
```

### Solução 2: Usar Variável de Ambiente

```bash
cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"

# Defina o token como variável de ambiente (substitua SEU_NOVO_TOKEN)
export GIT_ASKPASS=echo
export GIT_USERNAME=jchelp
export GIT_PASSWORD=SEU_NOVO_TOKEN

# Faça o push
git push -u origin main

# Limpe as variáveis depois
unset GIT_ASKPASS
unset GIT_USERNAME
unset GIT_PASSWORD
```

### Solução 3: Usar o Script push-seguro.sh

```bash
cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"
./push-seguro.sh
```

### Solução 4: Configurar SSH (Mais Seguro a Longo Prazo)

```bash
# 1. Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
# Pressione Enter para aceitar local padrão
# Digite uma senha (ou deixe vazio)

# 2. Iniciar ssh-agent
eval "$(ssh-agent -s)"

# 3. Adicionar chave
ssh-add ~/.ssh/id_ed25519

# 4. Copiar chave pública
cat ~/.ssh/id_ed25519.pub

# 5. Adicionar no GitHub:
#    Acesse: https://github.com/settings/keys
#    Clique em "New SSH key"
#    Cole o conteúdo copiado

# 6. Alterar remote para SSH
cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"
git remote set-url origin git@github.com:jchelp/Bootcamp-Devops-com-IA.git

# 7. Testar
git push -u origin main
```

## 🔍 Verificar se Está Travado

Se o comando estiver travado:

1. **Pressione `Ctrl+C`** para cancelar
2. Limpe o cache: `git credential-cache exit`
3. Tente uma das soluções acima

## ✅ Verificar se Funcionou

```bash
git log origin/main --oneline -1
git status
```

Se aparecer "Your branch is up to date with 'origin/main'", funcionou! ✅

