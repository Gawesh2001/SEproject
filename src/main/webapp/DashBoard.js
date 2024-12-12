

//SEARCH BAR

const searchInput = document.getElementById('movie-search');
const suggestionsList = document.getElementById('search-suggestions');

// Handle input event
searchInput.addEventListener('input', async () => {
    const query = searchInput.value.trim();

    if (query.length === 0) {
        suggestionsList.innerHTML = ''; // Clear suggestions if input is empty
        return;
    }

    try {
        // Fetch movie suggestions from the server
        const response = await fetch(`/search?q=${encodeURIComponent(query)}`);
        const suggestions = await response.json();

        // Populate the suggestions list
        suggestionsList.innerHTML = '';
        suggestions.forEach(movie => {
            const suggestionItem = document.createElement('li');
            suggestionItem.textContent = movie.title;

            // Handle click on a suggestion
            suggestionItem.addEventListener('click', () => {
                searchInput.value = movie.title; // Set search input to selected title
                suggestionsList.innerHTML = ''; // Clear suggestions
            });

            suggestionsList.appendChild(suggestionItem);
        });
    } catch (error) {
        console.error('Error fetching movie suggestions:', error);
    }
});

// Close suggestions when clicking outside
document.addEventListener('click', (event) => {
    if (!event.target.closest('.search-bar')) {
        suggestionsList.innerHTML = '';
    }
});



//HERO

let currentMovieIndex = 0; // Tracks current movie index
let movies = []; // Stores movie data

// Fetch movie data from the server
async function fetchMovies() {
    try {
        const response = await fetch('/movies'); // Fetch from the Java Servlet
        movies = await response.json();
        displayMovie(currentMovieIndex); // Display the first movie
    } catch (error) {
        console.error('Error fetching movies:', error);
    }
}

// Display the movie at the given index
function displayMovie(index) {
    const movie = movies[index];
    if (!movie) return;

    const heroSection = document.querySelector('.hero');
    const movieTitle = document.getElementById('movie-title');
    const bookTicketBtn = document.getElementById('book-ticket');
    const seeDetailsBtn = document.getElementById('see-details');

    // Update hero background image
    heroSection.style.backgroundImage = `url(${movie.imageUrl})`;

    // Update movie details
    movieTitle.textContent = movie.title;
    bookTicketBtn.onclick = () => window.location.href = `/book/${movie.id}`;
    seeDetailsBtn.onclick = () => window.location.href = `/details/${movie.id}`;
}

// Handle Next and Previous buttons
document.getElementById('next-movie').addEventListener('click', () => {
    currentMovieIndex = (currentMovieIndex + 1) % movies.length; // Loop back to the start
    displayMovie(currentMovieIndex);
});

document.getElementById('prev-movie').addEventListener('click', () => {
    currentMovieIndex = (currentMovieIndex - 1 + movies.length) % movies.length; // Loop back to the end
    displayMovie(currentMovieIndex);
});

// Initial Fetch
fetchMovies();






//DEALS AND ADVERTICEMENTS

document.addEventListener("DOMContentLoaded", () => {
    const dealsContainer = document.querySelector(".deals-container");

    // Fetch deals from the servlet
    fetch("/fetch-deals")
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch deals");
            }
            return response.json();
        })
        .then(dealsData => {
            dealsData.forEach(deal => {
                const dealElement = document.createElement("div");
                dealElement.classList.add("deal");

                dealElement.innerHTML = `
                    <img src="${deal.image}" alt="${deal.title}">
                    <div class="deal-details">
                        <h3>${deal.title}</h3>
                        <p>${deal.description}</p>
                        <a href="${deal.link}" class="primary-button">See Details</a>
                    </div>
                `;

                dealsContainer.appendChild(dealElement);
            });

            // Reinitialize slider once data is loaded
            initializeSlider();
        })
        .catch(error => {
            console.error("Error loading deals:", error);
            dealsContainer.innerHTML = `<p>Failed to load deals.</p>`;
        });

    function initializeSlider() {
        const prevButton = document.getElementById("prev-deal");
        const nextButton = document.getElementById("next-deal");
        const deals = document.querySelectorAll(".deal");
        let currentIndex = 0;

        function updateSlider() {
            const slideWidth = deals[0].clientWidth + 20; // Include gap between slides
            const offset = -(currentIndex * slideWidth);
            dealsContainer.style.transform = `translateX(${offset}px)`;
        }

        prevButton.addEventListener("click", () => {
            if (currentIndex > 0) {
                currentIndex--;
                updateSlider();
            }
        });

        nextButton.addEventListener("click", () => {
            if (currentIndex < deals.length - 1) {
                currentIndex++;
                updateSlider();
            }
        });

        // Optional: Auto slide
        setInterval(() => {
            if (currentIndex < deals.length - 1) {
                currentIndex++;
            } else {
                currentIndex = 0;
            }
            updateSlider();
        }, 5000); // Slide every 5 seconds
    }
});





