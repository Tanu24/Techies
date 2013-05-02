package was.commoncode.bean;

public class UserBean {
  private String username = null;
    private String password = null;  
    private String birthdate=null;
    private String contactnumber=null;
    private String emailid = null;
    private String address = null;
    private String postalcode=null;
    private String city = null;
    private String state = null;
    private String country = null;
    private String sex = null;
    private String cPassword=null;
    private String securityquestion=null;
    private String securityanswer=null;
    private String logintype=null;
    
    
    public String getUsername() {
    	return username;
        }

        /**
         * Set name
         * @param <code>String</code>
         */
        public void setUsername(String n) {
    	this.username = n;
        }
        
        public String getLogintype() {
        	return logintype;
            }

            public void setLogintype(String n) {
            	System.out.print("wsbnkjbd");
        	this.logintype = n;
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
             * @param <code>String</code>*/
             
            public void setPassword(String p) {
        	this.password = p;
            }
            
           public String getcPassword() {
            	return cPassword;
                }
            
            public void setcPassword(String q) {
        	this.cPassword = q;
            } 
        
    	public String getContactnumber() {
    		return contactnumber;
    	}
    	
    	public void setContactnumber(String m) {
    		this.contactnumber=m;
    		
    	}

    	public String getEmailid() {
    		System.out.print(emailid);
    		return emailid;
    	}

    	public void setEmailid(String emailid) {
    		this.emailid = emailid;
    	}

    	public String getCity() {
    		return city;
    	}

    	public void setCity(String city) {
    		this.city = city;
    	}

    	public String getState() {
    		return state;
    	}

    	public void setState(String state) {
    		this.state= state;
    	}

    	public String getSecurityquestion() {
    		return securityquestion;
    	}

    	public void setSecurityquestion(String p) {
    		this.securityquestion= p;
    	}
    	
    	public String getCountry() {
    		return country;
    	}

    	public void setCountry(String p) {
    		this.country= p;
    	}
    	public String getSecurityanswer() {
    		return securityanswer;
    	}

    	public void setSecurityanswer(String p) {
    		this.securityanswer= p;
    	}
    	public String getPostalcode() {
    		return postalcode;
    	}

    	public void setPostalcode(String postalcode) {
    		this.postalcode = postalcode;
    	}
        
    	public String getSex() {
    		return sex;
    	}

    	public void setSex(String sex) {
    		this.sex= sex;
    	}

        /**
         * Get date_of_birth
         * @return String*/
         
        public String getBirthdate() {
    	return birthdate;
        }

        /**
         * Set date_of_birth
         * @param <code>String</code>
         */
        public void setBirthdate(String s) {
    	this.birthdate = s;
        }
       
    	public String getAddress() {
    		return address;
    	}

    	public void setAddress(String address) {
    		this.address = address;
    	}
	
}

