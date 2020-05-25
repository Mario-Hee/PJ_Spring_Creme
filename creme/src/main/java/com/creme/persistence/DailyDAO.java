package com.creme.persistence;

public interface DailyDAO {
	// 등록, 조회, 수정, 삭제
	
	// 인터페이스는 객체가 아니므로 일반메서드는 올 수 없고,
	// 추상메서드만 올 수 있다!!
	// 추상메서드란? 메서드의 {실행문} 이 없다!! 중괄호가 없다
	// 추상메서드에도 데이터반환타입을 가진다.
	// 그러나 생성자메서드는 데이터반환타입을 가질 수 없다.
	
	// public abstract void dailyCreate(); <-- 인터페이스에서만 추상메서드 abstract를 삭제해도 된다!!
	
	public void dailyCreate();
	public void dailyRead();
	public void dailyUpdate();
	public void dailyDelete();

}
