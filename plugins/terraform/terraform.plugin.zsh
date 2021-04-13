TF_PARALLELISM=${TF_PARALLELISM:-10}

alias tf="terraform"
alias tfa="terraform apply -parallelism=${TF_PARALLELISM}"
alias tfd="terraform destroy -parallelism=${TF_PARALLELISM}"
alias tfp="terraform plan -parallelism=${TF_PARALLELISM}"
alias tfv="terraform version"

function tf_prompt_info() {
    if which jq > /dev/null; then
      terraform version -json | jq -r '.terraform_version'
    fi
}
