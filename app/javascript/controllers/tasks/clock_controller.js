import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time"]

  connect() {
    console.log('connected')
    this.updateTime()
    this.timer = setInterval(() => this.updateTime(), 1000)
  }

  disconnect() {
    clearInterval(this.timer)
  }

  updateTime() {
    const now = new Date()
    const formatted = now.toLocaleTimeString()
    this.timeTarget.textContent = formatted
  }
}
