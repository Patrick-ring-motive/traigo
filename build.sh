

rm -f go.sum
go get -u github.com/Patrick-ring-motive/deferrable
go build -ldflags "-g" -gcflags="-B -v -std"  -o traigo trai.go