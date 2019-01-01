package PetKeeper;

import java.sql.*;
import java.util.*;

public class Beans {

	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://nasosdb.cehnqm7jclum.ap-northeast-2.rds.amazonaws.com/PetKeeper?useUnicode=true&characterEncoding=utf8";

	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, "paki1019", "kmy37950224!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public User doLogin(String id) {
		connect();
		User user = new User();

		String sql = "SELECT * FROM user WHERE id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			rs.next();

			user.setNum(rs.getInt("num"));
			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setAddress(rs.getString("address"));
			user.setAdmin(rs.getInt("admin"));
			user.setLocation_x(rs.getDouble("location_x"));
			user.setLocation_y(rs.getDouble("location_y"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			user = null;
		} finally {
			disconnect();
		}
		return user;
	}

	public String checkSign(String id) {
		connect();
		String sql = "SELECT * FROM user WHERE id=?";
		String ID = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			ID = rs.getString("id");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return ID;
	}

	public boolean doSign(User account) {
		connect();
		String sql = "INSERT INTO user(id,password,phone,admin) VALUES(?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account.getId());
			pstmt.setString(2, account.getPassword());
			pstmt.setString(3, account.getPhone());
			pstmt.setInt(4, account.getAdmin());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean doSignAdmin(User account) {
		connect();
		String sql = "INSERT INTO user(id,password,phone,address,admin,location_x,location_y) VALUES(?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account.getId());
			pstmt.setString(2, account.getPassword());
			pstmt.setString(3, account.getPhone());
			pstmt.setString(4, account.getAddress());
			pstmt.setInt(5, account.getAdmin());
			pstmt.setDouble(6, account.getLocation_x());
			pstmt.setDouble(7, account.getLocation_y());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean doContract(Contract contract) {
		connect();
		String sql = "";
		try {
			sql = "INSERT INTO contract(user_num,pet_num,start_date,end_date,type,location_user,etcs,location_user_x,location_user_y) values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contract.getUser_num());
			pstmt.setInt(2, contract.getPet_num());
			pstmt.setString(3, contract.getStart_date());
			pstmt.setString(4, contract.getEnd_date());
			pstmt.setInt(5, contract.getType());
			pstmt.setString(6, contract.getLocation_user());
			pstmt.setString(7, contract.getEtcs());
			pstmt.setDouble(8, contract.getLocation_user_x());
			pstmt.setDouble(9, contract.getLocation_user_y());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean doPetInsert(Pet pet) {
		connect();
		try {
			String sql = "INSERT INTO pet(user_num,name,breed,age,gender) values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pet.getUser_num());
			pstmt.setString(2, pet.getName());
			pstmt.setString(3, pet.getBreed());
			pstmt.setInt(4, pet.getAge());
			pstmt.setInt(5, pet.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public ArrayList<Pet> doPetReadList(int user_id) {
		connect();
		ArrayList<Pet> datas = new ArrayList<Pet>();

		String sql = "SELECT * FROM pet WHERE user_num = ? ORDER BY num DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Pet pet = new Pet();
				pet.setNum(rs.getInt("num"));
				pet.setName(rs.getString("name"));
				pet.setAge(rs.getInt("age"));
				pet.setBreed(rs.getString("breed"));
				pet.setGender(rs.getInt("gender"));
				pet.setUser_num(rs.getInt("user_num"));

				datas.add(pet);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

	public Pet doPetReadUser(int user_num) {
		connect();
		Pet pet = new Pet();

		String sql = "SELECT * FROM pet WHERE user_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pet.setNum(rs.getInt("num"));
			pet.setName(rs.getString("name"));
			pet.setAge(rs.getInt("age"));
			pet.setBreed(rs.getString("breed"));
			pet.setGender(rs.getInt("gender"));
			pet.setUser_num(rs.getInt("user_num"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return pet;

	}

	public Pet doPetRead(int pet_num) {
		connect();
		Pet pet = new Pet();

		String sql = "SELECT * FROM pet WHERE num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pet_num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pet.setNum(rs.getInt("num"));
			pet.setName(rs.getString("name"));
			pet.setAge(rs.getInt("age"));
			pet.setBreed(rs.getString("breed"));
			pet.setGender(rs.getInt("gender"));
			pet.setUser_num(rs.getInt("user_num"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return pet;

	}

	public Contract doContractRead(int num) {
		connect();
		Contract contract = new Contract();
		
		String sql = "SELECT * FROM contract where num = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				contract.setNum(rs.getInt("num"));
				contract.setUser_num(rs.getInt("user_num"));
				contract.setStart_date(rs.getString("start_date"));
				contract.setEnd_date(rs.getString("end_date"));
				contract.setLocation_user(rs.getString("location_user"));
				contract.setLocation_admin(rs.getString("location_admin"));
				contract.setEtcs(rs.getString("Etcs"));
				contract.setPet_num(rs.getInt("pet_num"));
				contract.setType(rs.getInt("type"));
				contract.setReceipt(rs.getInt("receipt"));
				contract.setLocation_user_x(rs.getDouble("location_user_x"));
				contract.setLocation_user_y(rs.getDouble("location_user_y"));
				contract.setLocation_admin_x(rs.getDouble("location_admin_x"));
				contract.setLocation_admin_y(rs.getDouble("location_user_y"));
				contract.setAdmin_num(rs.getInt("admin_num"));
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
			return contract;
		
	}

	public ArrayList<Contract> doContractReadadmin(int num) {
		connect();
		ArrayList<Contract> datas = new ArrayList<Contract>();

		String sql = "SELECT * FROM contract WHERE receipt=0 ORDER BY "
				+ " ((location_user_x-(SELECT location_x from user where num = ?)) * (location_user_x-(SELECT location_x from user where num = ?))"
				+ " + (location_user_y - (SELECT location_y from user where num = ?)) * (location_user_y - (SELECT location_y from user where num = ?))) DESC, end_date DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			pstmt.setInt(3, num);
			pstmt.setInt(4, num);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Contract contract = new Contract();
				contract.setNum(rs.getInt("num"));
				contract.setUser_num(rs.getInt("user_num"));
				contract.setStart_date(rs.getString("start_date"));
				contract.setEnd_date(rs.getString("end_date"));
				contract.setType(rs.getInt("type"));
				contract.setLocation_user(rs.getString("location_user"));
				contract.setLocation_user_x(rs.getDouble("location_user_x"));
				contract.setLocation_user_y(rs.getDouble("location_user_y"));
				contract.setLocation_admin(rs.getString("location_admin"));
				contract.setPet_num(rs.getInt("pet_num"));
				contract.setEtcs(rs.getString("etcs"));
				contract.setReceipt(rs.getInt("receipt"));

				datas.add(contract);

			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;

	}

	public ArrayList<Contract> doContractReceiptadmin(int num) {
		connect();
		ArrayList<Contract> datas = new ArrayList<Contract>();

		String sql = "SELECT * FROM contract WHERE admin_num= ? ORDER BY end_date DESC, receipt DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Contract contract = new Contract();
				contract.setNum(rs.getInt("num"));
				contract.setUser_num(rs.getInt("user_num"));
				contract.setStart_date(rs.getString("start_date"));
				contract.setEnd_date(rs.getString("end_date"));
				contract.setType(rs.getInt("type"));
				contract.setLocation_user(rs.getString("location_user"));
				contract.setLocation_user_x(rs.getDouble("location_user_x"));
				contract.setLocation_user_y(rs.getDouble("location_user_y"));
				contract.setLocation_admin(rs.getString("location_admin"));
				contract.setLocation_admin_x(rs.getDouble("location_admin_x"));
				contract.setLocation_admin_y(rs.getDouble("location_admin_y"));
				contract.setPet_num(rs.getInt("pet_num"));
				contract.setEtcs(rs.getString("etcs"));
				contract.setReceipt(rs.getInt("receipt"));
				datas.add(contract);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;

	}

	public ArrayList<Contract> doContractReadList(int user_id) {

		connect();
		ArrayList<Contract> datas = new ArrayList<Contract>();

		String sql = "SELECT * FROM contract WHERE user_num= ? ORDER BY end_date DESC, receipt DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Contract contract = new Contract();
				contract.setNum(rs.getInt("num"));
				contract.setUser_num(rs.getInt("user_num"));
				contract.setStart_date(rs.getString("start_date"));
				contract.setEnd_date(rs.getString("end_date"));
				contract.setType(rs.getInt("type"));
				contract.setLocation_user(rs.getString("location_user"));
				contract.setLocation_admin(rs.getString("location_admin"));
				contract.setLocation_user_x(rs.getDouble("location_user_x"));
				contract.setLocation_user_y(rs.getDouble("location_user_y"));
				contract.setLocation_admin_x(rs.getDouble("location_admin_x"));
				contract.setLocation_admin_y(rs.getDouble("location_admin_y"));
				contract.setPet_num(rs.getInt("pet_num"));
				contract.setEtcs(rs.getString("etcs"));
				contract.setReceipt(rs.getInt("receipt"));
				datas.add(contract);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;

	}

	public ArrayList<Diary> doDiaryReadList(int id) {

		connect();
		ArrayList<Diary> datas = new ArrayList<Diary>();

		String sql = "SELECT * FROM diary WHERE contract_num = ? ORDER BY time DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Diary diary = new Diary();
				diary.setNum(rs.getInt("num"));
				diary.setTitle(rs.getString("title"));
				diary.setPhoto(rs.getString("photo"));
				diary.setText(rs.getString("text"));
				diary.setTime(rs.getString("time"));
				diary.setContract_num(rs.getInt("contract_num"));
				diary.setPet_num(rs.getInt("pet_num"));
				datas.add(diary);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;

	}

	public boolean receiptContract(int num, User user) {
		connect();
		try {
			String sql = "UPDATE contract SET receipt=1, admin_num = ?, location_admin=?, location_admin_y = ?, location_admin_x = ? where num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getNum());
			pstmt.setString(2, user.getAddress());
			pstmt.setDouble(3, user.getLocation_y());
			pstmt.setDouble(4, user.getLocation_x());
			pstmt.setInt(5, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	public boolean doDiaryInsert(Diary diary) {
		connect();
		try {
			String sql = "INSERT INTO diary (title,photo,text,contract_num,pet_num) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, diary.getTitle());
			pstmt.setString(2,diary.getPhoto());
			pstmt.setString(3, diary.getText());
			pstmt.setInt(4, diary.getContract_num());
			pstmt.setInt(5, diary.getPet_num());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}return true;
	}

}