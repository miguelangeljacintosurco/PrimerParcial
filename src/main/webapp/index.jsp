<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Registro"%>
<%
    if(session.getAttribute("listaper") == null){
        ArrayList<Registro> lisaux = new ArrayList<Registro>();
        session.setAttribute("listaper",lisaux);
    }
    ArrayList<Registro> lista = (ArrayList<Registro>) session.getAttribute("listaper");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <div>
        <div >
        <table border="1">
            <td>
                <p>PRIMER PARCIAL TEM-742<p>
                <p>Nombre: Miguel Angel Jacinto Surco<p>
                <p>Carnet: 13569326 L.P.<p>
            </td>
        </table>
        </div>
        <h1>Registro de calificaciones</h1>
        <a href="MainServlet?op=nuevo"><input type="submit" value="Nuevo"></a>
        <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>P1(30)</th>
                    <th>P2(30)</th>
                    <th>EF(40)</th>
                    <th>Nota</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if (lista != null){
                        for(Registro item: lista){                       
                %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getNombre()%></td>
                    <td><%= item.getPrimero() %></td>
                    <td><%= item.getSegundo() %></td>
                    <td><%= item.getTercero()%></td>
                    <td><%  int primero = Integer.parseInt(item.getPrimero());
                            int segundo = Integer.parseInt(item.getSegundo());
                            int tercero = Integer.parseInt(item.getTercero());
                            int sum = primero + segundo + tercero;
                    %>
                    <%= sum   %>                    
                    </td>
                    <td> 
                        <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                    </td>
                    <td> 
                        <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                           onclick="return(confirm('Esta seguro de Eliminar??'))"
                           >Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
        </table>

       </div>
    </center>       
    </body>
</html>
