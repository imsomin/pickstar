package com.sm.action;

public class ActionForward {
	private String path;		//��������(*.jsp)�� ��ο� ���ϸ��� ������ ����
	private boolean isRedirect;	//������ ��ȯ ��� -> �����̷�Ʈ
							
	//Getter Setter
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

}
