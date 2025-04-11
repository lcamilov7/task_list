import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  close() {
    document.getElementById('task-drawer-container').innerHTML = ''
  }
}
