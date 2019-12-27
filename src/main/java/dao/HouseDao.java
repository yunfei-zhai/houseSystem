package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import model.House;

@Repository
public interface HouseDao {
	// 查询房子内容
	@Select("select * from hms_house ${txt} ${limit}")
	public List<House> select( @Param("txt") String txt,@Param("limit") String limit);

	// 查询数目
	@Select("select count(1) from hms_house ${txt}")
	public int selectHouseCount(@Param("txt") String txt);
	
	//根据条件查找
	@Select("select * from hms_house ${txt}")
	public List<House> findHouse(@Param("txt") String txt);
	
	// 根据id查询
	@Select("select hms_house.*,hms_user.* from hms_house left join hms_user on hms_house.userid=hms_user.id where hms_house.id = #{id}")
	public House selectById(int id);
	
	//新增
	@Insert("insert into hms_house (topic,userid,position,posidetail,shape,area,houseage,price,type,img,creattime,description ) values(#{topic},#{userid},#{position},#{posidetail},#{shape},#{area},#{houseage},#{price},#{type},#{img},#{creattime},#{description})")
	public void insert(House h);
}
