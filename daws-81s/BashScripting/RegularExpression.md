#### Regular Expression

      echo "https://github.com/divyavut/DevOps-daws-81s.git" | awk -F "/" '{sub(/\.git$/, "",$NF); print $NF}'

### Substitue is a built in function in awk. it has three arguments

1. Regular Expression(must enclose with forward slash)
2. Replacement String
3. Input(last field after the Field Seperator is applied)

#### \ backward slash after .(dot) used to espace the dot

.(dot) is a literal character in english. example : @,#, ., $,\*,&,^,! ,a,b,c,1,2,3

Note: In Shell script regular expressions .(dot) is a special character..(dot) matches any character in regular expression.

\backward slash after .(dot) tells regular expression that . is a normal literal character not the special character.
