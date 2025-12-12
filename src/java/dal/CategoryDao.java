/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Categories;
import java.sql.*;

/**
 *
 * @author vinhung
 */
public class CategoryDao extends DBContext {

    private final String GET_CATEGORIES_SQL = "select * from Categories";

    public List<Categories> getListCategory() {
        List<Categories> res = new ArrayList<>();
        try {
            PreparedStatement stm = c.prepareStatement(GET_CATEGORIES_SQL);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Categories cat = new Categories(rs.getInt("CategoryID"), rs.getString("CategoryName"));
                res.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
       
        for (Categories c :  dao.getListCategory()) {
            System.out.println(c);
        }
    }
}
