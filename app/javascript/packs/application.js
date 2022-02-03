// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require bootstrap-modal
require('@client-side-validations/client-side-validations')
require('@client-side-validations/simple-form')

// Bootstrap 4+ with `require` syntax
require('@client-side-validations/simple-form/dist/simple-form.bootstrap4.esm')
