package tiendaEsclavosAlien;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class Connections {

	private static BasicDataSource dataSource;

	public static BasicDataSource getDataSource() {

		if (dataSource == null) {
			BasicDataSource ds = new BasicDataSource();
			ds.setUrl("jdbc:mysql://localhost/Aliens");
			ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
			ds.setUsername("gonzalo");
			ds.setPassword("arbol13");

			ds.setMinIdle(5);
			ds.setMaxIdle(10);
			ds.setMaxOpenPreparedStatements(100);

			dataSource = ds;
		}
		return dataSource;
	}
}