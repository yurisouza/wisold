package br.com.wisold.usuarios;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDao
{
  @PersistenceContext
  private EntityManager manager;
  
  public Usuario buscaPorId(Long id)
  {
    return (Usuario)this.manager.find(Usuario.class, id);
  }
  
  public List<Usuario> listar()
  {
    return this.manager.createQuery("select t from Usuario t").getResultList();
  }
  
  public void inserir(Usuario t)
  {
    this.manager.persist(t);
  }
  
  public void alterar(Usuario t)
  {
    this.manager.merge(t);
  }
  
  public void excluir(Usuario t)
  {
    Usuario usuario = buscaPorId(t.getId());
    this.manager.remove(usuario);
  }
  
  public Usuario buscarPorEmail(String email)
    throws NoResultException
  {
    Usuario retorno = null;
    
    retorno = (Usuario)this.manager.createQuery("select t from Usuario t WHERE t.email = :email").setParameter("email", email).getSingleResult();
    
    return retorno;
  }
}
