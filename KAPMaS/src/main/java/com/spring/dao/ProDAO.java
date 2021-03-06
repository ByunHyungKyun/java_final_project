package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.SearchCriteriaByPA;
import com.spring.command.SearchCriteriaByPro;
import com.spring.dto.PAVO;
import com.spring.dto.PIVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProLogVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.ProVO;
import com.spring.dto.RelegateVO;

public interface ProDAO {
	
	//아이디로 내가 들어가있는 프로젝트 리스트 검색(참여중 + 옵저버)
	List<ProPjmVO> getlistProById(String empId) throws SQLException;
	
	//아이디로 내가 참여중인 프로젝트 리스트 검색
	List<ProVO> getListDoProById(SearchCriteriaByPro cri)throws SQLException;
	
	//아이디로 내가 옵저버중인 프로젝트 리스트 검색
	List<ProVO> getListAopProById(SearchCriteriaByPro cri)throws SQLException;
	
	//아이디로 내가 참여중인 비활성화 프로젝트 리스트 검색
	List<ProVO> getListNotProById(SearchCriteriaByPro cri)throws SQLException;
	
	//프로젝트 코드로 정보 가져오기
	public ProVO getProInfo(String  pCode)throws SQLException;
	
	//프로젝트 증록
	public void insertProject(ProVO pro)throws SQLException;
	
	//프로젝트 정보 수정
	public void updateProject(ProVO pro)throws SQLException;
	
	//프로젝트 비활성화
	public void notDoProject(String pCode)throws SQLException;
	
	//프로젝트 활성화
	public void DoProject(String pCode)throws SQLException;
	
	//프로젝트 등록시 PL추가
	public void insertPL(PjmVO pjm)throws SQLException;
	
	//프로젝트 참여자 추가
	public void insertMember(PjmVO pjm)throws SQLException;
	
	//프로젝트 참여자 제거
	public void deleteMember(String empId)throws SQLException;
		
	//프로젝트 PL 검색
	PjmVO projectPl(String pCode)throws SQLException;
	
	//프로젝트 참여자 역할 추가
	void updateAu(PjmVO pjm)throws SQLException;
	
	//최근등록된 프로젝트 코드 가져오기
	public String getPcode()throws SQLException;

	// 자료실 등록
	void insertPA(PAVO pa)throws SQLException;
	
	//pa_seq.nextval 가져오기
	int getPASeqNextValue() throws SQLException;

	List<PAVO> selectPACriteria(SearchCriteriaByPA cri) throws SQLException;
	
	int selectPACriteriaTotalCount(SearchCriteriaByPA cri) throws SQLException;

	PAVO selectPAByPACode(String pacode) throws SQLException;
	
	//프로젝트 참여 인원 검색
	List<ProEmpVO> selectProMemberList(String pCode)throws SQLException;

	void updatePA(PAVO pa) throws SQLException;

	void deletePds(String pacode) throws SQLException;

	void insertRelegate(RelegateVO rlvo) throws SQLException;

	RelegateVO selectRelegate(String pCode) throws SQLException;

	void deleteRelegate(String pCode) throws SQLException;

	List<ProVO> getCompletionDateProList( )throws SQLException;

	//프로젝트 기능 카테고리 업데이트
	void updateService(ProVO pro)throws SQLException;
	
	//-----------------------------
	// 프로젝트 이슈
	public List<PIVO> selectPIList(String pCode) throws SQLException;
	
	public List<Object> selectPIMileStoneList(String pCode) throws SQLException;
	
	public PIVO selectPI(String piCode) throws SQLException;
	
	public void insertPI(PIVO pi) throws SQLException;
	
	public void updatePI(PIVO pi) throws SQLException;
	
	public void completePI(String piCode) throws SQLException;
	
	public void deletePI(String piCode) throws SQLException;

	List<HashMap<String, Object>> getMainWorkByManager(String pCode) throws SQLException;

	List<HashMap<String, Object>> getMainWorkByCate(String pCode)throws SQLException;

	HashMap<String, Object> getTotalProgress(String pCode) throws SQLException;

	public void insertLog(Map<String, Object> log) throws SQLException;

	List<ProLogVO> getLogList(String pCode) throws SQLException;

	public String selectPjmAuthById(PjmVO pjm);
}
