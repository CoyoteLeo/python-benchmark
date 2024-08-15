package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	// Create a Gin router instance
	r := gin.Default()

	// Define a GET route for the root path
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello, World!",
		})
	})

	// Start the server on port 8080
	err := r.Run(":8080")
	if err != nil {
		return
	} // Listen and serve on 0.0.0.0:8080
}
