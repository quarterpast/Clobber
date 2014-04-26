src="src/${2#lib/}.ls"
dir="$(dirname $1)"

redo-ifchange $src

mkdir -p "$dir"
lsc -pc "$src"