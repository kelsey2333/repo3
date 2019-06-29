/**
 * @Author wpzhang
 * @Date 2019/6/29
 * @Description
 */
package domian;

/**
 * @program: springDay05
 * @description:
 * @author: wpzhang
 * @create: 2019-06-29 09:13
 **/
public class User {
    public User(){}

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}