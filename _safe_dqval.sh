# "_safe_dqval $value" - prepends backslash, backtick/backquote, dollar-sign, and double-quote in $value with \ and wraps the result in double-quotes for use in eval'd double-quoted strings, ex: eval "printf %s\\n $(_safe_dqval "\$(date)")"
# WARNING: Do NOT wrap the output of this function in escaped double-quotes at the call site! WRONG: eval "echo \"$(_safe_dqval "\$(date)")\""
_safe_dqval() { [ "${2-}" != QUOTE_ALWAYS ] && set "$1" 'f="%s";if(s~/[[:space:]|&;<>()$`\\"'\'']/)';
  printf %s "$1"|awk 'BEGIN{s=""}{gsub(/[\\`$"]/,"\\\\&");if(NR>1){s=s"\n"};s=s$0}END{'"${2#QUOTE_ALWAYS}"'{f="\"%s\""}printf f,s}'; }
