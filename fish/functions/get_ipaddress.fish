function get_ipaddress --description 'Get the ipaddress. Currently only for wireless.'
    ipconfig getifaddr en1
end
