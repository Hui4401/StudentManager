package vo;

public class Score {

    private String id;
    private String database;
    private String android;
    private String jsp;

    public String getId(){
        return id;
    }

    public String getDatabase(){
        return database;
    }

    public String getAndroid(){
        return android;
    }

    public String getJsp(){
        return jsp;
    }

    public void setId(String id){
        this.id = id;
    }

    public void setDatabase(String database){
        this.database = database;
    }

    public void setAndroid(String android){
        this.android = android;
    }

    public void setJsp(String jsp){
        this.jsp = jsp;
    }
}
