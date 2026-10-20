# Colors

Pria is the reflection of light on metal — a radiant arc of pinks, greens, purples, blues, cyans, teals, magentas and mauves.

## Pallette

- Background: a simple color which a simple precense.
  - #232323
  - 15 lum: #232729 ----- 14 lum: 212527
  - #222120

- Background Two: a bit darker color than the background same family.

- Background Three: a bit lighter than background same family.

- Foreground:

```go
package main

import "fmt"

const QUESO = "cheddar"
const SayHello = "hi, mate"

func main() {
	user := User{ID: 1, Name: "John", Email: "john@example.com"}
	fmt.Println(user.Greet())
	fmt.Println(greet(""))
}


type User struct {
	ID    int
	Name  string
	Email string
}

func (u User) Greet() string {
	return fmt.Sprintf("Hi, I'm %s!\n", u.Name)

}


func greet(name string) string {
	if name == "" {
		return "Hello, stranger!"
	}
	return "Hello, " + name + "!"
}

func sum(a,b int) (int, error) {
	return a+b, nil
}

// hola como and s
```
