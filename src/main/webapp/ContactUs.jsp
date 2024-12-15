<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - ABC Cinema</title>
    <link rel="stylesheet" href="DashBoard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #282828;
            color: #333;
        }

        header {
            position: relative; /* Allows the header to overlap the hero section */
            top: 0;
            left: 0;
            width: 100%; /* Ensures the header spans the full width */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px; /* Adjust spacing */
            background-color: transparent; /* Transparent black background */
            color: white; /* Text color */
            z-index: 10; 
        }     

        header h1 {
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #111;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
        }

        form input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #333;
            border-radius: 5px;
            font-size: 1rem;
        }
        
        input:focus, textarea:focus {
            border-color: #ff8800;
            outline: none; /* Remove the default outline for a cleaner look */
        }
        
        input:active {
            border: 1px solid #ff8800;
        }
        
        form button {
            padding: 10px 15px;
            background-color: #ffffff;
            color: #ff8800;
            border: 1px solid #ff8800;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ff8800;
            color: #ffffff;
        }

        

        .message {
            text-align: center;
            font-size: 1rem;
            color: #4caf50;
            margin-top: 20px;
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

<div class="container">
    <h2>We'd love to hear from you!</h2>
    <form action="sendEmail.php" method="POST">
        <label for="name">Your Name</label>
        <input type="text" id="name" name="name" placeholder="Enter your name" required>

        <label for="email">Your Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label for="subject">Subject</label>
        <input type="text" id="subject" name="subject" placeholder="Subject" required>

        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" placeholder="Write your message here" required></textarea>

        <button type="submit">Send Message</button>
    </form>
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
