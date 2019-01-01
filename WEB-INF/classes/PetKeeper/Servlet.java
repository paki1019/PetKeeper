package PetKeeper;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import java.util.*;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Beans gb = new Beans();
		User user = new User();
		User account = new User();
		Contract contract = new Contract();
		Pet pet = new Pet();
		Diary diary = new Diary();
		String action = new String();
		if(request.getParameter("action")==null) {
			action="diary_add";
		}else {
		action = request.getParameter("action");
		}
		try {
			if (action.equals("login")) {
				user.setId(request.getParameter("id"));
				user.setPassword(request.getParameter("password"));
				account = gb.doLogin(user.getId());
				if (account == null) {
					response.sendRedirect("login.jsp?fail=1");
				} else if (!account.getPassword().equals(user.getPassword())) {
					response.sendRedirect("login.jsp?fail=2");
				} else if (account.getPassword().equals(user.getPassword())) {
					session.setAttribute("account", account);
					response.sendRedirect("index.jsp");
				} else {
					throw new Exception("로그인 오류");
				}
			} else if (action.equals("logout")) {
				session.invalidate();
				response.sendRedirect("index.jsp?logout=1");
			} else if (action.equals("sign")) {
				account.setId(request.getParameter("id"));
				account.setPassword(request.getParameter("password"));
				String Password_check = request.getParameter("password_check");
				account.setPhone(request.getParameter("phone"));
				account.setAdmin(0);
				if (gb.checkSign(account.getId()) != null) {
					response.sendRedirect("sign.jsp?fail=1");
				} else if (!account.getPassword().equals(Password_check)) {
					response.sendRedirect("sign.jsp?fail=2");
				} else if (gb.doSign(account)) {
					response.sendRedirect("index.jsp");
				} else {
					throw new Exception("회원가입 실패: DB오류");
				}
			} else if (action.equals("sign_admin")) {
				if (request.getParameter("location_x") == null) {
					response.sendRedirect("sign_admin.jsp?fail=3");
				} else {
					account.setId(request.getParameter("id"));
					account.setPassword(request.getParameter("password"));
					String Password_check = request.getParameter("password_check");
					account.setPhone(request.getParameter("phone"));
					account.setAddress(request.getParameter("address"));
					account.setLocation_x(Double.parseDouble(request.getParameter("location_x")));
					account.setLocation_y(Double.parseDouble(request.getParameter("location_y")));
					account.setAdmin(1);
					if (gb.checkSign(account.getId()) != null) {
						response.sendRedirect("sign_admin.jsp?fail=1");
					} else if (!account.getPassword().equals(Password_check)) {
						response.sendRedirect("sign_admin.jsp?fail=2");
					} else if (gb.doSignAdmin(account)) {
						response.sendRedirect("index.jsp");
					} else {
						throw new Exception("회원가입 실패: DB오류");
					}
				}
			} else if (action.equals("contract")) {
				if (session.getAttribute("account") != null) {
					account = (User) session.getAttribute("account");
					ArrayList<Pet> datas = gb.doPetReadList(account.getNum());
					request.setAttribute("datas", datas);
					request.getRequestDispatcher("contract.jsp").forward(request, response);
				} else {
					response.sendRedirect("login.jsp");
				}
			} else if (action.equals("put")) {
				contract.setUser_num(Integer.parseInt(request.getParameter("user_num")));
				contract.setPet_num(Integer.parseInt(request.getParameter("pet_num")));
				contract.setStart_date(request.getParameter("start_date"));
				contract.setEnd_date(request.getParameter("end_date"));
				contract.setType(0);
				contract.setLocation_user(request.getParameter("location"));
				contract.setEtcs(request.getParameter("etcs"));
				if (request.getParameter("location_user_x") != null) {
					contract.setLocation_user_x(Double.parseDouble(request.getParameter("location_user_x")));
					contract.setLocation_user_y(Double.parseDouble(request.getParameter("location_user_y")));
					if (gb.doContract(contract)) {
						Pet pet2 = gb.doPetRead(contract.getPet_num());
						request.setAttribute("pet_data", pet2);
						request.setAttribute("contract_data", contract);
						request.getRequestDispatcher("contract_result.jsp").forward(request, response);
					} else {
						throw new Exception("맡기기 실패: DB오류");
					}
				} else {
					response.sendRedirect("Servlet?action=contract&type=put&error=1");
				}
			} else if (action.equals("call")) {
				contract.setUser_num(Integer.parseInt(request.getParameter("user_num")));
				contract.setPet_num(Integer.parseInt(request.getParameter("pet_num")));
				contract.setStart_date(request.getParameter("start_date"));
				contract.setEnd_date(request.getParameter("end_date"));
				contract.setType(1);
				contract.setLocation_user(request.getParameter("location"));
				contract.setEtcs(request.getParameter("etcs"));
				if (request.getParameter("location_user_x") != null) {
					contract.setLocation_user_x(Double.parseDouble(request.getParameter("location_user_x")));
					contract.setLocation_user_y(Double.parseDouble(request.getParameter("location_user_y")));
					if (gb.doContract(contract)) {
						Pet pet2 = gb.doPetRead(contract.getPet_num());
						request.setAttribute("pet_data", pet2);
						request.setAttribute("contract_data", contract);
						request.getRequestDispatcher("contract_result.jsp").forward(request, response);
					} else {
						throw new Exception("부르기 실패: DB오류");
					}
				} else {
					response.sendRedirect("Servlet?action=contract&type=put&error=1");
				}
			} else if (action.equals("pet_add")) {
				pet.setName(request.getParameter("name"));
				pet.setBreed(request.getParameter("breed"));
				pet.setAge(Integer.parseInt(request.getParameter("age")));
				pet.setUser_num(Integer.parseInt(request.getParameter("user_num")));
				pet.setGender(Integer.parseInt(request.getParameter("gender")));
				if (gb.doPetInsert(pet)) {
					response.sendRedirect("index.jsp");
				} else {
					throw new Exception("부르기 실패: DB오류");
				}
			} else if (action.equals("mypage")) {
				if (session.getAttribute("account") != null) {
					account = (User) session.getAttribute("account");
					if (account.getAdmin() == 1) {
						ArrayList<Contract> datas = gb.doContractReadadmin(account.getNum());
						ArrayList<Contract> datass = gb.doContractReceiptadmin(account.getNum());
						request.setAttribute("datas", datas);
						request.setAttribute("datass", datass);
						request.getRequestDispatcher("mypage_admin.jsp").forward(request, response);
					} else {
						ArrayList<Contract> datas = gb.doContractReadList(account.getNum());
						ArrayList<Pet> datass = gb.doPetReadList(account.getNum());
						request.setAttribute("datass", datass);
						request.setAttribute("datas", datas);
						request.getRequestDispatcher("mypage.jsp").forward(request, response);
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			} else if (action.equals("diary")) {
				if (session.getAttribute("account") != null) {
					account = (User) session.getAttribute("account");
					Contract contract_data = gb.doContractRead(Integer.parseInt(request.getParameter("id")));
					Pet pet_data = gb.doPetRead(contract_data.getPet_num());
					ArrayList<Diary> datas = gb.doDiaryReadList(contract_data.getNum());
					request.setAttribute("pet_data", pet_data);
					request.setAttribute("contract_data", contract_data);
					request.setAttribute("datas", datas);
					request.getRequestDispatcher("diary.jsp").forward(request, response);
				} else {
					response.sendRedirect("login.jsp");
				}
			} else if (action.equals("diary_add")) {
				int maxSize = 1024 * 1024 * 10;
				String root = "";
				System.out.println("okokokoko");
				if (session.getAttribute("account") != null) {
					account = (User) session.getAttribute("account");
					root = request.getSession().getServletContext().getRealPath("/");
					String savePath = root + "photo/";
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
							new DefaultFileRenamePolicy());
					diary.setTitle(multi.getParameter("title"));
					String uploadFile = multi.getFilesystemName("image");
					diary.setPhoto("photo/" + uploadFile);
					diary.setText(multi.getParameter("text"));
					diary.setContract_num(Integer.parseInt(multi.getParameter("contract_num")));
					diary.setPet_num(Integer.parseInt(multi.getParameter("pet_num")));
					if (gb.doDiaryInsert(diary)) {
						response.sendRedirect("Servlet?action=mypage");
					} else {
						throw new Exception("제출 실패:DB오류");
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			} else if (action.equals("receipt")) {
				if (session.getAttribute("account") != null) {
					account = (User) session.getAttribute("account");
					if (gb.receiptContract(Integer.parseInt(request.getParameter("num")), account)) {
						response.sendRedirect("Servlet?action=mypage");
					} else {
						throw new Exception("접수 실패: DB오류");
					}
				} else {
					response.sendRedirect("login.jsp");
				}

			}

		} catch (Exception e) {
			request.setAttribute("exception", e);
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");

			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
