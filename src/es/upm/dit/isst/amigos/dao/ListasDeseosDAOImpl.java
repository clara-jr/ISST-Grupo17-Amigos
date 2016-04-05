package es.upm.dit.isst.amigos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import es.upm.dit.isst.amigos.model.ListasDeseos;
import es.upm.dit.isst.amigos.model.Login;


public class ListasDeseosDAOImpl implements ListasDeseosDAO {

	private static ListasDeseosDAOImpl instance;
	
	private ListasDeseosDAOImpl(){
		
	}
	
	public static ListasDeseosDAOImpl getInstance(){
		if (instance == null)
			instance = new ListasDeseosDAOImpl();
		return instance;
	}
	
	
	@Override
	public ListasDeseos insertLista(String user, String item) {
		EntityManager em = EMFService.get().createEntityManager();
		ListasDeseos listaObject = new ListasDeseos(user, item);
		em.persist(listaObject);
		
		em.close();
		
		return listaObject;
	}

	@Override
	public List<ListasDeseos> getListaByUser(String user) {
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("SELECT m FROM ListasDeseos m WHERE m.user = :user");
		q.setParameter("user", user);
		List<ListasDeseos> logueo = q.getResultList();
		em.close();
		return logueo;
	}

	@Override
	public void removeLista(ListasDeseos lista) {
		EntityManager em = EMFService.get().createEntityManager();
		em.remove(lista);
		em.close();
	}

}
