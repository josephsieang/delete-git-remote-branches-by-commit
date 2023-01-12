#!/bin/bash

for branch in $(git branch -r --format='%(refname:lstrip=3)' --contains "$1"); do
  read -p "Are you sure to delete origin/$branch? (y/n): " answer
  if([ "$answer" == "y" ]) then
    git push origin -d "$branch"
  else
    echo Skip deleting origin/$branch.
  fi
done