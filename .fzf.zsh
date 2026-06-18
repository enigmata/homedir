# Setup fzf
# ---------
_fzf_prefix="$(brew --prefix fzf 2>/dev/null)"
if [[ -n "$_fzf_prefix" ]]; then
  [[ "$PATH" != *"$_fzf_prefix/bin"* ]] && export PATH="${PATH:+${PATH}:}${_fzf_prefix}/bin"
  [[ $- == *i* ]] && source "${_fzf_prefix}/shell/completion.zsh" 2>/dev/null
  source "${_fzf_prefix}/shell/key-bindings.zsh" 2>/dev/null
fi
unset _fzf_prefix
