package main

import (
	"net/http"

	echo "github.com/labstack/echo/v4"
	"go.elastic.co/apm/module/apmechov4"
)

func main() {
	e := echo.New()
	e.Use(apmechov4.Middleware())

	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Haee =9")
	})

	e.GET("/error", func(c echo.Context) error {
		return c.String(http.StatusInternalServerError, "Something went wrong")
	})

	e.Logger.Fatal(e.Start(":3000"))
}
