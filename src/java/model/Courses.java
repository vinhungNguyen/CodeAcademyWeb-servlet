/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author vinhung
 */
public class Courses {
    
  private int courseId;
    private int categoryId;
    private String title;
    private String description;
    private double price;
    private String imageUrl;
    private LocalDateTime createdAt;

    public Courses(int courseId, int categoryId, String title, String description, double price, String imageUrl, LocalDateTime createdAt) {
        this.courseId = courseId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.createdAt = createdAt;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Courses{" + "courseId=" + courseId + ", categoryId=" + categoryId + ", title=" + title + ", description=" + description + ", price=" + price + ", imageUrl=" + imageUrl + ", createdAt=" + createdAt + '}';
    }
    
    
    
    
    
    
}
