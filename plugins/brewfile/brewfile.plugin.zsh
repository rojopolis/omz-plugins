BREWFILE_URL=${BREWFILE_URL:-"https://gist.githubusercontent.com/rojopolis/16beb77d7d78707e481edf300eb3e3f7/raw/Brewfile"}
BREWFILE_INTERVAL=${BREWFILE_INTERVAL:-10} # Maximum number of days between running update.
DATA="${HOME}/.local/share/brewfile"

mkdir -p "${DATA}"

brewfile-update() {
    #requires cURL >= 7.68.0 
    path=('/usr/local/opt/curl/bin' $path)
    LAST_ETAG=$(cat ${DATA}/latest) 2> /dev/null
    BREWFILE_CONTENT=$(curl -sSL -o ${DATA}/Brewfile --etag-compare ${DATA}/latest --etag-save ${DATA}/latest "${BREWFILE_URL}") || return -1
	LATEST_ETAG=$(cat ${DATA}/latest)
    if [[ "$LAST_ETAG" != "$LATEST_ETAG" ]]; then
      BREWFILE_UPDATED="true"
      echo "LAST_ETAG: $LAST_ETAG"
      echo "LATEST_ETAG: $LATEST_ETAG"
    fi
    if [[ -f ${DATA}/Brewfile.lock.json ]]; then
      NOW=$(date +'%s')
      LAST_UPDATE=$(zstat ${DATA}/Brewfile.lock.json)
      ELAPSED_DAYS=$(( ($NOW - $(zstat +mtime ${DATA}/Brewfile.lock.json)) / 60 / 60 / 24))
      if [[ $ELAPSED_DAYS -ge $BREWFILE_INTERVAL ]]; then
        INTERVAL_EXPIRED="true"
      fi
    else
      INTERVAL_EXPIRED="true"
    fi
    if [[ "$INTERVAL_EXPIRED" == "true" || "$BREWFILE_UPDATED" == "true" ]]; then
      echo "Updating:"
      echo "  INTERVAL_EXPIRED: ${INTERVAL_EXPIRED:-false}"
      echo "  BREWFILE_UPDATED: ${BREWFILE_UPDATED:-false}" 

      brew bundle install --file=${DATA}/Brewfile
    fi
}

brewfile-update