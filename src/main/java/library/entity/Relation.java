package library.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by w on 2017/3/14.
 */
@Entity
@Table(name="relation")
public class Relation {

     private int adminid;
     private int bookid;
     private Date lendtime;
     private Date returntime;
     private int readerid;
     private String fine;


     @Id
     @GeneratedValue(strategy= GenerationType.AUTO)
     @Column(name="adminid")
     public int getAdminid() {return adminid;}
     public void setAdminid(int adminid) {
          this.adminid = adminid;
     }
     @Column(name="bookid")
     public int getBookid() {
          return bookid;
     }
     public void setBookid(int bookid) {
          this.bookid = bookid;
     }

     @Column(name="lendtime")
     public Date getLendtime() {return lendtime;}
     public void setLendtime(Date lendtime) {
          this.lendtime = lendtime;
     }

     @Column(name="readerid")
     public int getReaderid() {
          return readerid;
     }
     public void setReaderid(int readerid) {
          this.readerid = readerid;
     }

     @Column(name="returntime")
     public Date getReturntime() {
          return returntime;
     }
     public void setReturntime(Date returntime) {
          this.returntime = returntime;
     }

     @Column(name="fine")
     public String getFine() {return fine;}
     public void setFine(String fine) {this.fine = fine;}
     public Relation(){}
     public Relation(int adminid,int bookid,int readerid,Date lendtime,Date returntime ,String fine) {
     this.adminid=adminid;this.bookid=bookid;this.readerid=readerid;this.lendtime=lendtime;this.returntime=returntime;this.fine=fine;
     }
}
