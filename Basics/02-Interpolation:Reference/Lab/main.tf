resource "local_file" "Pravash" {
    filename = var.filename
    content = "Please use this auto generated password: ${random_password.password.result}"
}

resource "random_password" "password" {
    length = 16
    lower = false
    special = true
}