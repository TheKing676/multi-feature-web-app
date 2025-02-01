<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi-Feature Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            padding: 20px;
            transition: background 0.3s, color 0.3s;
        }
        .dark-mode {
            background-color: #222;
            color: #fff;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        button {
            padding: 10px;
            margin: 10px;
            cursor: pointer;
            border: none;
            background: #007bff;
            color: white;
            border-radius: 5px;
        }
        button:hover {
            background: #0056b3;
        }
        input, select {
            padding: 8px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        #todo-list {
            text-align: left;
        }
        .todo-item {
            display: flex;
            justify-content: space-between;
            background: #eee;
            padding: 5px;
            margin: 5px 0;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>📋 Multi-Feature Web App</h2>

        <!-- Real-Time Clock -->
        <h3>⏰ Current Time:</h3>
        <p id="clock">Loading...</p>

        <!-- To-Do List -->
        <h3>📌 To-Do List</h3>
        <input type="text" id="todo-input" placeholder="Add a new task">
        <button onclick="addTodo()">Add</button>
        <ul id="todo-list"></ul>

        <!-- Theme Switcher -->
        <h3>🎨 Theme</h3>
        <button onclick="toggleTheme()">Toggle Dark Mode</button>

        <!-- Calculator -->
        <h3>🧮 Simple Calculator</h3>
        <input type="number" id="num1" placeholder="Enter number 1">
        <input type="number" id="num2" placeholder="Enter number 2">
        <select id="operation">
            <option value="add">➕ Add</option>
            <option value="subtract">➖ Subtract</option>
            <option value="multiply">✖ Multiply</option>
            <option value="divide">➗ Divide</option>
        </select>
        <button onclick="calculate()">Calculate</button>
        <p>Result: <span id="calc-result">-</span></p>
    </div>

    <script>
        // Function to update real-time clock
        function updateClock() {
            let now = new Date();
            document.getElementById("clock").innerText = now.toLocaleTimeString();
        }
        setInterval(updateClock, 1000);
        updateClock();

        // To-Do List Functions
        function addTodo() {
            let input = document.getElementById("todo-input");
            let task = input.value.trim();
            if (task === "") return;
            
            let li = document.createElement("li");
            li.classList.add("todo-item");
            li.innerHTML = `${task} <button onclick="removeTask(this)">❌</button>`;
            document.getElementById("todo-list").appendChild(li);
            input.value = "";
        }

        function removeTask(button) {
            button.parentElement.remove();
        }

        // Theme Switcher
        function toggleTheme() {
            document.body.classList.toggle("dark-mode");
        }

        // Calculator
        function calculate() {
            let num1 = parseFloat(document.getElementById("num1").value);
            let num2 = parseFloat(document.getElementById("num2").value);
            let operation = document.getElementById("operation").value;
            let result = 0;

            if (isNaN(num1) || isNaN(num2)) {
                result = "Invalid Input";
            } else {
                switch (operation) {
                    case "add": result = num1 + num2; break;
                    case "subtract": result = num1 - num2; break;
                    case "multiply": result = num1 * num2; break;
                    case "divide": result = num2 !== 0 ? (num1 / num2).toFixed(2) : "Cannot divide by zero"; break;
                }
            }
            document.getElementById("calc-result").innerText = result;
        }
    </script>

</body>
</html>
