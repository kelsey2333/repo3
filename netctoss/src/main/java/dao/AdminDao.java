package dao;

import domain.Menu;
import domain.User;

import java.util.List;

public interface AdminDao {
    /**
     * @Param
     * @description 根据用户名查询用户
     * @date 2019/6/11 18:54
     * @return
     */
    User selectUser(String loginName);
    /**
     * @Param
     * @description 根据用户id查询关联菜单
     * @date 2019/6/11 18:54
     * @return
     */
    List<Menu> selectMenuById(Integer id);

}
