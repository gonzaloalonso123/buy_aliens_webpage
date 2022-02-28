package tiendaEsclavosAlien;

public class Alienigena {

	String nombre = "";
	int precio = 0;
	String foto = "";
	String descripcion = "";
	
	public Alienigena(String nombre, int precio, String foto, String descripcion) {
		super();
		this.nombre = nombre;
		this.precio = precio;
		this.foto = foto;
		this.descripcion = descripcion;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
