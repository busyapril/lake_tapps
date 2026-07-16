import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://glbcjqsetacuhmdqljaa.supabase.co'
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdsYmNqcXNldGFjdWhtZHFsamFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQxNTkwNzQsImV4cCI6MjA5OTczNTA3NH0.LdfhHe-fbEeMOxaF0MMZeiWKPMMQyiatz5Dye3zDtuI'

export const supabase = createClient(supabaseUrl, supabaseKey)
