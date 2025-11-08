#!/bin/bash
# Script para fazer push sem travar
# Execute: ./push-now.sh SEU_TOKEN_AQUI

if [ -z "$1" ]; then
    echo "❌ Erro: Token não fornecido"
    echo "Uso: ./push-now.sh SEU_TOKEN_GITHUB"
    exit 1
fi

TOKEN="$1"
REPO_URL="https://${TOKEN}@github.com/jchelp/Bootcamp-Devops-com-IA.git"

cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"

echo "🚀 Fazendo push..."
git push "$REPO_URL" main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push realizado com sucesso!"
    echo "🔒 Limpando token da URL do remote..."
    git remote set-url origin https://github.com/jchelp/Bootcamp-Devops-com-IA.git
    echo "✅ URL limpa!"
    echo ""
    echo "📊 Status atual:"
    git status
else
    echo ""
    echo "❌ Erro no push. Verifique o token e tente novamente."
    exit 1
fi

