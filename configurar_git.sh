#!/bin/bash

# === CONFIGURACIÓN DEL SCRIPT ===
# Cambia esta URL por la del repositorio de GitHub que vas a usar
NUEVA_URL_REPO="https://github.com/vhlb72/correspondencia.git"

# === COMANDOS ===

echo "🧹 Limpiando configuración remota anterior (si existe)..."
git remote remove origin 2>/dev/null

echo "🔗 Estableciendo nueva URL remota..."
git remote add origin "$NUEVA_URL_REPO"

echo "📦 Verificando si hay commits..."
if [ -z "$(git log --oneline)" ]; then
    echo "📁 No hay commits. Inicializando commit inicial..."
    git add .
    git commit -m "Commit inicial del proyecto"
fi

echo "🚀 Subiendo al repositorio remoto..."
git push -u origin main 2>/dev/null || git push -u origin master

echo "✅ Listo. Repositorio remoto configurado en: $NUEVA_URL_REPO"
