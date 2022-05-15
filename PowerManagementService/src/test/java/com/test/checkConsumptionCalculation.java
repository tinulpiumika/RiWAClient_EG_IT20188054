package com.test;


import static org.junit.Assert.assertEquals;
//import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;


import util.CalcUtility;

class checkConsumptionCalculation {
	

	@Test
	void test() {
		
		int[] result = CalcUtility.calculateUsedUnits(1670, "19898666", "2022-05-04");
		//previous month reading = 1500
		//1670 - 1500 = 170
		
		assertEquals(170 , result[1]);

	}

}
