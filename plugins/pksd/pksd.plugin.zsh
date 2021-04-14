export WS="${HOME}/Workspace"
export GITHUB_ORG="parkside-securities"
export PKSD="${WS}/${GITHUB_ORG}"
export PKSD_LIVE="${PKSD}/pksd-live"
export TF_LIVE="${PKSD}/terraform-live"
export TF_MODULES="${PKSD}/terraform-modules"

alias cdw="cd ${WS}"
alias cdl="cd ${TF_LIVE}"
alias cdm="cd ${TF_MODULES}"
alias cdp="cd ${PKSD_LIVE}"

alias cm="code ${TF_MODULES}"
alias cl="code ${TF_LIVE}"
 
clone-all() {
    for repo in $(gh repo list "${GITHUB_ORG}" --no-archived --source -L 500 | cut -f1); do 
        if [[ ! -d "${WS}/${repo}" ]]; then
            gh repo clone "${repo}" "${WS}/${repo}"
        fi
    done
}

