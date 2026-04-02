package main

import (
    "log"
    "net/http"

    "github.com/gorilla/mux"
    "go-crud-api/handlers"
)

func main() {
    r := mux.NewRouter()

    r.HandleFunc("/users", handlers.GetUsers).Methods("GET")
    r.HandleFunc("/users/{id}", handlers.GetUser).Methods("GET")
    r.HandleFunc("/users", handlers.CreateUser).Methods("POST")
    r.HandleFunc("/users/{id}", handlers.UpdateUser).Methods("PUT")
    r.HandleFunc("/users/{id}", handlers.DeleteUser).Methods("DELETE")

    log.Println("Server running on port 8000...")
    log.Fatal(http.ListenAndServe(":8000", r))
}
