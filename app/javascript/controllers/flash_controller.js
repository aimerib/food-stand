import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // when stimulus controlled element is mounted to the dom, we add a timeout
  // to dismiss the notice element after 3 seconds
  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 5000);
  }

  dismiss() {
    this.element.remove();
  }
}
