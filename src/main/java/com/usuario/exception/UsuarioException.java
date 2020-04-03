package com.usuario.exception;

public class UsuarioException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String mensagem;
	   
	public UsuarioException(String mensagem) {
		this.mensagem = mensagem;
    }
	
    public String getExceptionMsg(){
        return this.mensagem;
    }
    public void setExceptionMsg(String mensagem) {
        this.mensagem = mensagem;
    }
}
