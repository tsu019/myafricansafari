// --------------------------
// TERRAFORM INPUT VARIABLES Does
// --------------------------
variable "animals" {
    type    = list(string)
    default = [
      "elephant",
      "rhinoceros",
      "buffalo",
      "lion",
      "leo-the-leopard",
      "zebra",
      "giraffe",
      "cheetah",
      #"meerkat",
      #"hyena"
    ]
}

// -------------------------------------------------------------------------------------------------------------------
// TERRAFORM RESOURCE THAT WILL RANDOMLY SELECT AN ANIMAL NAME FROM A LIST THAT CONTAINS THE BIG FIVE AFRICAN ANIMALS
// -------------------------------------------------------------------------------------------------------------------
resource "random_shuffle" "potato" { //random_shuffle is a resource from a provider. This has to have a unique name attached to the resource provider name
  input = "${var.animals}"
  result_count = 1
  keepers = { // I want a new name everytime the time changes, because if I don't define it as a keeper. Keep the value of the result everytime the time changes.
    # Generate a new id whenever the provisioning time changes
    timemeasurementofthemoment = "${timestamp()}"
  }
}

// --------------------------
// TERRAFORM OUTPUT VARIABLE
// --------------------------
output "animal_name" { //The full output after an execution is an output
  value = "${random_shuffle.potato.result}" // See example above about random_shuffle
}
