package com.usuario.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.usuario.model.Usuario;
import com.usuario.service.UsuarioService;

@Controller
public class UsuarioController {

	private UsuarioService usuarioService;

	@Autowired
	public UsuarioController(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/inicio")
	public ModelAndView inicio() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("inicio");

		Usuario usuario = new Usuario();
		mv.addObject("usuario_form", usuario);

		return mv;
	}

	@PostMapping("/salvar")
	public ModelAndView salvar(@Valid @ModelAttribute("usuario_form") Usuario usuario, BindingResult result)
			throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("inicio");
		
		if (result.hasErrors()) {
			return mv;
		} else {
			 SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
			 Date dataNascimento = formato.parse(usuario.getDataNascimento());

			 this.validarDataNascimento(dataNascimento);
			 
			 String mensagemData = this.validarDataNascimento(dataNascimento);

			 System.out.println(mensagemData);
			 usuarioService.salvar(usuario);
			 mv.addObject("mensagemData", mensagemData);
			 
			 return mv;
		}
	}
	
	@GetMapping("/listar")
	public ModelAndView listar(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listar");
		
		List<Usuario> listaUsuarios = new ArrayList<>();
		listaUsuarios = this.listarUsuarios();
		
		mv.addObject("listaUsuarios", listaUsuarios);
		
		return mv;
	}
	
	public List<Usuario> listarUsuarios(){
		
		List<Usuario> listaUsuarios = new ArrayList<Usuario>();
		listaUsuarios = this.usuarioService.listarUsuarios();
	
		return listaUsuarios;
	}

//	 @ExceptionHandler({UsuarioException.class})
	public String validarDataNascimento(Date dataNascimento) throws ParseException {

		String mensagem = " ";

		if (dataNascimento.after(new Date())) {
			mensagem = "A data informada não deve ser posterior à data atual.";

//			 throw new UsuarioException("A data informada não deve ser posterior a data atual.");
		}
		
		String dataAntiga = "01/01/1900";
		Date antigo = new SimpleDateFormat("dd/MM/yyyy").parse(dataAntiga);
		
		if (dataNascimento.before(antigo)) {
			mensagem = "A data informada não deve ser anterior a 01/01/1900.";
//			 throw new UsuarioException("A data informada não deve ser anterior a 01/01/1900.");
		}
		return mensagem;

	}

}
