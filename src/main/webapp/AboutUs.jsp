<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Cinema</title>
    <link rel="stylesheet" href="DashBoard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #282828;
            color: #333;
        }
        
        p {
            color: #555;
        }

        header {
            position: relative; 
            top: 0;
            left: 0;
            width: 100%; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px; 
            background-color: transparent; 
            color: white; 
            z-index: 10; 
        }                      


        header .logo a{
            text-decoration: none;
            color: white;
        }

        header .logo a:hover{
            transform: scale(1.1);
        }

        header .nav {
            display: flex;
            gap: 20px;
        }

        header .nav a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
            font-weight: bold;

        }

        header .nav a:hover{
            color: rgb(255, 136, 0);
            transform: scale(1.01);
        }

        .search-bar {
            display: flex;
            align-items: center;
            background-color: white;
            border-radius: 5px;
            height: 36px;
            width: 300px;
        }

        .search-bar input {
            border: none;
            padding: 0 10px;
            font-size: 1rem;
            outline: none;
            flex: 1; /* Makes input take the available space */
        }


        .search-bar .search-btn {
            border: none;
            background-color:  rgb(255, 136, 0);
            font-weight: bold;
            color: white;
            padding: 0 15px;
            cursor: pointer;
            font-size: 1rem;
            height: 36px;
            border-radius: 10px,0px,10px,0px;
            transition: transform 0.2s, box-shadow 0.2s ease, background-color 0.2s ease;
        }

        .search-bar .search-btn:hover{
            background-color: rgb(255, 150, 30); /* Slightly lighter orange */
            box-shadow: 0 8px 15px rgba(255, 136, 0, 0.6); /* Glow effect */
            transform: scale(1.02);
        }


        section {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        section h2 {
            color: #ff8800;
            margin-bottom: 10px;
        }

        .content {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .content p {
            margin-bottom: 10px;
        }

        .mission-vision {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .mission-vision div {
            flex: 1;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
        }

        .contact {
            background-color: #111;
            color: #fff;
            text-align: center;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
        }

        .contact a {
            color: #4caf50;
            text-decoration: none;
        }

        .contact a:hover {
            text-decoration: underline;
        }

        .footer {
            background-color: #222;
            padding: 40px 20px;
            color: #717171;
            font-family: Arial, sans-serif;
        }

        .footer-nav {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            gap: 30px;
        }

        .footer-nav a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
            font-weight: bold;

        }

        .footer-nav a:hover{
            color: rgb(255, 136, 0);
        }

        footer hr {
            border: 0; /* Removes default border */
            height: 2px; /* Sets the height of the line */
            background-color: #333; /* Sets the color of the line */
        }


        .footer-top {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            border-bottom: 1px solid #333;
            padding-bottom: 20px;
            margin-top: 20px;
        }

        .footer-logo {
            flex: 1;
            max-width: 300px;
        }

        .footer-logo .logo-box {
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
            color: white;
        }

        .footer-logo p {
            font-size: 14px;
            line-height: 1.6;
        }

        .footer-links {
            flex: 1;
            max-width: 200px;
        }

        .footer-links h4 {
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .footer-useful-links {
            flex: 1;
            max-width: 200px;
            text-align: center;
        }

        .footer-useful-links h4{
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .footer-useful-links ul {
            list-style: none;
            padding: 0;
        }

        .footer-useful-links li {
            margin-bottom: 8px;
        }

        .footer-useful-links a {
            text-decoration: none;
            color: #717171;
            font-size: 14px;
        }

        .footer-useful-links a:hover {
            text-decoration: underline;
            color: #ff8800;
        }

        .footer-links a {
            text-decoration: none;
            color: #717171;
            font-size: 14px;
        }

        .footer-links a:hover {
            text-decoration: underline;
            color: #ff8800;
        }

        .footer-subscribe {
            flex: 1;
            max-width: 300px;
        }

        .footer-subscribe h4 {
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
        }

        .subscribe-box {
            display: flex;
            margin-bottom: 10px;
        }

        .subscribe-box input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px;
            font-size: 14px;
        }

        .subscribe-box button {
            padding: 0 10px;
            border: none;
            background-color: #717171;
            color: white;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center; /* Ensures the icon is centered */
        }

        .subscribe-box button svg {
            width: 20px; /* Adjust to your desired size */
            height: 20px;
            fill: white; /* Ensures the icon matches the button text color */
        }

        .subscribe-box button:hover {
            background-color: #ff8800;
        }


        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .footer-bottom p {
            width: 300px;
        }

        .footer-social {
            text-align: center;
        }

        .social-icons {
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            width: 100%;
        }

        .social-icons a {
            display: inline-block;
            width: 26px;
            height: 26px;
            color: #333;
            transition: transform 0.3s;
        }

        .social-icons svg {
            fill: #717171;
            width: 100%;
            height: 100%;
        }

        .social-icons a:hover svg {
            fill: #ff8800;
            transform: scale(1.2);
        }

        .dropdown {
            position: relative;
        }

        .support {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .icon {
            width: 25px; /* Increase width */
            height: 25px; /* Increase height */
            transition: transform 0.3s; /* Smooth rotation */
        }


        .dropdown:hover .icon {
            transform: rotate(180deg);
        }

        .dropdown {
            position: relative;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%; /* Position the dropdown below the 'Support' */
            left: 0;
            display: none; /* Hides dropdown by default */
            flex-direction: column; /* Stack items vertically */
            background-color: transparent;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 10;
            min-width: 150px; /* Ensures proper dropdown width */
        }

        .dropdown-menu a {
            padding: 10px 20px;
            color: rgb(255, 255, 255);
            text-decoration: none;
            display: block; /* Ensures full-width clickable area */
            white-space: nowrap; /* Prevents text wrapping */
        }

        .dropdown-menu a:hover {
            background-color: #f0f0f0; /* Adds hover effect */
        }

        .dropdown:hover .dropdown-menu {
            display: flex; /* Makes dropdown visible on hover */
        }
        .tooltip {
            margin-top: 10px;
            font-size: 1rem;
            color: #4caf50;
        }

        .number {
            cursor: pointer;
        }

        .contact span:hover{
            color: #ff8800;
        }

    </style>
</head>
<body>

    <header>
        <div class="logo">
            <a href="DashBoard.jsp">
                <img src="assets/logo.png" alt="Site Logo" width="100" height="auto">
            </a>
        </div>
        <nav class="nav">
            <a href="DashBoard.jsp">Home</a>
            <a href="#movies">Movies</a>
            <a href="#deals-advertisements">Deals and Advertise</a>
            <a href="ContactUs.jsp">Contacts</a>
            <a href="AboutUs.jsp">About Us</a>
            <div class="dropdown">
                <a href="#" class="support">
                    Support
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="icon">
                        <path fill-rule="evenodd" d="M12.53 16.28a.75.75 0 0 1-1.06 0l-7.5-7.5a.75.75 0 0 1 1.06-1.06L12 14.69l6.97-6.97a.75.75 0 1 1 1.06 1.06l-7.5 7.5Z" clip-rule="evenodd" />
                    </svg>
                </a>
                <div class="dropdown-menu">
                    <a href="#feedback">Feedback</a>
                    <a href="#cancel-booking">Cancel Booking</a>
                </div>
            </div>
        </nav>
        <div class="actions">
            <div class="search-bar">
                <input type="text" id="movie-search" placeholder="Search" autocomplete="off">
                <button class="search-btn">Search</button>
            </div>
            <ul id="suggestions-list"></ul>

            <!-- Dynamic Login/Profile Section -->
            <%
                HttpSession existingSession = request.getSession(false); // Do not create a session if none exists
                String username = null;
                if (existingSession != null) {
                    username = (String) existingSession.getAttribute("username");
                }
            %>
            <% if (username == null) { %>
                <!-- User is not logged in -->
                <a href="LoginPage.jsp">
                    <button class="login-btn">Login</button>
                </a>
            <% } else { %>
                <!-- User is logged in -->
                <div class="dropdown">
                    <button class="profile-btn">
                        <%= username %> <!-- Display username -->
                    </button>
                    <div class="dropdown-menu">
                        <a href="LogoutServlet">Logout</a>
                    </div>
                </div>
            <% } %>
        </div>
    </header>

    <div class="section-container">
        <section>
            <h2>Welcome to ABC Cinema</h2>
            <div class="content">
                <p>At our cinema, we believe in providing an unforgettable movie experience for our customers. With state-of-the-art sound systems, comfortable seating, and a wide variety of snacks, we are committed to delivering the best in entertainment.</p>
            </div>
        </section>

        <section>
            <h2>Our Story</h2>
            <div class="content">
                <p>Founded in 2010, we started with a single screen and a dream to bring the magic of movies closer to everyone. Over the years, we have grown into a multi-screen cinema, showcasing the latest blockbusters and hosting community events.</p>
            </div>
        </section>

        <section>
            <h2>Our Mission and Vision</h2>
            <div class="mission-vision">
                <div>
                    <h3>Mission</h3>
                    <p>To provide a world-class cinematic experience that combines entertainment, comfort, and exceptional service.</p>
                </div>
                <div>
                    <h3>Vision</h3>
                    <p>To be the leading cinema destination, fostering a love for movies and storytelling in our community.</p>
                </div>
            </div>
        </section>

        <section>
            <h2>Contact Us</h2>
            <div class="contact">
                <p>Got questions or feedback? We?d love to hear from you!</p>
                <p>Email: <a href="ContactUs.jsp">info@cinema.com</a></p>
                <span class="number" id="mobile-number">+94 (11) 234 5678</span>
                <p class="tooltip" id="tooltip-message" style="display: none;">Number copied to clipboard!</p>
            </div>
        </section>
    </div>

<footer class="footer">
    <nav class="footer-nav">
        <a href="DashBoard.jsp">Home</a>
        <a href="#movies">Movies</a>
        <a href="#deals-advertisements">Deals and Advertise</a>
        <a href="ContactUs.jsp">Contacts</a>
        <a href="AboutUs.jsp">About Us</a>
        <div class="dropdown">
            <a href="#" class="support">
                Support
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="icon">
                    <path fill-rule="evenodd" d="M12.53 16.28a.75.75 0 0 1-1.06 0l-7.5-7.5a.75.75 0 0 1 1.06-1.06L12 14.69l6.97-6.97a.75.75 0 1 1 1.06 1.06l-7.5 7.5Z" clip-rule="evenodd" />
                </svg>
            </a>
            <div class="dropdown-menu">
                <a href="#feedback">Feedback</a>
                <a href="#cancel-booking">Cancel Booking</a>
            </div>
        </div>
    </nav>
    <hr>
    <div class="footer-top">
        <!-- Logo and Description -->
        <div class="footer-logo">
            <div class="logo-box">
                <a href="index.html">
                    <img src="assets/logo.png" alt="Site Logo" width="100" height="auto" class="logo">
                </a>
            </div>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            </p>
            <p>customercare@cinema.lk</p>
        </div>

        <!-- Useful Links -->
        <div class="footer-useful-links">
            <h4>USEFUL LINKS</h4>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
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
        <p>Copyright © 2024 | Cinema</p>
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

<script>
    const mobileNumber = document.getElementById('mobile-number');
    const tooltipMessage = document.getElementById('tooltip-message');

    mobileNumber.addEventListener('click', () => {
        // Copy the mobile number to clipboard
        const number = mobileNumber.textContent;
        navigator.clipboard.writeText(number).then(() => {
            // Show the tooltip message
            tooltipMessage.style.display = 'block';
            setTimeout(() => {
                tooltipMessage.style.display = 'none';
            }, 1000); 
        }).catch(err => {
            console.error('Failed to copy number: ', err);
        });
    });
    
    function toggleDropdown() {
            const menu = document.getElementById("dropdownMenu");
            menu.style.display = menu.style.display === "block" ? "none" : "block";
        }

        document.getElementById('movie-search').addEventListener('input', function() {
        var query = this.value.trim();
        if (query.length === 0) {
            document.getElementById('suggestions-list').style.display = 'none';
            return;
        }
        fetch('movie-search?query=' + encodeURIComponent(query))
            .then(response => response.text())
            .then(data => {
                var suggestionsList = document.getElementById('suggestions-list');
                suggestionsList.innerHTML = data;
                suggestionsList.style.display = data.trim() !== '' ? 'block' : 'none';
            })
            .catch(error => console.error('Error:', error));
    });

    // Close suggestions when clicking outside
    document.addEventListener('click', function(event) {
        var suggestionsList = document.getElementById('suggestions-list');
        var searchBar = document.querySelector('.search-bar');
        if (!searchBar.contains(event.target)) {
            suggestionsList.style.display = 'none';
        }
    });
</script>

</body>
</html>
