# prolog_utils

List of not built-in pure Prolog predicates that are too complicated to make on the spot, so I made a repo to save them here.
This repo has both general purpose predicates and specific use predicates for libraries such as clpfd. 

## List of general purpose predicates (utils.pl)

#### Contains the following pure predicates:
-   `transpose/2` predicate that relates a rectangular matrix and its transpose;
-   `prefix_matrix/3` which relates rectangular prefix matrix, its prefix and the same matrix without the prefix.

#### Contains the following impure predicates:

## List of clpfd predicates (clpfd_utils.pl)

#### Contains the following pure predicates:

-   `L pins X..Y` which is the pure implementation of `L ins X..Y`;
-   `apply_hash/2` which maps the `#/1` operator over all elements of a list; 
-   `pall_distinct/1` which is the pure implementation of `all_distinct/1`.


#### Contains the following impure predicates: