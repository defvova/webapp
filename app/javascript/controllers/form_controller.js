import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["errorContainer"];

	async connect() {
		document.addEventListener(
			"turbo:submit-end",
			await this.handleSubmitEnd.bind(this),
		);
	}

	async disconnect() {
		document.removeEventListener(
			"turbo:submit-end",
			await this.handleSubmitEnd.bind(this),
		);
	}

	async handleSubmitEnd(event) {
		if (event.detail.successful) return;

		const response = event.detail.fetchResponse;
		console.log(response);

		if (!response.succeeded && response.statusCode === 422) {
			const errorData = await response.responseText;
			const { errors, success } = JSON.parse(errorData);
			console.log(errors);

			const errorMessages = Object.values(errors).flat();

			this.errorContainerTarget.innerText = "";

			errorMessages.forEach((message) => {
				const paragraphElement = document.createElement("p");
				paragraphElement.textContent = message;
				paragraphElement.classList.add("alert", "alert-danger");

				this.errorContainerTarget.appendChild(paragraphElement);
			});
		}

		// Optionally clear any existing success messages.

		// You might also want to reset or focus on specific fields here.
	}
}
