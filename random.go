package main

import "github.com/gin-gonic/gin"
import "math/rand"
import "strconv"

func main() {
  r := gin.Default()
  r.GET("/random", func(c *gin.Context) {
  	n := rand.Intn(100)
    c.JSON(200, gin.H{
      "number": strconv.Itoa(n),
    })
  })
  r.Run() // listen and serve on 0.0.0.0:8080
}