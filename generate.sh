#! /bin/bash

contributions=(
  1 1 1 1 1 1 1
  1 0 0 0 0 0 1
  1 0 0 0 0 0 1
  1 0 0 0 0 0 1
  0 1 1 1 1 1 0
  0 0 0 0 0 0 0
  1 1 1 1 1 1 1
  0 0 0 0 0 0 0
  0 1 1 1 1 1 1
  1 0 0 1 0 0 0
  1 0 0 1 0 0 0
  1 0 0 1 0 0 0
  0 1 1 1 1 1 1
  0 0 0 0 0 0 0
  1 1 1 1 1 1 1
  0 0 0 0 0 0 1
  0 0 0 0 0 0 1
  0 0 0 0 0 0 1
  0 0 0 0 0 0 1
  0 0 0 0 0 0 0
  0 1 1 1 1 1 0
  1 0 0 0 0 0 1
  1 0 0 0 0 0 1
  1 0 0 0 0 0 1
  0 1 1 1 1 1 0
  0 0 0 0 0 0 0
  0 1 1 1 1 1 0
  1 0 0 0 0 0 1
  1 0 0 1 0 0 1
  1 0 0 1 0 0 1
  0 1 0 1 1 1 0
  0 0 0 0 0 0 0
  1 1 1 1 1 1 0
  0 0 0 0 0 0 1
  0 0 0 0 0 0 1
  0 0 0 0 0 0 1
  1 1 1 1 1 1 0
  0 0 0 0 0 0 0
  1 1 1 1 1 1 1
  1 0 0 1 0 0 1
  1 0 0 1 0 0 1
  1 0 0 1 0 0 1
  1 0 0 1 0 0 1
  0 0 0 0 0 0 0
  0 0 0 1 0 0 0
  0 0 0 1 0 0 0
  0 0 0 1 0 0 0
  1 1 1 1 1 1 1
  0 0 0 1 0 0 0
  0 0 0 1 0 0 0
  0 0 0 1 0 0 0
)

git checkout --orphan temp
git branch -D main
git checkout -b main

for i in ${!contributions[@]}; do
  if [ ${contributions[$i]} -eq 1 ]; then
    git commit --allow-empty --date "$(date -d "next sunday - 371 days + $i days")" -m "+"
  fi
done

git filter-branch --env-filter 'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"' -f
