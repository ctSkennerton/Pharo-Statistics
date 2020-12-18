Extension { #name : #Collection }

{ #category : #'*Statistics' }
Collection >> geometricMean [
	"Answer with the geometric mean of the collection
	
	Examples:
	#(1 1 2 3 4 5 5 6 6 7 8 9) geometricMean  >>> 3.8583980015011208
	
	{ 4. 1.  1 / 32} geometricMean >>> (1/2)
	
	#(3.14 1 4.56 0.333) geometricMean >>> 1.4776945822943937
	"

	^(self reduce: [ :a :b | a * b ] ) raisedToFraction:  1 / self size.
]

{ #category : #'*Statistics' }
Collection >> harmonicMean [
	"Answer with the harmonic mean of the data.
	
	Example:
	#(2.5, 3, 10) harmonicMean >>> 3.6
	"
	| sum |
	sum := 0.
	
	self do: [ :i | i < 0 
		ifTrue: [Error new signal: 'The harmonic mean cannot be calculated on negative numbers'] 		ifFalse: [ sum := (sum + (1 / i))]
		].
	^self size / sum.
	
]

{ #category : #'*Statistics' }
Collection >> mode [
	"answers with the most common value in a collection.
	
	If there are values that are equally common then the one that is 
	encountered first is returned
	
	Examples:
	#(1 2 2 2 3 4 5) mode  >>> 2
	
	#(5 5 1 1 2 3 4) mode  >>> 5
	"
		
	| maxVal maxKey dict |
	
	dict := Dictionary new.
	self do: [ :i | dict at: i update: [ :value | value + 1 ] initial: [ 1 ] ].
	maxVal := 0.
	maxKey := nil.
	
	dict keysAndValuesDo:  [ :k :v | v > maxVal ifTrue: [ maxVal := v. maxKey := k ] ].
	^maxKey
]
