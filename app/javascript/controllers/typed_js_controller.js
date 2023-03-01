import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Réservez dès maintenant votre séjour dans nos cabanes suspendues et vivez une expérience unique et mémorable dans les arbres."],
      typeSpeed: 60,
      loop: true
    })
  }
}
