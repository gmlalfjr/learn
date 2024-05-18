package main

import (
	"fmt"
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofor-little/env"
)

func main() {
	// port := goDotEnvVariable("PORT")

	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		fmt.Println("Hello world")
		return c.SendString("Hello, World!")
	})

	log.Fatal(app.Listen(":4040"))
}

func goDotEnvVariable(key string) string {

	// load .env file
	err := env.Load(".env")

	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	return os.Getenv(key)
}
