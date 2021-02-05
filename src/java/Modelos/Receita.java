/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author User
 */
public class Receita {

    private int id;
    private int idUsuario;
    private int idCategoria;
    private String descricao;
    private float valor;
    private Date data;

    public boolean salvar() {
        String sql = "insert into receita(idusuario, idcategoria, descricao, valor, data)";
        sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,this.idUsuario);
            stm.setInt(2, this.idCategoria);
            stm.setString(3, this.descricao);
            stm.setFloat(4, this.valor);
            stm.setDate(5, this.data);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update receita set ";
        sql += "idcategoria = ?,";
        sql += "descricao = ?,";
        sql += "valor = ?,";
        sql += "data = ?";
        sql += " where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idCategoria);
            stm.setString(2, this.descricao);
            stm.setFloat(3, this.valor);
            stm.setDate(4, this.data);
            stm.setInt(5, this.id);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Receita consultar(int pId, int pIdUser) {
        Connection con = Conexao.conectar();
        String sql = "select id, idusuario, idcategoria, descricao, valor, data "
                + "from receita where id = ? and idusuario = ?;";
        Receita receita = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            stm.setInt(2, pIdUser);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                receita = new Receita();
                receita.setId(pId);
                receita.setIdUsuario(pIdUser);
                receita.setIdCategoria(rs.getInt("idcategoria"));
                receita.setDescricao(rs.getString("descricao"));
                receita.setValor(rs.getFloat("valor"));
                receita.setData(rs.getDate("data"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return receita;
    }

     public ResultSet consultarInner(int pIdUser) {
        Connection con = Conexao.conectar();
        String sql = "select r.id, r.idusuario, r.idcategoria, c.descricao categoria, "
                + "r.descricao, r.valor, r.data "
                + "from receita r, categoria c "
                + "where r.idcategoria = c.id "
                + "and r.idusuario = ? "
                + "order by data;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pIdUser);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return rs;
    }
     
    public List<Receita> consultar(int pIdUser) { // Método tem que ser modificado para usar (não está pronto)
        List<Receita> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select r.id, r.idusuario, r.idcategoria, c.descricao categoria, "
                + "r.descricao, r.valor, r.data "
                + "from receita r, categoria c "
                + "where r.idcategoria = c.id "
                + "and r.idusuario = ? "
                + "order by data;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pIdUser);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Receita receita = new Receita();
                receita.setId(rs.getInt("id"));
                receita.setIdUsuario(rs.getInt("idusuario"));
                receita.setIdCategoria(rs.getInt("idcategoria"));
                receita.setDescricao(rs.getString("descricao"));
                receita.setValor(rs.getFloat("valor"));
                receita.setData(rs.getDate("data"));
                lista.add(receita);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from receita ";
        sql += " where id = ? and idusuario = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setInt(2, this.idUsuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
}
