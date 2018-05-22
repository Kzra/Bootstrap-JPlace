#!/usr/bin/bash
#This script was written using git bash for windows. On another OS '\).{3}' might be needed with grep to escape the parenthesis. 
#Where the reference tree, RAxML_bipartitions.ref_tree.out and the jplace tree, RaxML_portableTree.EPA_tree.out.jplace have identical topology.
#Two output dataset files will be produced that can label a jplace tree with text or branch symbols on iTOL.
#nodeID2 is the nodeID + 1, this ensures the bootstrap labels are consistent with those produced from iTOL automatically on the reference tree. To use the true nodeiDs replace nodeID2 with nodeID the the paste command.
grep -o -E ').{3}' $1  | sed 's/)//' | sed 's/:0//' | sed 's/://' >BS
grep -o -E '.{4}).{0}' $2 | sed 's/^.*{//' | sed 's/})//' >nodeID
while read p;
do echo "$(($p + 1 ))" >> nodeID2
done <nodeID
a=$(cat BS | wc -l)
yes "1" | head -$a >  Symbol
yes "#B2B8D8" | head -$a > Colour
yes "0" | head -$a > Fill
yes "0.5" | head -$a > Position
cat > Bootstrap_Symbol.txt <<EOF
DATASET_SYMBOL
SEPARATOR COMMA
DATASET_LABEL,Bootstrap_Symbol
COLOR,#B2B8D8
MAXIMUM_SIZE,10
DATA
EOF
paste -d , nodeID2 Symbol BS Colour Fill Position >> Bootstrap_Symbol.txt
yes "normal" | head -$a>Style
yes "#000000" | head -$a >Text_Colour
yes "1" | head -$a >Size
yes "0" | head -$a >Rotation
cat > Bootstrap_Label.txt <<EOF
DATASET_TEXT
SEPARATOR COMMA
DATASET_LABEL,Bootstrap_Label
COLOR,#000000
DATA
EOF
paste -d , nodeID2 BS Position Text_Colour Style Size Rotation>> Bootstrap_Label.txt
rm -f nodeID2 BS Position Text_Colour Style Size Rotation Colour Fill Position Symbol nodeID