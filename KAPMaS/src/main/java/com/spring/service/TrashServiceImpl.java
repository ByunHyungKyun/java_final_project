package com.spring.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.dao.TrashDAO;
import com.spring.dto.TrashVO;

public class TrashServiceImpl implements TrashService{

	
	private TrashDAO trashDAO;
	public void setTrashDAO(TrashDAO trashDAO) {
		this.trashDAO = trashDAO;
	}



	@Override
	public Map<String, Object>getTrashCntAsTrType(TrashVO trash) throws SQLException {
		Map<String, Object> dataMap = trashDAO.getTrashCntAsTrType(trash);
		return dataMap;
	}


	@Override
	public List<TrashVO> getTrashListFromTrTable(TrashVO trash) throws SQLException {
		List<TrashVO> trashList = trashDAO.getTrashListFromTrTable(trash);
		return trashList;
	}

	@Override
	public void insertTrash(TrashVO trash) throws SQLException {
		trashDAO.insertTrash(trash);
	}
	
	@Override
	public void restoreTrash(TrashVO trash) throws SQLException {
		trashDAO.restoreTrash(trash);
	}


	@Override
	public void removeTrash(TrashVO trash) throws SQLException {
		trashDAO.deleteTrash(trash);
	}

	
	
	
}
