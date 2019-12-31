package service;

import java.util.List;

import model.House;

public interface CollectionService {

	public List<House> select(int userid);

	public void insert(int houseid, int userid);

	public void delete(int houseid, int userid);

}
