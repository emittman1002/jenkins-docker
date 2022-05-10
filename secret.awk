BEGIN {
	found = 0
}

(!found && $0 ~ /-secret /)	{
	sub(/^.*-secret /, "")
	sub(/ .*$/, "")
	print
	found = 1
}
