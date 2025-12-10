# Clean up
cd C:\demos
Remove-Item -Recurse -Force task-manager -ErrorAction SilentlyContinue

# Start fresh
mkdir task-manager
#cd task-manager
#git init

Write-Host "Demo environment reset! Ready to start Exercise 1.3" -ForegroundColor Green
Write-Host "Don't forget to delete the GitHub repository if you created one!" -ForegroundColor Red