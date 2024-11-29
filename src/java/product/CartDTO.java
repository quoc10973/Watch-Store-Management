/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL'
 */
public class CartDTO {

    private List<ProductDTO> cart;

    public CartDTO() {
        this.cart=new ArrayList<>();
    }

    public CartDTO(List<ProductDTO> cart) {
        this.cart = cart;
    }

    public List<ProductDTO> getCart() {
        return cart;
    }

    public void setCart(List<ProductDTO> cart) {
        this.cart = cart;
    }

    public ProductDTO getProduct(String name) {
        for (ProductDTO i : cart) {
            if (i.getName().equals(name)) {
                return i;
            }   
        } return null;
    }
    
    public int getQuantity(String watchId){
        return getProduct(watchId).getQuantity();
    }
    
    public void addProduct(ProductDTO p){
        if(getProduct(p.getName())!=null){
            ProductDTO n = getProduct(p.getName());
            n.setQuantity(n.getQuantity()+p.getQuantity());
        }else{
            cart.add(p);
        }
    }
    
    public void removeProduct(String watchId){
        if(getProduct(watchId)!=null){
            cart.remove(getProduct(watchId));
        }
    }
    
    public float totalMoney(){
        float t = 0;
        for (ProductDTO i : cart) {
            t+=i.getQuantity()*i.getPrice();
        }
        return t;
    }
    
    public void editQuantity(String productName, int quantity){
        ProductDTO p = getProduct(productName);
        p.setQuantity(quantity);
    }
    
    public static void main(String[] args) {
        CartDTO cart = new CartDTO();
        System.out.println(cart.getCart());
    }
}