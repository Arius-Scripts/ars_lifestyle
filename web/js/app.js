const container = document.querySelector("#container")


window.addEventListener('message', (event) => {
    if (event.data.action == "open") {
        container.style.display = "block"
    } else if (event.data.action == "close") {
        container.style.display = "none"

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


function selectCivil() {
    post(`https://ars_lifestyle/civil`)
}
function selectGangster() {
    post(`https://ars_lifestyle/gangster`)
}
function selectBusiness() {
    post(`https://ars_lifestyle/business`)
}