import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'form' ];

  newComment() {
    Rails.fire(this.formTarget, 'submit');
  }
}
