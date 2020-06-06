package br.com.comida.model;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;

public class ComidaModel {
	
	private long id;
	private String nome;
	private String descricao;
	private double preco;
	private String tipo;
	private String acompanhamento;
	
	public ComidaModel() {
	}

	public ComidaModel(long id, String nome, String descricao, double preco, String tipo, String acompanhamento) {
		super();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.preco = preco;
		this.tipo = tipo;
		this.acompanhamento = acompanhamento;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	//error validation, fluxo de sucesso e excessao
	@Size(min =1, max=40, message= "O nome da comida deve ter no minimo 1 e no maximo 40 caracteres")
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Size(min =1, max=50, message= "A descricao deve ter no minimo 1 e no maximo 50 caracteres")
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@DecimalMin(value = "0.1", message = "Valor acima de zero")
	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}
	
	@Size(min =1, max=30, message= "O tipo de comida deve ter no minimo 1 e no maximo 30 caracteres")
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	@Size(min =1, max=50, message= "O acompanhamento deve ter no minimo 1 e no maximo 50 caracteres")
	public String getAcompanhamento() {
		return acompanhamento;
	}

	public void setAcompanhamento(String acompanhamento) {
		this.acompanhamento = acompanhamento;
	}
}
