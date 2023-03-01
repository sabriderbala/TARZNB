import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  static values = { dates: Object }
  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      minDate: "today",
      inline: true,
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
      // more options available on the documentation!
    });
  }

}
