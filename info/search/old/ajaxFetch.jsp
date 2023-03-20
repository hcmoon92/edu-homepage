<%@page import="java.sql.*,org.json.*;" %>
<% 
    final String jdbcdriver="org.mariadb.jdbc.Driver";
    final String url="jdbc:mysql://211.253.241.229:3306/academy";
    final String user="root";
    final String pass="rkvldk9711";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
        
    try{
        Class.forName(jdbcdriver);
        con = DriverManager.getConnection(url,user,pass);
    }catch(ClassNotFoundException e){
    }catch(SQLException e){}
    
    try{
        
        String query;
        
        stmt = con.createStatement();
        
        query = "SELECT * FROM food_table";
        result = stmt.executeQuery(query);
        
        if(!result.next()){
            out.print("0");
        }else{
            JSONArray array=new JSONArray();
            do{
                JSONObject obj = new JSONObject();
                obj.put("id",result.getString("id`"));
                obj.put("Name",result.getString("name"));
                obj.put("Addr",result.getString("addr"));
                array.put(obj.toString());
            }while(result.next());
            out.print(array);
        }
        
    }catch(SQLException e){
        out.print("Exception: "+e);
    }
    finally{
        if(stmt != null){
            try{
                stmt.close();
            }catch(SQLException e){}
        }
        if(con != null){
            try{
                con.close();
            }catch(SQLException e){}
        }
    }

%>