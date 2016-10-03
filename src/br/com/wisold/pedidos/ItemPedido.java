package br.com.wisold.pedidos;

import br.com.wisold.produtos.Produto;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="itempedidos")
public class ItemPedido
{
  @Id
  @GeneratedValue
  private Long id;
  private Integer quantidade;
  private Double valor;
  private Double total;
  private String embalagem;
  @OneToOne
  private Produto produto;
  @ManyToOne
  private Pedido pedido;
  
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  
  public Integer getQuantidade()
  {
    return this.quantidade;
  }
  
  public void setQuantidade(Integer quantidade)
  {
    this.quantidade = quantidade;
  }
  
  public Double getValor()
  {
    return this.valor;
  }
  
  public void setValor(Double valor)
  {
    this.valor = valor;
  }
  
  public Double getTotal()
  {
    return this.total;
  }
  
  public void setTotal(Double total)
  {
    this.total = total;
  }
  
  public Produto getProduto()
  {
    return this.produto;
  }
  
  public void setProduto(Produto produto)
  {
    this.produto = produto;
  }
  
  public Pedido getPedido()
  {
    return this.pedido;
  }
  
  public void setPedido(Pedido pedido)
  {
    this.pedido = pedido;
  }
  
  public String getEmbalagem()
  {
    return this.embalagem;
  }
  
  public void setEmbalagem(String embalagem)
  {
    this.embalagem = embalagem;
  }
  
  public int hashCode()
  {
    int prime = 31;
    int result = 1;
    result = 31 * result + (this.id == null ? 0 : this.id.hashCode());
    return result;
  }
  
  public boolean equals(Object obj)
  {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    ItemPedido other = (ItemPedido)obj;
    if (this.id == null)
    {
      if (other.id != null) {
        return false;
      }
    }
    else if (!this.id.equals(other.id)) {
      return false;
    }
    return true;
  }
}