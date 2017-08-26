# Run with -E (on Mac) or -e (other OS) for extended regex
# For example:

/[[:blank:]]*call s:HL/ {

  # Hanlde group name and 1st parameter
  # Use ## placeholder as progresive cursor for easy detection
  s/call s:HL\("([^"]+)",[[:blank:]]*""[[:blank:]]*,/exec 'hi \1' ##/g
  s/call s:HL\("([^"]+)",[[:blank:]]*s:([^,]+)[[:blank:]]*,/exec 'hi \1' . s:fg_\2##/g

  # Handle 2nd parameter
  s/##[[:blank:]]*""[[:blank:]]*,/##/
  s/##[[:blank:]]*s:(.+)[[:blank:]]*,/ . s:bg_\1##/g

  # Handle last / 3rd parameter
  s/##[[:blank:]]*"")//
  s/##[[:blank:]]*s:bold)/ . s:ft_bold/
  s/##[[:blank:]]*"[Nn]one")/ . s:ft_none/
  s/##[[:blank:]]*"reverse")/ . s:ft_reverse/
}
# exec 'hi Normal ' . s:bg_foreground


