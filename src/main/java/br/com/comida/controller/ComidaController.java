package br.com.comida.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.comida.model.ComidaModel;
import br.com.comida.repository.ComidaRepository;

@Controller
@RequestMapping("/comida")
public class ComidaController {

	@Autowired
	public ComidaRepository repository;

	@GetMapping("/cardapio/form")
	public String open(@RequestParam String page, @RequestParam(required = false) Long id,
			@ModelAttribute("comidaModel") ComidaModel comidaModel, Model model) {

		if ("comida-editar".equals(page)) {
			model.addAttribute("comidaModel", repository.findById(id));
		}

		return page;
	}

	// INDEX
	@GetMapping()
	public String index() {
		return "index";
	}

	// FIND ALL
	@GetMapping("/cardapio")
	public String findAll(Model model) {

		model.addAttribute("comidas", repository.findAll());
		return "comidas";
	}

	// FIND BY ID
	@GetMapping("/cardapio/{id}")
	public String findById(@PathVariable("id") long id, Model model) {

		model.addAttribute("comida", repository.findById(id));
		return "comida-detalhe";
	}
	/*
	// OPEN SAVE
	@GetMapping("/cardapio/new")
	public String openSave(@ModelAttribute("comidaModel") ComidaModel comidaModel) {
		return "comida-novo";
	}
	*/
	// SAVE
	@PostMapping("/cardapio")
	public String save(@Valid ComidaModel comidaModel, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {
			return "comida-novo";
		}

		repository.save(comidaModel);
		redirectAttributes.addFlashAttribute("messages", "Comida cadastrada com sucesso!");

		return "redirect:/comida/cardapio";
	}
	/*
	// OPEN UPDATE
	@GetMapping("/cardapio/update/{id}")
	public String openUpdate(@PathVariable("id") long id, Model model,
			@ModelAttribute("comidaModel") ComidaModel comidaModel) {

		model.addAttribute("comidaModel", repository.findById(id));
		return "comida-editar";
	}
	*/
	// UPDATE
	@PutMapping("/cardapio/{id}")
	public String update(@PathVariable("id") long id, @Valid ComidaModel comidaModel, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {
			return "comida-editar";
		}

		comidaModel.setId(id);
		repository.update(comidaModel);
		redirectAttributes.addFlashAttribute("messages", "Comida alterada com sucesso!");

		return "redirect:/comida/cardapio";
	}

	// DELETE
	@DeleteMapping("/cardapio/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {

		repository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Comida excluida com sucesso!");

		return "redirect:/comida/cardapio";
	}
}
