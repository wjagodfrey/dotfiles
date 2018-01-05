function copy --description 'pbcopy without the trailing newline, and a shorter name'
    tr -d '\n' | pbcopy
end
