# P reducer
R package for reducing p-values using Fisher's method.

To use:

install via github:
```R
library(devtools)
install_github(adamrtalbot, preducer)
```

Take table of p-values, with p-values in one column and grouping variable in another. Run using:

```R
fishers_method(data, "pvalue", "group")
```
