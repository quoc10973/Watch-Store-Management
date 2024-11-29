/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user_watch;

/**
 *
 * @author DELL'
 */
public class watchDTO {

    private String watchId;
    private String description;
    private float price;
    private String watchName;
    private String img;
    private int yearOfProduction;
    private int quantity;
    private boolean notSale;
    private int discount;

    public watchDTO() {
    }

    public watchDTO(String watchId, String description, float price, String watchName, String img, int yearOfProduction, int quantity, boolean notSale, int discount) {
        this.watchId = watchId;
        this.description = description;
        this.price = price;
        this.watchName = watchName;
        this.img = img;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
        this.notSale = notSale;
        this.discount=discount;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getWatchId() {
        return watchId;
    }

    public void setWatchId(String watchId) {
        this.watchId = watchId;
    }

    public String getWatchName() {
        return watchName;
    }

    public void setWatchName(String watchName) {
        this.watchName = watchName;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }




    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }

    public String toString() {
        return getWatchId()+ getDescription() + getPrice() + getWatchName()+ getImg()+ + getYearOfProduction() + getQuantity() + isNotSale() + getDiscount()    ;
    }
}
