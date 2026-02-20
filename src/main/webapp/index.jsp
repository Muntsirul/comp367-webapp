<%@ page import="java.util.Calendar" %>
<html>
<body>
<%
    Calendar cal = Calendar.getInstance();
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    String greeting;
    
    if (hour < 12) {
        greeting = "Good morning";
    } else {
        greeting = "Good afternoon";
    }
    
    String name = "Muntasirul"; 
%>
<h2><%= greeting %>, <%= name %>, Welcome to COMP367</h2>
<p>Current hour: <%= hour %>:00</p>
</body>
</html>
