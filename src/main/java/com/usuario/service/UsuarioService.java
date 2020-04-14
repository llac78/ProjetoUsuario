package com.usuario.service;

import java.util.List;

import com.usuario.model.Usuario;

public interface UsuarioService {
	
	public Usuario salvar(Usuario usuario);
	
	public List<Usuario> listarUsuarios();
	
}
