rsync -r src/ docs/
rsync build/contracts/* docs/
git add .
git commit -am "Complite Assets for github pages"
git push -u origin master