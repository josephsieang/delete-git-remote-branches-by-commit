#!/bin/bash

for branch in $(git branch -r -l "$1"'/*' --format='%(refname:lstrip=3)' --contains "$2"); do
  read -p "Are you sure to delete $1/$branch? (y/n): " answer
  if([ "$answer" == "y" ]) then
    git push origin -d "$branch"
  else
    echo Skip deleting $1/$branch.
  fi
done
