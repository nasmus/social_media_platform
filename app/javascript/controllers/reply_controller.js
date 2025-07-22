import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reply"
export default class extends Controller {
  
    toggle(event) {
      const button = event.currentTarget;

      const replyInput = button.closest('div').nextElementSibling;

      if (replyInput) {
        replyInput.classList.toggle('hidden');
      }
    }

  cancel(event) {
    const button = event.currentTarget;

    const replyInput = button.closest('.reply-input');

    if (replyInput) {
      replyInput.classList.add('hidden');
    }
  }

}

