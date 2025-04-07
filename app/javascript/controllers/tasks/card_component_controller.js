import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['description', 'chevron'];

  toggleDescription() {
    this.descriptionTarget.classList.toggle('hidden');
    this.chevronTarget.classList.toggle('rotate-180');
  }
}
