package Model;


import Model.Login;
import Model.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Viral Ghosh
 */
public class DatabaseHelper {
    Connection con;
    public DatabaseHelper() {
        getConnection();
    }

    private void getConnection() {
        try { 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con =DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ViralGhoshDB;user=sa;password=admin");            
        } catch (Exception e) {
            System.out.println(e.getMessage() +" errror");
        }
    }
    public int validateUser(Login l) {
        try {
            PreparedStatement statement = con.prepareStatement("SELECT COUNT(*) FROM loginTbl WHERE username=? AND password=?");
            statement.setString(1, l.username);
            statement.setString(2, l.password);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
        }
        return 0;
    }
    public ArrayList<Customer> getAllCustomers(){
        ArrayList<Customer> list = new ArrayList<>();
        try {
            PreparedStatement statement = con.prepareCall("SELECT l.username, c.name,c.email, c.gender, co.name, c.department, l.id FROM loginTbl as l INNER JOIN customerTbl as c ON l.id = c.login_id INNER JOIN companyTbl as co ON c.company = co.id");
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
            Customer c = new Customer();
            c.username = rs.getString(1);
            c.name = rs.getString(2);
            c.email = rs.getString(3);
            c.gender = rs.getString(4);
            c.company = rs.getString(5);
            c.department = rs.getString(6);
            c.loginid = rs.getInt(7);
            list.add(c);
            }
            return list;
        } catch (Exception e) {
            return list;
        }
    }
    public int insertRecord(Customer c){
        try {
            PreparedStatement statement = con.prepareStatement("INSERT INTO loginTbl VALUES(?,?)");
            statement.setString(1, c.username);
            statement.setString(2, c.password);
            statement.executeUpdate();
            statement= con.prepareStatement("SELECT id FROM loginTbl WHERE username=? AND password=?");
            statement.setString(1, c.username);
            statement.setString(2, c.password);
            ResultSet rs = statement.executeQuery();
            rs.next();
            c.setLoginid(rs.getInt(1));
            statement = con.prepareStatement("INSERT INTO customerTbl VALUES(?,?,?,?,?,?)");
            statement.setString(1, c.getName());
            statement.setString(2, c.getEmail());
            statement.setString(3, c.getGender());
            statement.setString(4, c.getCompany());
            statement.setString(5, c.getDepartment());
            statement.setInt(6, c.getLoginid());
            return statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public Customer getRecord(int id){
        Customer c= new Customer();
        c.setName("Error");
        try {
            CallableStatement statement = con.prepareCall("{call stpGetCustomerDetailsByLoginId(?,?,?,?,?,?,?,?)}");
            statement.setInt(1, id);
            statement.registerOutParameter(2, java.sql.Types.VARCHAR);
            statement.registerOutParameter(3, java.sql.Types.VARCHAR);
            statement.registerOutParameter(4, java.sql.Types.VARCHAR);
            statement.registerOutParameter(5, java.sql.Types.VARCHAR);
            statement.registerOutParameter(6, java.sql.Types.VARCHAR);
            statement.registerOutParameter(7, java.sql.Types.VARCHAR);
            statement.registerOutParameter(8, java.sql.Types.VARCHAR);
            statement.executeUpdate();    
            c.username = statement.getString(2);
            c.password=statement.getString(3);
            c.name=statement.getString(4);
            c.email=statement.getString(5);
            c.gender=statement.getString(6);
            c.company=statement.getString(7);
            c.department=statement.getString(8);
            return c;
        } catch (Exception e) {
        }
        return c;
    }
    public int updateRecord(Customer c){
        try {
            PreparedStatement statement = con.prepareStatement("UPDATE customerTbl SET name=?,email=?,gender=?,company=?,department=? WHERE login_id=?");
            statement.setString(1, c.name);
            statement.setString(2, c.email);
            statement.setString(3, c.gender);
            statement.setString(4, c.company);
            statement.setString(5, c.department);
            statement.setInt(6, c.loginid);
            return statement.executeUpdate();
            } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
       
    }
    public String getRecordJson(int id){
        try {
            CallableStatement statement = con.prepareCall("{call stpGetCustomerDetailsByLoginIdJson(?,?)}");
            statement.setInt(1, id);
            statement.registerOutParameter(2, java.sql.Types.VARCHAR);
            statement.executeUpdate();    
            return  statement.getString(2);
        } catch (Exception e) {
             return "NA";
        }
    }
    public int deleteRecord(int id){
        try {
            PreparedStatement statement= con.prepareStatement("DELETE FROM loginTbl WHERE id=?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement= con.prepareStatement("DELETE FROM customerTbl WHERE login_id=?");
            statement.setInt(1, id);
            return statement.executeUpdate();
        } catch (Exception e) {
            return 0;
        }
    }
        
}
