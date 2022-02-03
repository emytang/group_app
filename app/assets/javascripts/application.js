import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery

//= require rails.validations

// No framework / Generic frameworks / Bootstrap 3
//= require rails.validations.simple_form

// Bootstrap 4+
//= require rails.validations.simple_form.bootstrap4
