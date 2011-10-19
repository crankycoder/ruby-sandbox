# This is a demo of the standard HTTP library in Ruby.
# Most references online seem to suggest that we avoid usint net::http
# because it basically sucks, but I just want something to work first,
# then we can wrap Apache HttpClient via JRuby anyway
#
# Specific things that apparently suck about net::http (all
# unverified)
#
# http://apocryph.org/2008/09/27/absolutely_bullshit_ruby_http_client_situation/
#
# * performance
# * chunks data @ 1k

require "net/http"
require "uri"

# Just a regular GET
def do_get
    uri = URI.parse("http://www.google.ca/")

    # Shortcut
    response = Net::HTTP.get_response(uri)
    # Will print response.body
    Net::HTTP.get_print(uri)
end


# Just do a POST
def do_post
    uri = URI.parse("http://www.google.ca/")
    response = Net::HTTP.post_form(uri, {"q" => "crankycoder"})
    Net::HTTP.get_print(uri)
end


def main
    do_post
end

main
