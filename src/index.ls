require! {
	redo
	\merge-defaults
}

target = process.argv.1

module.exports = (config)->
	if target is 'all'
		files <- collect-pages
		redo.ifchange files
	else if target == /\.html$/
		file = path.relative \_site target
		source <- readfile file
		deps <- thing.get-deps source
		<- redo.if-change [..file for deps]
		output <- compile source, deps
		process.stdout.write output