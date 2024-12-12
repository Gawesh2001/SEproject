<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="DashBoard.css">
      
    
</head>
<body>
    
    <header>
        <div class="logo">
            <a href="index.html">Logo</a>
        </div>
        <nav class="nav">
            <a href="index.html">Home</a>
            <a href="#movies">Movies</a>
            <a href="#deals-advertisements">Deals and Advertise</a>
            <a href="#">Contacts</a>
            <a href="#">About Us</a>
        </nav>
        <div class="actions">
            <div class="search-bar">
                <input type="text" id="movie-search" placeholder="Search" autocomplete="off">
                
                <button class="search-btn">Search</button>
            </div>
            
            <div class="actions">
            <!-- Dynamic Login/Profile Section -->
            <a href="LoginPage.jsp">
                <button class="login-btn">
                    Login
                </button>
            </a>
        </div>
    </header>

    <iframe src="hero" style="border:none; width:100%; height:100vh;"></iframe>


    <section class="movies" id="movies">
        <h2>Movies</h2>
        <div class="movies-top">
            <div class="movie-release-buttons">
                <button>Now Showing</button>
                <button>Coming Soon</button>
            </div>
            <div class="filter-and-search">
                
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <button class="search-btn">Search</button>
                </div>  
            </div>
        </div>
        <hr>

        <div class="movie-list" id="movieList">
            <!-- Additional movies will be dynamically loaded here -->
            <iframe src="movie" style="border:none; width:100%; height:100vh;"></iframe>
        </div>
    </section>


    <section class="deals-advertisements" id="deals-advertisements">
        <h2>Deals and Advertisements</h2>
        <div class="slider-container">
            <button id="prev-deal" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24">
                    <path d="M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6 6 6z" />
                </svg>
            </button>
            <div class="deals-wrapper">
                <div class="deals-container">
                    <!-- Deals will be dynamically generated here -->
                </div>
            </div>
            <button id="next-deal" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24">
                    <path d="M8.59 16.59L13.17 12l-4.58-4.59L10 6l6 6-6 6z" />
                </svg>
            </button>
        </div>
    </section>
    
    <footer class="footer">
        <nav class="footer-nav">
            <a href="index.html">Home</a>
            <a href="#movies">Movies</a>
            <a href="#deals-advertisements">Deals and Advertise</a>
            <a href="#">Contacts</a>
            <a href="#">About Us</a>
        </nav>
        <hr>
        <div class="footer-top">
            <!-- Logo and Description -->
            <div class="footer-logo">
                <div class="logo-box">LOGO</div>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </p>
                <p>customercare@cinema.lk</p>
            </div>
    
            <!-- Useful Links -->
            <div class="footer-useful-links">
                <h4>USEFUL LINKS</h4>
                <ul>
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Cookie Policy</a></li>
                    <li><a href="#">Terms and Conditions</a></li>
                </ul>
            </div>
    
            <!-- Subscribe Section -->
            <div class="footer-subscribe">
                <h4>Subscribe</h4>
                <div class="subscribe-box">
                    <input type="email" placeholder="Email address" />
                    <button>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                            <path fill-rule="evenodd" d="M12.97 3.97a.75.75 0 0 1 1.06 0l7.5 7.5a.75.75 0 0 1 0 1.06l-7.5 7.5a.75.75 0 1 1-1.06-1.06l6.22-6.22H3a.75.75 0 0 1 0-1.5h16.19l-6.22-6.22a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />
                          </svg>
                    </button>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
        </div>
    
        <div class="footer-bottom">
            <p>Copyright � 2024 | Cinema</p>
            <div class="social-icons">
                <span>Follow us on</span>
                <div class="icons">
                    <a href="#">           
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" fill="currentColor"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M80 299.3V512H196V299.3h86.5l18-97.8H196V166.9c0-51.7 20.3-71.5 72.7-71.5c16.3 0 29.4 .4 37 1.2V7.9C291.4 4 256.4 0 236.2 0C129.3 0 80 50.5 80 159.4v42.1H14v97.8H80z"/></svg>
                    </a>
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="currentColor"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M459.4 151.7c.3 4.5 .3 9.1 .3 13.6 0 138.7-105.6 298.6-298.6 298.6-59.5 0-114.7-17.2-161.1-47.1 8.4 1 16.6 1.3 25.3 1.3 49.1 0 94.2-16.6 130.3-44.8-46.1-1-84.8-31.2-98.1-72.8 6.5 1 13 1.6 19.8 1.6 9.4 0 18.8-1.3 27.6-3.6-48.1-9.7-84.1-52-84.1-103v-1.3c14 7.8 30.2 12.7 47.4 13.3-28.3-18.8-46.8-51-46.8-87.4 0-19.5 5.2-37.4 14.3-53 51.7 63.7 129.3 105.3 216.4 109.8-1.6-7.8-2.6-15.9-2.6-24 0-57.8 46.8-104.9 104.9-104.9 30.2 0 57.5 12.7 76.7 33.1 23.7-4.5 46.5-13.3 66.6-25.3-7.8 24.4-24.4 44.8-46.1 57.8 21.1-2.3 41.6-8.1 60.4-16.2-14.3 20.8-32.2 39.3-52.6 54.3z"/></svg>
                    </a>
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" fill="currentColor"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M448 209.9a210.1 210.1 0 0 1 -122.8-39.3V349.4A162.6 162.6 0 1 1 185 188.3V278.2a74.6 74.6 0 1 0 52.2 71.2V0l88 0a121.2 121.2 0 0 0 1.9 22.2h0A122.2 122.2 0 0 0 381 102.4a121.4 121.4 0 0 0 67 20.1z"/></svg>
                    </a>
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" fill="currentColor"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
                    </a>
                </div>
            </div>
        </div>
    </footer>
    
    
    
    <script src="DashBoard.js"></script>
</body>
</html>