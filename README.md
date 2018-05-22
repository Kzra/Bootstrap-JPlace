# Bootstrap-Jplace
A shell script that will create an iTOL dataset of bootstrap symbols/labels to annotate a jplace tree created using the RAxML EPA algorithm.

**Usage**: 
```shell
bash bootstrap_jplace.sh [reference-tree] [jplace-tree]
```
Where \[reference-tree] is a bootstrapped tree in the format RAxML_bipartitions.ref_tree.out and is of identical topology to the jplace tree RaxML_portableTree.EPA_tree.out.jplace.

Two .txt files, Branch_Labels.txt & Branch_Symbols.txt will be produced. Branch_Labels.txt can be used to add bootstrap text labels to a jplace tree visualised on iTOL, Branch_Symbols.txt will add symbols (white squares) with size proportional to the bootstrap value. Simply drag the text files onto the iTOL window.
For more information see [here.](https://itol.embl.de/help.cgi#datasets)
