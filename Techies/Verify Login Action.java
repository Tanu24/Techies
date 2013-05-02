package was.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import was.forms.LoginForm;
import was.database.DatabaseAccess1;
import was.common.PasswordService;

/**
 * @version   1.0
 * @author
 */
public class VerifyLoginAction extends Action

{

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionErrors errors = new ActionErrors();
      ActionForward forward = new ActionForward(); // return value
        LoginForm loginForm = (LoginForm)form;
        String username = loginForm.getUsername();	//gives the password entered by the user in the form
        String password = loginForm.getPassword();
        String logintype=loginForm.getLogintype();
        String encrypedInputPassword =null;
        String dbPassword=null;
        try{
        	
        	DatabaseAccess1 dbObject = new DatabaseAccess1();
            if(logintype.equals("")) {
        		
        		errors.add("logintype", new ActionError("error.logintype"));
        	}
        	dbPassword = dbObject.getPassword(username,logintype);//gives the password from the db corresponding to the entered username
        	encrypedInputPassword = PasswordService.getInstance().encrypt(password);
        	if(dbPassword.equals("")) {
        		
        		errors.add("password", new ActionError("error.password"));
        	}
           if(username.equals("")) {
        		
        		errors.add("username", new ActionError("error.username"));
        	}else if(!encrypedInputPassword.equals(dbPassword)) {
        		errors.add("password", new ActionError("error.password"));
        		System.out.println("Not equal");
        	} else {
        		
        			System.out.println("Equal");
        			request.getSession().setAttribute("loginType", logintype);
            		request.getSession().setAttribute("username", username);
        	}
        } catch (Exception e) {

            // Report the error using the appropriate name and ID.
            errors.add("username", new ActionError("error.username"));

        }

        // If a message is required, save the specified key(s)
        // into the request for use by the <struts:errors> tag.

        if (!errors.isEmpty()) {
            saveErrors(request, errors);
            // Forward control to the appropriate 'failure' URI (change name as desired)
            	forward = mapping.findForward("failure");

        } else {

            // Forward control to the appropriate 'success' URI (change name as desired
    			forward = mapping.findForward("success");
 }

        // Finish with
        return (forward);

    }
}
