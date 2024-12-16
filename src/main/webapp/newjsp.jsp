<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <link rel="stylesheet" href="newcss.css">
    <style>
        body {
            background-color: #282828;
            color: white;
          }

          .feedback-title {
            color: white;
          }

        .feedback-container {
            text-align: center;
            margin: 100px auto;
        }
        
        h1 {
            margin-bottom: 20px;
        }
        
        textarea {
            width: 500px; /* Increased width */
            height: 200px; /* Increased height */
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 auto;
            display: block;
        }
    </style>
</head>
<body>
    <div class="feedback-container">
        <h1>Feedback</h1>
        <form action="submitFeedback" method="POST">
            <textarea name="feedback" placeholder="Write your feedback here..."></textarea>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
