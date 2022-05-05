function arrayEquals (a, b) {
    return a.every((v, i) => v === b[i]);
}

function throwDice(numFaces) {
    return Math.round(Math.random() * numFaces) + 1;
}

function throwAttributeDice() {
    let values = [];
    for (let i = 0; i < 4; i++) values.push(throwDice(6));
    values.sort(function (a, b) {
        return b - a;
    })
    values.pop();

    let total = values.reduce(
        (previousValue, currentValue) => previousValue + currentValue,
        0
    );
    return total;
}

function valuesToString (values) {
    let valuesString = "";
    values.forEach((value) => {
        valuesString += " " + value + ",";
    })
    valuesString = valuesString.slice(0, -1);
    return valuesString;
}

function setSelectValues(values) {
    document.querySelectorAll("select.attr").forEach((select) => {
        setIndividualSelectValues(select, values);
    });
}

function setIndividualSelectValues(select, values) {
    select.innerHTML = "";
    let emptyOption = document.createElement("option");
    emptyOption.setAttribute("selected", "true");
    emptyOption.setAttribute("disabled", "true");
    emptyOption.setAttribute("hidden", "true");
    select.appendChild(emptyOption);

    values.forEach((value) => {
        let aux = document.createElement("option");
        aux.setAttribute("value", value);
        aux.innerHTML = value;
        select.appendChild(aux);
    })
}

window.onload = () => {
    const updateTable = () => {
        let pvHR = document.getElementById("pv");
        let pvInput = document.getElementById("pvInput");
        let pmHR = document.getElementById("pm");
        let pmInput = document.getElementById("pmInput");

        this.raceId = raceSelect.value;
        playerStats.forEach((stat) => {
            stat[1] = 0;
        })
        switch (parseInt(this.raceId)) {
            case 0:
                playerStats[stats.indexOf("dex")][1] = 2;
                playerStats[stats.indexOf("con")][1] = -2;
                playerStats[stats.indexOf("int")][1] = 2;
                break;
            case 1:
                playerStats[stats.indexOf("con")][1] = 2;
                playerStats[stats.indexOf("car")][1] = -2;
                playerStats[stats.indexOf("sab")][1] = 2;
                break;
            case 2:
                playerStats[stats.indexOf("con")][1] = 2;
                playerStats[stats.indexOf("str")][1] = -2;
                playerStats[stats.indexOf("car")][1] = 2;
                break;
            case 3:
                playerStats[stats.indexOf("dex")][1] = 2;
                playerStats[stats.indexOf("str")][1] = -2;
                break;
            case 4:
                playerStats[stats.indexOf("str")][1] = 2;
                playerStats[stats.indexOf("int")][1] = -2;
                playerStats[stats.indexOf("car")][1] = -2;
                break;
        }

        let img = document.querySelector("#race-img");
        img.src = img.src.replace(/[0-5].png/, this.raceId + ".png");
        document.querySelector("#character caption").innerHTML = races[this.raceId];

        document.querySelectorAll("select.attr").forEach((input, index) => {
            if (input.value !== "" && input.value !== null) {
                playerStats[index][0] = input.value;
            } else {
                playerStats[index][0] = 0;
            }
        });

        document.querySelectorAll(".stat").forEach((stat, index) => {
            stat.querySelector("td:nth-child(2)").innerHTML = playerStats[index][0];
            stat.querySelector("td:nth-child(3)").innerHTML = playerStats[index][1];
            stat.querySelector("td:nth-child(4)").innerHTML = (parseInt(playerStats[index][0]) + parseInt(playerStats[index][1])).toString();
        });

        let pv = (parseInt(playerStats[stats.indexOf("con")][0]) + parseInt(playerStats[stats.indexOf("con")][1])) * throwDice(8);
        pv = pv < 0 ? 0 : pv;
        pvInput.value = pv;
        pvHR.parentElement.parentElement.childNodes[1].innerHTML = "P.V ("+ pv +")";
        pvHR.style.width = (pv * 3) + "px";

        let pm = parseInt(playerStats[stats.indexOf("int")][0]) + parseInt(playerStats[stats.indexOf("int")][1]);
        pm += parseInt(playerStats[stats.indexOf("sab")][0]) + parseInt(playerStats[stats.indexOf("sab")][1]);
        pm = Math.floor(pm / 2);
        pm *= throwDice(4);
        pm = pm < 0 ? 0 : pm;
        pmInput.value = pm;
        pmHR.parentElement.parentElement.childNodes[1].innerHTML = "P.M ("+ pm +")";;
        pmHR.style.width = (pm * 3) + "px";
    }

    let stats = ["str", "dex", "con", "int", "sab", "car"];
    let playerStats = [];
    for(let i = 0; i < stats.length; i++) {
        playerStats[i] = [0, 0];
    };

    let raceSelect = document.querySelector("select[name='race']");
    let races = ["Elf", "Nans", "Gnom", "Mitjans", "SemiOrc", "Humans"];

    races.forEach((race, index) => {
        let opt = document.createElement("option");
        opt.setAttribute("value", index.toString());
        opt.innerHTML = race;
        raceSelect.appendChild(opt);
    });

    raceSelect.addEventListener("change", updateTable);

    document.querySelectorAll("select.attr").forEach((input) => {
        input.addEventListener("input", function() {
            updateTable();
        });
    })

    updateTable();

    let values = []
    for (let i = 0; i < 6; i++) values.push(throwAttributeDice());

    let valorsP = document.querySelector("p.values");
    valorsP.innerHTML = "Valors generats:" + valuesToString(values);
    setSelectValues(values);

    let selected = [];
    document.querySelectorAll("select.attr").forEach((select) => {
        select.addEventListener("change", (e) => {
            selected = [];
            document.querySelectorAll("select.attr").forEach((select) => {
                if (select.value !== "") selected.push(parseInt(select.value));
            });

            if (selected.length === 6) {
                let aux = values.sort((a,b) => {return b - a});
                selected = selected.sort((a,b) => {return b - a});

                if (arrayEquals(aux, selected)) {
                    document.querySelector("button[type='submit']").removeAttribute("disabled");
                } else {
                    document.querySelector("button[type='submit']").setAttribute("disabled", "true");
                }
            } else {
                document.querySelector("button[type='submit']").setAttribute("disabled", "true");
            }
        })
    });
}