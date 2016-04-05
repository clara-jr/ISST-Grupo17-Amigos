package es.upm.dit.isst.amigos.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import es.upm.dit.isst.amigos.model.Grupo;
import es.upm.dit.isst.amigos.model.ListasDeseos;

public class GrupoDAOImpl implements GrupoDAO {

	private static GrupoDAOImpl instance;
	
	private GrupoDAOImpl(){
		
	}
	
	public static GrupoDAOImpl getInstance(){
		if (instance == null)
			instance = new GrupoDAOImpl();
		return instance;
	}
	
	@Override
	public Grupo insertGrupo(String moderador, String preciomax, String fecha) {
		EntityManager em = EMFService.get().createEntityManager();
		Grupo grupoObject = new Grupo(moderador, preciomax, fecha);
		em.persist(grupoObject);
		
		em.close();
		
		return grupoObject;
	}

	@Override
	public Grupo getGrupoById(Long gid) {
		EntityManager em = EMFService.get().createEntityManager();
		
		Query q = em.createQuery("SELECT m FROM Grupo m WHERE m.gid = :gid");
		q.setParameter("gid", gid);
		Grupo grupo = (Grupo) q.getSingleResult();
		em.close();
		return grupo;
	}

	@Override
	public List<Grupo> getGrupoByModerador(String moderador) {
		EntityManager em = EMFService.get().createEntityManager();

		Query q = em.createQuery("SELECT m FROM Grupo m WHERE m.moderador = :moderador");
		q.setParameter("moderador", moderador);
		List<Grupo> grupo = q.getResultList();
		em.close();
		return grupo;
	}

}
