#!/bin/bash
# Script para fazer push de forma segura
# NÃO inclui o token no script - você digita quando executar

echo "=== Push Seguro ==="
echo ""
echo "Este script fará o push usando seu novo token"
echo "O token será solicitado de forma segura"
echo ""

cd "/mnt/c/Users/JoséCarlosCosta/OneDrive - jchelp.com.br/CURSOS/Devops-IA-Fabricio"

# Verificar se há mudanças para commitar
if [ -n "$(git status --porcelain)" ]; then
    echo "Há mudanças não commitadas. Deseja fazer commit? (s/n)"
    read -r resposta
    if [ "$resposta" = "s" ] || [ "$resposta" = "S" ]; then
        echo "Digite a mensagem do commit:"
        read -r mensagem
        git add .
        git commit -m "$mensagem"
    fi
fi

# Fazer push
echo ""
echo "Fazendo push..."
echo "Quando solicitado:"
echo "  Username: jchelp"
echo "  Password: [cole seu NOVO token aqui]"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push realizado com sucesso!"
else
    echo ""
    echo "❌ Erro no push. Verifique o token e tente novamente."
fi

