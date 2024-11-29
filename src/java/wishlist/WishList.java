/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wishlist;

/**
 *
 * @author DELL'
 */
public class WishList {

    private String uId;
    private String pName;
    private float pPrice;
    private String description;
    private int yearOfProduction;
    private String image;
    private String pId;
    
    public WishList() {
    }

    public WishList(String uId, String pName, float pPrice, String description, int yearOfProduction, String image,String pId) {
        this.uId = uId;
        this.pName = pName;
        this.pPrice = pPrice;
        this.description = description;
        this.yearOfProduction = yearOfProduction;
        this.image = image;
        this.pId = pId;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public float getpPrice() {
        return pPrice;
    }

    public void setpPrice(float pPrice) {
        this.pPrice = pPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    

}  