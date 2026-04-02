package handlers

import (
    "encoding/json"
    "net/http"
    "strconv"

    "github.com/gorilla/mux"
    "go-crud-api/models"
)

var Users []models.User

func GetUsers(w http.ResponseWriter, r *http.Request) {
    json.NewEncoder(w).Encode(Users)
}

func GetUser(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)

    for _, user := range Users {
        if user.ID == params["id"] {
            json.NewEncoder(w).Encode(user)
            return
        }
    }

    http.Error(w, "User not found", http.StatusNotFound)
}

func CreateUser(w http.ResponseWriter, r *http.Request) {
    var user models.User
    json.NewDecoder(r.Body).Decode(&user)

    user.ID = strconv.Itoa(len(Users) + 1)
    Users = append(Users, user)

    json.NewEncoder(w).Encode(user)
}

func UpdateUser(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)
    var updatedUser models.User

    json.NewDecoder(r.Body).Decode(&updatedUser)

    for i, user := range Users {
        if user.ID == params["id"] {
            Users[i].Name = updatedUser.Name
            Users[i].Email = updatedUser.Email
            json.NewEncoder(w).Encode(Users[i])
            return
        }
    }

    http.Error(w, "User not found", http.StatusNotFound)
}

func DeleteUser(w http.ResponseWriter, r *http.Request) {
    params := mux.Vars(r)

    for i, user := range Users {
        if user.ID == params["id"] {
            Users = append(Users[:i], Users[i+1:]...)
            json.NewEncoder(w).Encode(map[string]string{"message": "deleted"})
            return
        }
    }

    http.Error(w, "User not found", http.StatusNotFound)
}
