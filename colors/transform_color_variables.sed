# Run with -E (on Mac) or -e (other OS) for extended regex
# For example:
# sed -E -f transform_color_variables.sed < colorvars > colorvars_transformed
s/get\(.*\]/, &)/g
s/.*let s:([^ =]+)[^,]*/call s:create_color_variables('\1'/
