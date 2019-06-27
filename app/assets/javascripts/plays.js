document.addEventListener("DOMContentLoaded", function() {
  var CsrfToken = document.head.querySelector("[name=csrf-token]").content;
  var playsTable = document.getElementById("plays-table");
  var currentTimerNode = document.getElementById("current-timer");
  var currentImageNode = document.getElementById("current-image");
  var saveImageBtn = document.getElementById("save-image");

  if (!currentImageNode) return false;

  var timer = setInterval(decrementTimer, 1000);
  var dataTableNode = document.getElementById("timer-container");
  var imageUrls = JSON.parse(dataTableNode.getAttribute("data-image-urls"))
  var currentIndex = 0;

  saveImageBtn.onclick = function() {
    savePlay();
  };

  function decrementTimer() {
    var tick = parseInt(currentTimerNode.innerHTML, 10);
    var nextTick = tick === 1 ? 10 : tick - 1;
    var lastIndex = imageUrls.length - 1;
    currentTimerNode.innerHTML = nextTick;
    currentIndex = currentIndex === lastIndex ? 0 : currentIndex + 1;
    currentImageNode.src = imageUrls[currentIndex];
  }

  function savePlay() {
    var currentTimer = currentTimerNode.innerHTML;
    var currentUrl = currentImageNode.src;
    xhr = new XMLHttpRequest();
    xhr.open("POST", "/plays");
    xhr.setRequestHeader("X-CSRF-Token", CsrfToken);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({ timer: currentTimer, url: currentUrl }));
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          var tr = document.createElement("tr");
          var timerTd = document.createElement("td");
          timerTd.innerHTML = currentTimer;
          var imageTd = document.createElement("td");
          var img = document.createElement("img");
          img.height = "200";
          img.src = currentUrl;
          imageTd.appendChild(img);
          tr.appendChild(timerTd);
          tr.appendChild(imageTd);
          playsTable.appendChild(tr);
        } else {
          console.error("Error: ", xhr.status, xhr.statusText);
        }
      }
    };
  }
});
