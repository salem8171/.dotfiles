// Disable autoplay
setInterval(() => {
    const button = document.querySelector("[aria-label=\"Autoplay is on\"]");
    if (button) button.click();
}, 5000);
