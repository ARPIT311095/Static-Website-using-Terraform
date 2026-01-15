document.getElementById('myButton').addEventListener('click', function() {
    var messageElement = document.getElementById('message');
    if (messageElement.textContent === "Button dabaiye aur dekhiye kya hota hai!") {
        messageElement.textContent = "🥳 Bahut Khoob! Aapne JavaScript chalaya!";
    } else {
        messageElement.textContent = "Button dabaiye aur dekhiye kya hota hai!";
    }
});