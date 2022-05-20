package javacode;

public class user {

	private String uname;
	private String password;
	private String pubkey;
	private float balance;
    private String identitynum;


	public user(String uname,String password, String pubkey,float balance,String identitynum) {
		this.uname=uname;
		this.password=password;
		this.pubkey=pubkey;
		this.balance=balance;
        this.identitynum=identitynum;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname=uname;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password=password;
	}

	public String getPubKey() {
		return pubkey;
	}

	public void setPubKey(String pubkey) {
		this.pubkey=pubkey;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance=balance;

	}
    public String getIdentitynum() {
        return identitynum;
    }

    public void setIdentitynum(String identitynum) {
        this.identitynum=identitynum;

    }
}
