function updateCard (id) {
    let newName = prompt("Introdueix el nou nom per a la carta.");

    if (newName == null || newName === "") {
        alert("El nom no pot estar buit!");
    } else {
        let url = window.location.href;
        url = url.substring(0, url.lastIndexOf("/"));
        window.location.replace(url + "/update.jsp?id="+id+"&name="+newName);
    }
}
