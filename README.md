
# Traigo

## Overview
The `traigo` module introduces a structured error handling pattern akin to `try/catch/finally` commonly found in other programming languages, adapted to Go's idioms. It utilizes Go's `panic` and `recover` for error handling, providing a familiar syntax for developers coming from languages with exception handling.

## Installation
Ensure your project is set up with Go Modules and run:
```bash
go get github.com/Patrick-ring-motive/traigo
```

## Functions

### Try
Executes a block of code and handles errors with `catch` and `finally` blocks.

#### Signature
```go
func Try(try func(), catch func(interface{}), finally ...func())
```

#### Parameters
- `try`: Function to execute that may `panic`.
- `catch`: Function to execute if an error (panic) occurs in the `try` block.
- `finally`: Optional function to execute after `try` and `catch`, regardless of errors.

### Catch
Syntactic sugar for defining a `catch` block.

#### Signature
```go
func Catch(catch func(interface{})) func(interface{})
```

### Finally
Syntactic sugar for defining a `finally` block.

#### Signature
```go
func Finally(finally func()) func()
```

## Example Usage

```go
package main

import (
    "fmt"
    . "github.com/Patrick-ring-motive/traigo"
)

func main() {
    Try(func(){
        fmt.Println("try something")
        panic("oh no")
    }, Catch(func(err interface{}){
        fmt.Println(err)
    }))

    Try(func(){
        fmt.Println("try something else")
        panic("not again")
    }, Catch(func(err interface{}){
        fmt.Println(err)
    }), Finally(func(){
        fmt.Println("finally done")
    }))
}
```

This example demonstrates using `Try` to execute code that may fail, handling exceptions with `Catch`, and ensuring cleanup or final actions with `Finally`.

## Considerations
- The use of `panic` and `recover` in this manner is a departure from Go's conventional error handling practices. It should be used judiciously, especially in larger Go projects or libraries.
- `Traigo` offers an alternative pattern that might be more familiar to developers from other languages but mixing this with conventional Go error handling can affect readability and maintainability.

## Conclusion
`Traigo` provides a creative approach to error handling in Go, bridging familiar patterns from other languages with Go's unique capabilities. It's an experiment in language interoperability and developer ergonomics, showcasing the flexibility of Go.
