/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vinhung
 */
public class Categories {
    
    private int categoryId;
    private String catName;

    public Categories(int categoryId, String catName) {
        this.categoryId = categoryId;
        this.catName = catName;
    }

    public Categories(String catName) {
        this.catName = catName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    @Override
    public String toString() {
        return "Categories{" + "categoryId=" + categoryId + ", catName=" + catName + '}';
    }
    
    
    
}
