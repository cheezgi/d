@ECHO ON
7z u "bin\game.zip" .\*
7z d "bin\game.zip" bin
7z d "bin\game.zip" *.geany
7z d "bin\game.zip" *.bat
cd bin
start love game.zip