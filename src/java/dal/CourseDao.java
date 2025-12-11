/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Courses;
import java.sql.*;
import java.time.LocalDateTime;

/**
 *
 * @author vinhung
 */
public class CourseDao extends DBContext {

    private final String QUERY_GET_COURSES_SQL = "select * from Courses";
    private final String GET_NUM_OF_COURSE_SQL = "select Count(*) from Courses";
    private final String GET_LIST_COURSE_BY_PAGE = "select * from Courses order by CourseID\n"
            + "		offset ? rows fetch next ? rows only";

    public List<Courses> getAllCourses() {
        List<Courses> res = new ArrayList<>();
        try {
            PreparedStatement stm = c.prepareStatement(QUERY_GET_COURSES_SQL);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Courses course = new Courses(rs.getInt("CourseID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getString("ImageURL"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime());
                res.add(course);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public int getNumOfCourse() {
        try {
            PreparedStatement stm = c.prepareStatement(GET_NUM_OF_COURSE_SQL);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Courses> getListCourseByPage(int index, int numOfCoursePage) {
        List<Courses> res = new ArrayList<>();
        try {
            PreparedStatement stm = c.prepareStatement(GET_LIST_COURSE_BY_PAGE);
            stm.setInt(1, (index - 1) * numOfCoursePage);
            stm.setInt(2, numOfCoursePage);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Courses course = new Courses(rs.getInt("CourseID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getString("ImageURL"),
                        rs.getTimestamp("CreatedAt").toLocalDateTime());
                res.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public static void main(String[] args) {
        CourseDao dao = new CourseDao();

        for (Courses c : dao.getListCourseByPage(1, 6)) {
            System.out.println(c);
        }
//        System.out.println(dao.getNumOfCourse());
    }
}
