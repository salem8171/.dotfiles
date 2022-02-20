#!/usr/bin/bash
export SEARCH_ENGINE_QUERY='https://searx.be/search?q={}'
# BROWSER_CMD='xdg-open {}'
export BROWSER_CMD='gtk-launch chromium {}'

# Declare the list-history function to provide history for fuzzy search
# firefox
# list-history() {
#   find ~/.mozilla/firefox/ -name places.sqlite |
#     head -1 |
#     xargs -r -I {} cp {} /tmp/
#   sqlite3 /tmp/places.sqlite \
#     'SELECT DISTINCT place.url
#     FROM moz_historyvisits as hist, moz_places as place
#     WHERE hist.place_id == place.id
#     ORDER BY hist.visit_date DESC;'
# }

# chromium
list-history() {
  cp ~/.config/chromium/Default/History /tmp/
  sqlite3 /tmp/History \
    'SELECT DISTINCT url, title FROM urls ORDER BY last_visit_time DESC;'
}
