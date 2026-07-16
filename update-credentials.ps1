# PowerShell script to update Supabase credentials in the codebase

$supabaseUrl = "https://glbcjqsetacuhmdqljaa.supabase.co"
$supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdsYmNqcXNldGFjdWhtZHFsamFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQxNTkwNzQsImV4cCI6MjA5OTczNTA3NH0.LdfhHe-fbEeMOxaF0MMZeiWKPMMQyiatz5Dye3zDtuI"

Write-Host "=== Updating Supabase Credentials ===" -ForegroundColor Cyan

# 1. Update frontend/.env
$envContent = @"
# New Supabase Configuration
VITE_SUPABASE_URL=$supabaseUrl
VITE_SUPABASE_ANON_KEY=$supabaseKey
"@

Set-Content -Path "frontend/.env" -Value $envContent
Write-Host "Updated frontend/.env" -ForegroundColor Green

# 2. Update frontend/src/supabase.js
$jsContent = @"
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || '$supabaseUrl'
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY || '$supabaseKey'

export const supabase = createClient(supabaseUrl, supabaseKey)
"@

Set-Content -Path "frontend/src/supabase.js" -Value $jsContent
Write-Host "Updated frontend/src/supabase.js" -ForegroundColor Green

Write-Host "`nCredentials successfully updated!" -ForegroundColor Cyan
