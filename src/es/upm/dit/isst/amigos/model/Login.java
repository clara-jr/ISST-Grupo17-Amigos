package es.upm.dit.isst.amigos.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Login implements Serializable {

	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String user;
	private String contrase�a;
	
	public Login(String user, String contrase�a){
		this.user = user;
		this.contrase�a = contrase�a;
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	
	public String getContrase�a() {
		return contrase�a;
	}
	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
	}
}
