import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

// Connects to data-controller="slim"
export default class extends Controller {
  static targets = [ "customer_container", "modal" ]

  connect() {
    new SlimSelect({
      select: '#booking_customer_id',
      closeOnSelect: false
    })
  }

  close() {
    this.modalTarget.classList.add('hidden')
    setTimeout(() => {
      this.element.parentElement.removeAttribute("src")
      this.element.remove()
    }, 100)
  }
}