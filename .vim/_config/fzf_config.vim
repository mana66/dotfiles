command! -nargs=? Fdd call fzf#run(fzf#wrap({'source': 'fdfind . ' . '<args>' . ' -H -td', 'sink': 'e', 'down': '40%'})) 
