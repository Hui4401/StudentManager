package vo;


public class Teacher {

    private String id;
    private String password;
    private String email;
    private String name;
    private String sex;

    public String getId(){
        return id;
    }

    public String getPassword(){
        return password;
    }

    public String getEmail(){
        return email;
    }

    public String getName(){
        return name;
    }

    public String getSex(){
        return sex;
    }

    public void setId(String id){
        this.id = id;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public void setEmail(String email){
        this.email= email;
    }

    public void setName(String name){
        this.name = name;
    }

    public void setSex(String sex){
        this.sex = sex;
    }

}
