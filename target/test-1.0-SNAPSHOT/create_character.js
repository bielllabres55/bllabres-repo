window.onload = () => {
    let raceSelect = document.querySelector("select[name='race']");
    let races = ["Elf", "Nans", "Gnom", "Mitjans", "SemiOrc", "Humans"];
    races.forEach((race, index) => {
        let opt = document.createElement("option");
        opt.setAttribute("value", index.toString());
        opt.innerHTML = race;

        raceSelect.appendChild(opt);
    });

    raceSelect.addEventListener("");
}