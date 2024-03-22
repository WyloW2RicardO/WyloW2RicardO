# Langage R

## Opérateur

|R  |Description|
|-  |-|
|\+ |Plus|
|–  |Minus|
|*  |Multiplication|
|/  |Division|
|^  |Exponential|
|%% |Modulus              |
|%/%|Integer divide       |
|%*%|Matrix multiplication|
|%o%|Outer product        |
|%x%|Kronecker product    |

## Fonction

returns a permutation of the order of the elements of a vector.
order(x, # Sequence of vectors of the same length
      decreasing = FALSE, # Whether to sort in increasing or decreasing order
      na.last = TRUE,     # Whether to put NA values at the beginning or at the end
      method = c("auto", "shell", "radix")) # Method to be used. Defaults to auto

Représenter les données catégorielles
factor(x = character(),         # Input vector data
       levels,                  # Input of unique x values (optional)
       labels = levels,         # Output labels for the levels (optional)
       exclude = NA,            # Values to be excluded from levels
       ordered = is.ordered(x), # Whether the input levels are ordered as given or not
       nmax = NA)               # Maximum number of levels

Créez des résumés statistiques par groupe en fonction des niveaux d’un ou plusieurs facteurs.
tapply(X,               # Object you can split (matrix, data frame, ...)
       INDEX,           # List of factors of the same length
       FUN,             # Function to be applied to factors (or NULL)
       ...,             # Additional arguments to be passed to FUN
       default = NA,    # If simplify = TRUE, is the array initialization value
       simplify = TRUE) # If set to FALSE returns a list object

## Annex

### Note

hatvalues(model)
