# 🔒 Guia de Segurança - Tokens e Credenciais

## ⚠️ IMPORTANTE: Token Exposto

Se você expôs um token do GitHub, **REVOQUE-O IMEDIATAMENTE**:

1. Acesse: https://github.com/settings/tokens
2. Encontre o token exposto
3. Clique em "Revoke" (Revogar)
4. Crie um novo token com as mesmas permissões

## ✅ Como Usar Tokens de Forma Segura

### Método 1: Cache em Memória (Recomendado)
O Git está configurado para usar cache em memória por 1 hora:

```bash
# Quando fizer push, digite:
# Username: seu-usuario-github
# Password: cole-seu-token-aqui
git push -u origin main
```

O token ficará em memória por 1 hora e será esquecido automaticamente.

### Método 2: Git Credential Store (Alternativa)
Se quiser salvar o token localmente (criptografado):

```bash
git config --global credential.helper store
# Na primeira vez, digite o token quando solicitado
# Ele será salvo em ~/.git-credentials
```

### Método 3: SSH (Mais Seguro)
Configure chaves SSH para não precisar de tokens:

```bash
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Adicionar ao ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub

# Adicionar em: https://github.com/settings/keys
```

Depois, altere a URL do remote:
```bash
git remote set-url origin git@github.com:jchelp/Bootcamp-Devops-com-IA.git
```

## 🚫 NUNCA Faça Isso

- ❌ Não coloque tokens na URL do remote
- ❌ Não commite arquivos com tokens
- ❌ Não compartilhe tokens em mensagens/chat
- ❌ Não use tokens em scripts públicos
- ❌ Não deixe tokens em variáveis de ambiente commitadas

## ✅ Sempre Faça Isso

- ✅ Use `.gitignore` para proteger arquivos sensíveis
- ✅ Revogue tokens expostos imediatamente
- ✅ Use tokens com permissões mínimas necessárias
- ✅ Configure expiração para tokens
- ✅ Revise regularmente tokens ativos

## 📝 Verificar se Token Está Exposto

```bash
# Verificar URL do remote (não deve ter token)
git remote -v

# Verificar histórico do Git
git log --all --full-history -p | grep -i "token\|ghp_"

# Verificar arquivos commitados
git ls-files | xargs grep -l "ghp_\|token" 2>/dev/null
```

## 🔐 Permissões Recomendadas para Tokens

Para repositórios privados:
- ✅ `repo` (todas as permissões de repositório)

Para repositórios públicos (mínimo necessário):
- ✅ `public_repo` (apenas repositórios públicos)

---

**Última atualização**: Novembro 2025

