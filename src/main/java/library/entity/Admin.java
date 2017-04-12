package library.entity;

import javax.persistence.*;

/**
 * Created by w on 2017/3/13.
 */

@Entity
@Table(name="admin")
public class Admin {

    private String password;
    private int adminid;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="adminid")
    public int getAdminid() {
        return adminid;
    }


    @Column(name="password")
    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    public void setAdminid(int adminid) {this.adminid = adminid;}

    public Admin(){
    }

    @Override
    public boolean equals(Object admin){
        Admin adminNow = null;
        if(admin instanceof Admin) {
            adminNow = (Admin)admin;
            if(adminNow.getPassword().equals(getPassword())){
                return true;
            }
        }
        return false;
    }
}
