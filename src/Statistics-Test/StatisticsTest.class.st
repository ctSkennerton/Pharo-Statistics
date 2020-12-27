Class {
	#name : #StatisticsTest,
	#superclass : #TestCase,
	#category : #'Statistics-Test'
}

{ #category : #tests }
StatisticsTest >> testGeometricMean [
	
	self assert: #(1 1 2 3 4 5 5 6 6 7 8 9) geometricMean equals: 3.8583980015011208.
	
	self assert: { 4. 1.  1 / 32} geometricMean equals: (1/2).
	
	self assert: #(3.14 1 4.56 0.333) geometricMean equals: 1.4776945822943937.
]

{ #category : #tests }
StatisticsTest >> testHarmonicMean [
			
	| c |
	c := #(2.5 3 10).
	self assert: (c harmonicMean round: 1) equals: 3.6.
]

{ #category : #tests }
StatisticsTest >> testMode [
		
			
	| c |
	c := #(1 2 3 4 5 5).
	self assert: c mode equals: 5.
	
	c := #(5 6 8 3 3 3 2 2 2).
	self assert: c mode equals: 2.
	
	c := #(1.1 1.2 1.1 3.4).
	self assert: c mode equals: 1.1.
	
	c := #(dat1 dat2 dat4 dat1 dat4 dat4 dat2 dat9 dat8).
	self assert: c mode equals: 'dat4'.
	
]
