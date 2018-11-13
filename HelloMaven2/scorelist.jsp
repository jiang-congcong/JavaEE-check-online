<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
//降序排序
public <K, V extends Comparable<? super V>> Map<K, V> sortByValueDescending(Map<K, V> map)
    {
        List<Map.Entry<K, V>> list = new LinkedList<Map.Entry<K, V>>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<K, V>>()
        {
            
            public int compare(Map.Entry<K, V> o1, Map.Entry<K, V> o2)
            {
                int compare = (o1.getValue()).compareTo(o2.getValue());
                return -compare;
            }
        });

        Map<K, V> result = new LinkedHashMap<K, V>();
        for (Map.Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
    }
%>

<h2>成绩榜</h2>
<%
String username1 = null;
int score1=0;

if(application.getAttribute("score_list")==null){
	out.print("<h3>没有成绩</h3>");
}
else{  //遍历显示所有成绩（Map遍历）
	Map<String, Integer> score_list= (Map<String, Integer>)application.getAttribute("score_list");
	score_list = sortByValueDescending(score_list);
	//遍历方法一
	//Iterator<Map.Entry<String, Integer>> it = score_list.entrySet().iterator();
	 //while (it.hasNext()) {
		   //Map.Entry<String, Integer> entry = it.next();
		   //out.print("key= " + entry.getKey() + " and value= " + entry.getValue());
		  //}	
	 //遍历方法二
	Set s=score_list.keySet();
	Iterator it=s.iterator();
	while(it.hasNext()){
		String username=(String)it.next();
		int score=score_list.get(username);
		out.print("<h3>"+username+":"+score+"</h3>");
	}
	
}

%>

</body>
</html>