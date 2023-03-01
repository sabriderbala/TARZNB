import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  static values = { dates: Object }

  connect() {
    console.log(this.datesValue)
    this.#initFlatPickr()
    flatpickr(this.startDateInputTarget, {
      ...this.#parsedBookedDates(),
      mode: 'range',
      minDate: "today",
      inline: true,
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
      // more options available on the documentation!
    });
  }

  #initFlatPickr() {
    flatpickr(this.startDateInputTarget, this.#options());
  }

  #options() {
    return {
      ...this.#parsedBookedDates(),
      mode: 'range',
      enableTime: true,
      minDate: new Date(),
      inline: true,
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    }
  }

    #parsedBookedDates() {
      return this.datesValue
    }

}
