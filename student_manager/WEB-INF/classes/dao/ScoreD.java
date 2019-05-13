package dao;

import vo.Score;
import vo.Student;

import java.sql.*;
import java.util.ArrayList;

public class ScoreD {

    private Connection conn = null;

    public boolean insertScore(String id) throws Exception{
        initConnection();
        String sql = "insert into score(id) values(?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        int i = ps.executeUpdate();
        closeConnection();
        return i == 1;
    }

    public boolean deleteScore(String id) throws Exception{
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "delete from score where id='"+id+"'";
        int i = stat.executeUpdate(sql);
        closeConnection();
        return i==1;
    }

    public void updateScoreInfo(String id, String database, String android, String jsp) throws Exception{

        initConnection();
        String sql = "update score set dat=?, android=?, jsp=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, database);
        ps.setString(2, android);
        ps.setString(3, jsp);
        ps.setString(4, id);
        ps.executeUpdate();
        closeConnection();
    }

    public Score findWithId(String id) throws Exception{
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "select * from score where id = '" + id + "'";
        ResultSet rs = stat.executeQuery(sql);
        Score stu = getScore(rs);
        closeConnection();
        return stu;
    }

    public ArrayList<Score> getOnePage(int page, int size) throws Exception{
        ArrayList<Score> al = new ArrayList<>();
        initConnection();
        String sql = "SELECT * FROM score limit ?, ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, (page-1)*size);
        ps.setInt(2, size);
        ResultSet rs =  ps.executeQuery();
        getMoreScore(al, rs);
        closeConnection();
        return al;
    }

    public int getScoreCount() throws Exception{
        initConnection();
        String sql = "select count(*) from score";
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        rs.next();
        int count = rs.getInt(1);
        closeConnection();
        return count;
    }

    private Score getScore(ResultSet rs) throws SQLException {
        Score stu = null;
        if (rs.next()){
            stu = new Score();
            stu.setId(rs.getString("id"));
            stu.setDatabase(rs.getString("dat"));
            stu.setAndroid(rs.getString("android"));
            stu.setJsp(rs.getString("jsp"));
        }
        return stu;
    }

    private void getMoreScore(ArrayList<Score> al, ResultSet rs) throws SQLException {
        while (rs.next()){
            Score score = new Score();
            score.setId(rs.getString("id"));
            score.setDatabase(rs.getString("dat"));
            score.setAndroid(rs.getString("android"));
            score.setJsp(rs.getString("jsp"));
            al.add(score);
        }
    }

    private void initConnection() throws Exception {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/student_manager", "root", "111");
    }

    private void closeConnection() throws Exception{
        conn.close();
    }
}
