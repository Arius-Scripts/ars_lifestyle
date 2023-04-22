const pMenu = document.querySelector(".container")

const playerGender = document.querySelector("#gender")
const playerJob = document.querySelector("#job")
const playerDob = document.querySelector("#dob")

const playerCash = document.querySelector("#cash")
const playerBank = document.querySelector("#bank")
const playerTotal = document.querySelector("#total-money")

const playerName = document.querySelector("#playerName")
const playerId = document.querySelector("#player-id")

const confermBox = document.querySelector("#conferm-container")

window.addEventListener('message', (event) => {
    if (event.data.action === 'open') {
        playerGender.innerText  = event.data.gender
        playerJob.innerText  = event.data.job
        playerDob.innerText  = event.data.dob

        playerCash.innerText  = `$ ${event.data.cash}`
        playerBank.innerText  = `$ ${event.data.bank}`
        playerTotal.innerText  = `$ ${event.data.total}`

        playerName.innerText = event.data.name
        playerId.innerText = `ID: ${event.data.id}`
        
        pMenu.style.display = "block"
    } else if (event.data.action === 'close') {
        pMenu.style.display = "none"
    }
});


function post(path) {
    fetch(path, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then(resp => resp.json());
}

function openMap() {
    post(`https://ars_pausemenu/openMap`)
}

function openSettings() {
    post(`https://ars_pausemenu/openSettings`)
}

function disconnect() {
    post(`https://ars_pausemenu/disconnect`)
}

function cancelDisconnect() {
    post(`https://ars_pausemenu/close`)
    confermBox.style.display = "none"
}
function openConfermBox() {
    pMenu.style.display = "none"
    confermBox.style.display = "flex"
}

document.onkeydown = function(evt) {
    evt = evt || window.event;
    var isEscape = false;
    if ("key" in evt) {
        isEscape = (evt.key === "Escape" || evt.key === "Esc");
    } else {
        isEscape = (evt.keyCode === 27);
    }
    if (isEscape) {
        post(`https://ars_pausemenu/close`)
        confermBox.style.display = "none"
    }
};