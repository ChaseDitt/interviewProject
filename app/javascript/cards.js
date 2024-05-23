document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".switch-view").forEach(button => {
        button.addEventListener("click", function() {
            const cardId = this.getAttribute("data-card-id");
            document.querySelector(`.card-front[data-card-id="${cardId}"]`).style.display =
                document.querySelector(`.card-front[data-card-id="${cardId}"]`).style.display === 'none' ? 'block' : 'none';
            document.querySelector(`.card-back[data-card-id="${cardId}"]`).style.display =
                document.querySelector(`.card-back[data-card-id="${cardId}"]`).style.display === 'none' ? 'block' : 'none';
        });
    });
});