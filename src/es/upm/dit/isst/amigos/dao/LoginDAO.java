package es.upm.dit.isst.amigos.dao;

import es.upm.dit.isst.amigos.model.Login;

public interface LoginDAO {
	
	public Login insertLogin(String usuario, String contrase�a);
	
	public Login getLoginByUser(String user);
}
