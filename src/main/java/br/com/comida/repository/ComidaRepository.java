package br.com.comida.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.comida.model.ComidaModel;

@Repository
public class ComidaRepository {
	
	private static final String FIND_ALL = "SELECT * FROM TB_COMIDA";
	private static final String FIND_BY_ID = "SELECT * FROM TB_COMIDA WHERE ID = ?";
	private static final String SAVE = "INSERT INTO TB_COMIDA (NOME, DESCRICAO, TIPO, PRECO, ACOMPANHAMENTO) VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE TB_COMIDA SET NOME = ?, DESCRICAO = ?, TIPO = ?, PRECO = ?, ACOMPANHAMENTO = ? WHERE ID = ?";
	private static final String DELETE_BY_ID = "DELETE FROM TB_COMIDA WHERE ID = ?";

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public ComidaRepository() {
	}
	
	public List<ComidaModel> findAll() {
		List<ComidaModel> comidas = jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<ComidaModel>(ComidaModel.class));
		return comidas;
	}
	public ComidaModel findById(long id) {
		ComidaModel comidas = this.jdbcTemplate.queryForObject(FIND_BY_ID, new BeanPropertyRowMapper<ComidaModel>(ComidaModel.class), id);
		return comidas;
	}

	public void save(ComidaModel comidaModel) {
		this.jdbcTemplate.update(SAVE, 
				comidaModel.getNome(), 
				comidaModel.getDescricao(), 
				comidaModel.getTipo(),
				comidaModel.getPreco(), 
				comidaModel.getAcompanhamento());
	}
	
	public void update(ComidaModel comidaModel) {
		this.jdbcTemplate.update(UPDATE, 
				comidaModel.getNome(), 
				comidaModel.getDescricao(), 
				comidaModel.getTipo(),
				comidaModel.getPreco(), 
				comidaModel.getAcompanhamento(),
				comidaModel.getId());
	}
	
	public void deleteById(long id) {
		this.jdbcTemplate.update(DELETE_BY_ID, id);
	}
	
}
