document.addEventListener("DOMContentLoaded", function() {

    // Select all elements with the class "switch-view" and attach a click event listener to each
    document.querySelectorAll(".switch-view").forEach(button => {
        button.addEventListener("click", function() {

            // Retrieve the card ID from the data attribute of the clicked button
            const cardId = this.getAttribute("data-card-id");

            // Toggle the display of the card front
            document.querySelector(`.card-front[data-card-id="${cardId}"]`).style.display =
                document.querySelector(`.card-front[data-card-id="${cardId}"]`).style.display === 'none' ? 'block' : 'none';

            // Toggle the display of the card back
            document.querySelector(`.card-back[data-card-id="${cardId}"]`).style.display =
                document.querySelector(`.card-back[data-card-id="${cardId}"]`).style.display === 'none' ? 'block' : 'none';
        });
    });
});