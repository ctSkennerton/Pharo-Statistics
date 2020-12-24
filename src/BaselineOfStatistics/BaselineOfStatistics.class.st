Class {
	#name : #BaselineOfStatistics,
	#superclass : #BaselineOf,
	#category : #BaselineOfStatistics
}

{ #category : #baselines }
BaselineOfStatistics >> baseline: spec [
	<baseline>
	spec 
	  for: #common
	  do: [ spec package: 'Statistics' ]	

]
