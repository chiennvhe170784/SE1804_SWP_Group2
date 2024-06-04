/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 *
 * @author djxjs
 */
public class Order {
    private int oid;
    public String orderDate;
    private int totalPrice;
    private String address;
    private String status;
    private int cartid;

    public Order() {
   }

    public Order(int oid, String orderDate, int totalPrice, String address, String status, int cartid) {
        this.oid = oid;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.address = address;
        this.status = status;
        this.cartid = cartid;
    }

  
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
  

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    
    
    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



  

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    

  

    
}
