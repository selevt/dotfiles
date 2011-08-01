lsof -u $(whoami) | grep Flash | awk '{sub(/[^0-9]+/, "", $4)
                                       sub(/\/tmp\//, "", $9)
                                      print "/proc/"$2"/fd/"$4, $9".flv"}' | xargs -rn 2 cp -n
