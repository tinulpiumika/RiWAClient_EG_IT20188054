package com;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//for map
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


@WebServlet("/PowerAPI")
public class PowerAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PowerConsumption itemObj = new PowerConsumption();
       
	
	//convert request parameters to a map
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();

		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();

			String[] params = queryString.split("&");

			for (String param : params) {
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {

		}

		return map;
	}

    public PowerAPI() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//sending values to insert function
		String output = itemObj.insertConsumption(	request.getParameter("currentReading"),
											request.getParameter("date"),
											request.getParameter("type"),
											request.getParameter("readerID"),
											request.getParameter("userID"));
											
		//sending the output to client
		response.getWriter().write(output);
	}


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//parameter map
		Map paras = getParasMap(request);

		//getting values from the map and sending to update function
		String output = itemObj.updateConsumption(	paras.get("hidItemIDSave").toString(),
											paras.get("currentReading").toString(),
											paras.get("date").toString(),
											paras.get("type").toString(),
											paras.get("readerID").toString(),
											paras.get("userID").toString() );
		
		//sending the output to client
		response.getWriter().write(output);
	}


	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//parameter map
		Map paras = getParasMap(request);

		//getting values from the map and sending to delete function
		String output = itemObj.deleteConsumption(paras.get("itemID").toString());
		
		//sending the output to client
		response.getWriter().write(output);
	}

}
