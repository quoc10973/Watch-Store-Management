/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invoice;

import java.sql.Date;

/**
 *
 * @author DELL'
 */
public class invoiceDTO {

    private String invId;
    private String userId;
    private float total;
    private String dateBuy;
    private String phone;
    private String address;
    private String city;
    private boolean delivery;


    public invoiceDTO() {
    }

    public invoiceDTO(String invId, String userId, float total, String dateBuy, String phone, String address, String city, boolean delivery) {
        this.invId = invId;
        this.userId = userId;
        this.total = total;
        this.dateBuy = dateBuy;
        this.phone=phone;
        this.address=address;
        this.city=city;
        this.delivery=delivery;
    }

    public String getInvId() {
        return invId;
    }

    public void setInvId(String invId) {
        this.invId = invId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getDateBuy() {
        return dateBuy;
    }

    public void setDateBuy(String dateBuy) {
        this.dateBuy = dateBuy;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public boolean isDelivery() {
        return delivery;
    }

    public void setDelivery(boolean delivery) {
        this.delivery = delivery;
    }
    
    public String toString(){
        return getInvId()+getUserId()+getTotal()+getDateBuy()+getPhone()+getAddress()+getCity();
    }

}
