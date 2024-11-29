/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author DELL'
 */
public class ProductDTO {

    private String pId;
    private String name;
    private float price;
    private int quantity;
    private String pImage;
    private String pDescription;
    private int discount;

    public ProductDTO() {
    }

    public ProductDTO(String pId, String name, float price, int quantity, String pImage, String pDescription, int discount) {
        this.pId = pId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.pImage = pImage;
        this.pDescription = pDescription;
        this.discount = discount;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String toString() {
        return getName() + getPrice() + getQuantity();
    }
}
