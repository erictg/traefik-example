package main

import "github.com/gin-gonic/gin"

func main() {
	e := gin.Default()

	e.GET("/rest/api1/a", endpointA)
	e.GET("/rest/api1/b", endpointB)

	if err := e.Run(":8081"); err != nil {
		panic(err)
	}
}

func endpointA(c *gin.Context) {
	c.JSON(200, gin.H{
		"source": "api 1 endpoint a",
	})
}

func endpointB(c *gin.Context) {
	c.JSON(200, gin.H{
		"source": "api 1 endpoint b",
	})
}
