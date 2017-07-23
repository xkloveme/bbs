package jiabin.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.RequestProcessor;

public class EncodingProcessor extends RequestProcessor {
public void process(HttpServletRequest request, HttpServletResponse response)
   throws IOException, ServletException {

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

}

}
