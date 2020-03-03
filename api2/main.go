package main

import "github.com/gin-gonic/gin"

func main() {
	e := gin.Default()

	e.GET("/rest/api2/a", endpointA)
	e.GET("/rest/api2/b", endpointB)

	if err := e.Run(":8082"); err != nil {
		panic(err)
	}
}

func endpointA(c *gin.Context) {
	c.JSON(200, gin.H{
		"source": "api 2 endpoint a",
	})
}

func endpointB(c *gin.Context) {
	c.JSON(200, gin.H{
		"source": "api 2 endpoint b",
	})
}
