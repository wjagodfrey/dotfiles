function spell --description 'Uses aspell to check the spelling of words'
    echo $argv | aspell -a --clean
end
