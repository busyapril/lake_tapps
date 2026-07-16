# PowerShell script to update Vite config base path for the new repository name

Write-Host "=== Updating Vite Config Base Path ===" -ForegroundColor Cyan

$viteConfigContent = @"
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  base: process.env.NODE_ENV === 'production' ? '/lake_tapps/' : '/',
  server: {
    port: 3000
  }
})
"@

Set-Content -Path "frontend/vite.config.js" -Value $viteConfigContent
Write-Host "Updated frontend/vite.config.js base path to '/lake_tapps/'" -ForegroundColor Green
