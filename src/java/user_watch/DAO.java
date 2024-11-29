/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user_watch;

import invoice.invoiceDTO;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import util.DBContext;
import wishlist.WishList;

/**
 *
 * @author DELL'
 */
public class DAO extends DBContext {

    public List<userDTO> getAllUser() {
        List<userDTO> list = new ArrayList<>();
        String sql = "select * from tbl_User";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                userDTO u = new userDTO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getInt(4));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkLogin(String userID, int password) {
        List<userDTO> list = getAllUser();
        boolean check = false;
        for (userDTO i : list) {
            if (i.getUserId().equals(userID) && i.getPassword() == password) {
                check = true;
            }
        }
        return check;
    }

    public int getUserRole(String userID, int password) {
        int role = -1;
        userDTO u = getUser(userID);
        if (u != null) {
            role = u.getRole();
        }
        return role;
    }

    public userDTO getUser(String userId) {
        String sql = "select * from tbl_User where userId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, userId);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                userDTO u = new userDTO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getInt(4));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void createUser(userDTO u) {
        String sql = "insert into tbl_User values(?,?,?,?)";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, u.getUserId());
            sm.setInt(2, u.getPassword());
            sm.setString(3, u.getFullName());
            sm.setInt(4, u.getRole());
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<watchDTO> getAllWatch() {
        List<watchDTO> list = new ArrayList<>();
        String sql = "select * from tbl_Watch";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                watchDTO m = new watchDTO(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<watchDTO> searchWatchIdName(String search) {
        List<watchDTO> list = getAllWatch();
        List<watchDTO> list2 = new ArrayList<>();
        for (watchDTO i : list) {
            if (i.getWatchName().toLowerCase().contains(search.toLowerCase()) || i.getWatchId().toLowerCase().contains(search.toLowerCase())) {
                list2.add(i);
            }
        }
        return list2;
    }

    public List<userDTO> searchUserByFullName(String search) {
        List<userDTO> list = getAllUser();
        List<userDTO> list2 = new ArrayList<>();
        for (userDTO i : list) {
            if (i.getFullName().toLowerCase().contains(search.toLowerCase())) {
                list2.add(i);
            }
        }
        return list2;
    }

    public void deleteWatch(String watchId) {
        String sql = "delete from tbl_Watch where watchId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, watchId);
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public watchDTO getWatchById(String watchId) {
        String sql = "select * from tbl_Watch where watchId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, watchId);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                watchDTO m = new watchDTO(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9));
                return m;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addNewWatch(watchDTO m) {
        String sql = "insert into tbl_Watch values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, m.getWatchId());
            sm.setString(2, m.getDescription());
            sm.setFloat(3, m.getPrice());
            sm.setString(4, m.getWatchName());
            sm.setString(5, m.getImg());
            sm.setInt(6, m.getYearOfProduction());
            sm.setInt(7, m.getQuantity());
            sm.setBoolean(8, m.isNotSale());
            sm.setInt(9, m.getDiscount());
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateWatch(watchDTO m) {
        String sql = "Update tbl_Watch set price=?,description=?,quantity=?,notSale=? where watchId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setFloat(1, m.getPrice());
            sm.setString(2, m.getDescription());
            sm.setInt(3, m.getQuantity());
            sm.setBoolean(4, m.isNotSale());
            sm.setString(5, m.getWatchId());
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<watchDTO> searchWatchInRange(float min, float max) {
        List<watchDTO> list = getAllWatch();
        List<watchDTO> list2 = new ArrayList<>();
        for (watchDTO i : list) {
            if (i.getPrice() >= min && i.getPrice() <= max) {
                list2.add(i);
            }
        }
        return list2;
    }

    public boolean addItem(WishList w) {
        String sql = "insert into tbl_Wishlist values(?,?,?,?,?,?,?)";
        boolean check = false;
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, w.getuId());
            sm.setString(2, w.getpName());
            sm.setFloat(3, w.getpPrice());
            sm.setString(4, w.getDescription());
            sm.setInt(5, w.getYearOfProduction());
            sm.setString(6, w.getImage());
            sm.setString(7, w.getpId());
            check = sm.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }

    public List<WishList> showWishList(String uId) {
        List<WishList> list = new ArrayList<>();
        String sql = "select * from tbl_Wishlist where uId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, uId);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                WishList w = new WishList(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
                list.add(w);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<WishList> getWishList() {
        List<WishList> list = new ArrayList<>();
        String sql = "select * from tbl_Wishlist";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                WishList w = new WishList(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
                list.add(w);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void removeFromWishlist(String uId, String pName) {
        String sql = "delete from tbl_Wishlist where uId=? and pName=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, uId);
            sm.setString(2, pName);
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void createInvoice(invoiceDTO i) {
        String sql = "insert into tbl_Invoice values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, i.getInvId());
            sm.setString(2, i.getUserId());
            sm.setFloat(3, i.getTotal());
            sm.setString(4, i.getDateBuy());
            sm.setString(5, i.getPhone());
            sm.setString(6, i.getAddress());
            sm.setString(7, i.getCity());
            sm.setBoolean(8, i.isDelivery());
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<invoiceDTO> showInvoice() {
        List<invoiceDTO> list = new ArrayList<>();
        String sql = "select * from tbl_Invoice";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                invoiceDTO i = new invoiceDTO(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<invoiceDTO> getUserInvoice(String userId) {
        List<invoiceDTO> list = new ArrayList<>();
        String sql = "select * from tbl_Invoice where userId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, userId);
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                invoiceDTO i = new invoiceDTO(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public invoiceDTO getInvoiceById(String invId) {
        String sql = "select * from tbl_Invoice where invId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setString(1, invId);
            ResultSet rs = sm.executeQuery();
            if (rs.next()) {
                invoiceDTO i = new invoiceDTO(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changeDiscount(int discountNumb, String watchId) {
        String sql = "update tbl_Watch set discount = ? where watchId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setInt(1, discountNumb);
            sm.setString(2, watchId);
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void deliveryStatus(boolean status, String invId) {
        String sql = "update tbl_Invoice set delivery = ? where invId=?";
        try {
            PreparedStatement sm = connection.prepareStatement(sql);
            sm.setBoolean(1, status);
            sm.setString(2, invId);
            sm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
//        List<watchDTO> list = dao.getAllWatch();
//        List<watchDTO> list2 = dao.searchWatchIdName("");
//        dao.deleteWatch("W033");
//        watchDTO w = dao.getWatchById("W01");
//        boolean a = dao.checkLogin("hoa", 123);
//        userDTO u = dao.getUser("hoa");
////        List<mobileDTO> l = dao.getAllMobile();
////        List<mobileDTO> list2 = dao.searchMobileIdName("5");
////        mobileDTO m = dao.getMobileById("MB9");
////        mobileDTO m1 = new mobileDTO("msa", "asd", 400, "asd", 200, 2, true);
////        dao.addNewMobile(m1);
//        int numb[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
//        String word[] = {"B", "A", "E", "S", "U", "Z", "Y"};
//        Random r = new Random();
//        String invoice = word[r.nextInt(word.length)] + word[r.nextInt(word.length)] + word[r.nextInt(word.length)] + "-" + numb[r.nextInt(numb.length)] + numb[r.nextInt(numb.length)] + numb[r.nextInt(numb.length)];;
//        System.out.println(invoice);
//        LocalDateTime TimeCheckOut = LocalDateTime.now();
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//        String formattedDateTime = TimeCheckOut.format(dtf);
//        invoiceDTO inv = new invoiceDTO(invoice, "cuong", 4000, formattedDateTime, "0838699817", "3/2 to20, khu pho3,bien hoa", "dong nai");
//        dao.createInvoice(inv);
//        watchDTO c = dao.getWatchById("W-test3");
//        List<invoiceDTO> list3 = dao.showInvoice();
//String content = "Đây là nội dung văn bản sẽ được lưu vào file text.";
//
//        // Tên file bạn muốn lưu
//        String fileName = "bill.txt";
//
//        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
//            writer.write(content);
//            System.out.println("Nội dung đã được lưu vào file " + fileName);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        WishList w = new WishList("asd", "asd", 234, "asdas", 234, "asd", "asdasd");
//        System.out.println(dao.addItem(w));
//         List<invoiceDTO> list4 = dao.getUserInvoice("nguyen");
//        System.out.println(list4);
        watchDTO watch = dao.getWatchById("W-test1");

        System.out.println(watch);
        watch.setDiscount(10);
        System.out.println(watch);
    }
}
