package br.com.wisold.persitencia;

import java.util.List;

import br.com.wisold.usuarios.Usuario;

public interface AbstractDAO<Object> {
	
	Object buscarPorId(Long id);
	List<Object> listar(Usuario usuario);
	void inserir(Object t);
	void alterar(Object t);
	void excluir(Object t);

}
