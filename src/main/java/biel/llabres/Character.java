package biel.llabres;

public class Character {
    int id;
    String name;

    // Raza
    String race;
    int raceId;

    // Atributos Base
    int modStr;
    int modDex;
    int modCon;
    int modIntel;
    int modSab;
    int modCar;

    // Modificadores de atributos
    int str;
    int dex;
    int con;
    int intel;
    int sab;
    int car;

    // Puntos de salud y magia
    int pv;
    int pm;

    public Character() {
        this.name = "";
    }

    // Generar los atributos de forma aleatoria
    private void genAttributes() {
        switch (this.raceId) {
            case 0:
                this.modDex = 2;
                this.modCon = -2;
                this.modIntel = 2;
                break;
            case 1:
                this.modCon = 2;
                this.modCar = -2;
                this.modSab = 2;
                break;
            case 2:
                this.modCon = 2;
                this.modStr = -2;
                this.modCar = 2;
                break;
            case 3:
                this.modDex = 2;
                this.modStr = -2;
                break;
            case 4:
                this.modStr = 2;
                this.modIntel = -2;
                this.modCar = -2;
                break;
        }

        this.pv = this.calcPV();
        this.pm = this.calcPM();
    }

    public int calcPV() {
        return (this.con + this.modCon) * this.throwDice(8);
    }

    public int calcPM() {
        int pm = (int) Math.floor(((double) this.intel + this.modIntel + this.sab + this.modSab) / 2);
        pm *= this.throwDice(4);
        return pm;
    }

    // Lanzar un dado de n caras
    public int throwDice(int faces) {
        return (int) (Math.random() * faces + 1);
    }

    public String toHTML() {
        return "<div class='card'>" +
                "<div class='header'>" +
                "<p class='name'>" + this.name + "</p>" +
                "<a href='delete.jsp?id=" + this.id + "'><i class='bi bi-trash'></i></a>" +
                "<a href='#' onclick='updateCard(" + this.id + ")'><i class='bi bi-pencil-square'></i></a>" +
                "</div>" +
                "<div class='img-container'><img alt='' src='img/" + this.raceId + ".png' /></div>" +
                "<p>PV: " + this.pv + "</p>" +
                "<p>PM: " + this.pm + "</p>" +
                "<div class='character-stats'>" +
                "<p>FUE: " + this.getFinalStr() + "</p>" +
                "<p>INT: " + this.getFinalInt() + "</p>" +
                "<p>DES: " + this.getFinalDex() + "</p>" +
                "<p>SAB: " + this.getFinalSab() + "</p>" +
                "<p>CON: " + this.getFinalCon() + "</p>" +
                "<p>CAR: " + this.getFinalCar() + "</p>" +
                "</div></div>";
    }

    public int getFinalStr() {
        return this.str + this.modStr;
    }

    public int getFinalDex() {
        return this.dex + this.modDex;
    }

    public int getFinalCon() {
        return this.con + this.modCon;
    }

    public int getFinalInt() {
        return this.intel + this.modIntel;
    }

    public int getFinalSab() {
        return this.sab + this.modSab;
    }

    public int getFinalCar() {
        return this.car + this.modCar;
    }

    // GETTERS
    public String getRace() {
        return race;
    }

    public int getRaceId() {
        return raceId;
    }

    public int getStr() {
        return str;
    }

    public int getDex() {
        return dex;
    }

    public int getCon() {
        return con;
    }

    public int getIntel() {
        return intel;
    }

    public int getSab() {
        return sab;
    }

    public int getCar() {
        return car;
    }

    public int getPv() {
        return pv;
    }

    public int getPm() {
        return pm;
    }

    public int getModStr() {
        return modStr;
    }

    public int getModDex() {
        return modDex;
    }

    public int getModCon() {
        return modCon;
    }

    public int getModIntel() {
        return modIntel;
    }

    public int getModSab() {
        return modSab;
    }

    public int getModCar() {
        return modCar;
    }

    public int getId() {
        return id;
    }

    // SETTERS
    public void setName(String name) {
        this.name = name;
    }

    public void setRace(int race) {
        this.raceId = race;
        String[] raceName = {"Elf", "Nans", "Gnom", "Mitjans", "SemiOrc", "Humans"};
        this.race = raceName[this.raceId];
        this.genAttributes();
    }

    public void setModStr(int modStr) {
        this.modStr = modStr;
    }

    public void setModDex(int modDex) {
        this.modDex = modDex;
    }

    public void setModCon(int modCon) {
        this.modCon = modCon;
    }

    public void setModIntel(int modIntel) {
        this.modIntel = modIntel;
    }

    public void setModSab(int modSab) {
        this.modSab = modSab;
    }

    public void setModCar(int modCar) {
        this.modCar = modCar;
    }

    public void setStr(int str) {
        this.str = str;
    }

    public void setDex(int dex) {
        this.dex = dex;
    }

    public void setCon(int con) {
        this.con = con;
    }

    public void setIntel(int intel) {
        this.intel = intel;
    }

    public void setSab(int sab) {
        this.sab = sab;
    }

    public void setCar(int car) {
        this.car = car;
    }

    public void setPv(int pv) {
        this.pv = pv;
    }

    public void setPm(int pm) {
        this.pm = pm;
    }

    public void setId(int id) {
        this.id = id;
    }
}