import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import StimulusReflex from "stimulus_reflex"
import consumer from "channels/consumer"

const application = Application.start()

application.debug = false
application.consumer = consumer
window.Stimulus = application

StimulusReflex.initialize(application, { consumer })

eagerLoadControllersFrom("controllers", application)

export { application }
