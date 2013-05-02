package was.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * Form bean for a Struts application.
 * Users may access 3 fields on this form:
 * <ul>
 * <li>username 
 * <li>password
 * <li>login type
 * </ul>
 * @version   1.0
 * @author
 */
public class LoginForm extends ActionForm

{	private static final long serialVersionUID = 1L;
private String username = null;
 private String password = null;
 private String logintype=null;
    public LoginForm(){
    	super();
    }
    /**
     * Get username
     * @return String
     */
    public String getUsername() {
	return username;
    }

    /**
     * Set username
     * @param <code>String</code>
     */
    public void setUsername(String u) {
	this.username = u;
    }

    /**
     * Get password
     * @return String
     */
    public String getPassword() {
	return password;
    }

    /**
     * Set password
     * @param <code>String</code>
     */
    public void setPassword(String p) {
	this.password = p;
    }
    public String getLogintype() {
    	return logintype;
        }

        public void setLogintype(String u) {
    	this.logintype = u;
        }


    public void reset(ActionMapping mapping, HttpServletRequest request) {

	// Reset values are provided as samples only. Change as appropriate.

	username = null;
	password = null;
    logintype=null;
    }

    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {

	ActionErrors errors = new ActionErrors();
	// Validate the fields in your form, adding
	// adding each error to this.errors as found, e.g.
	if ((username == null) || (username.length() == 0)) {
		  errors.add("username", new org.apache.struts.action.ActionError("error.username.required"));
		 }
	if ((password == null) || (password.length() == 0)) {
	  errors.add("password", new org.apache.struts.action.ActionError("error.password.required"));
	 }
	if ((logintype == null) || (logintype.length() == 0)) {
		  errors.add("logintype", new org.apache.struts.action.ActionError("error.logintype.required"));
		 }
	return errors;

    }
}
