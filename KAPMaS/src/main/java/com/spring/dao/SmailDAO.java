package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.SearchCriteriaById;
import com.spring.dto.DepEmpVO;
import com.spring.dto.SmailVO;

public interface SmailDAO {
	
	
	//보낸 메세지 리스트 
		List<SmailVO> selectSMailListById(String  empId)throws SQLException;
		
		//검색결과의 전체 리스트 개수
		int selectSMailCounrListById(SearchCriteriaById  crid)throws SQLException;
		
		//메세지 보내기
		void sendMail(SmailVO smail)throws SQLException;
		
		//보낸 메세지 확인학디
		SmailVO selectSmailInfo(String smCode)throws SQLException;
	
		//메세지 읽음 표시
		void readSmail(String smCode)throws SQLException;
		
		//부서 사원들 리스트 검색
		List<DepEmpVO> getDepEmpList(String depCode)throws SQLException;
		
		//메세지 휴지통으로 보내기
		void deleteSmail(String smCode)throws SQLException;

		void deleteAllSmail(String smCode) throws SQLException;

}
