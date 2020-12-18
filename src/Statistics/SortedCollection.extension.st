Extension { #name : #SortedCollection }

{ #category : #'*Statistics' }
SortedCollection >> firstQuartile [
	"The first quartile is 25% through a sorted dataset or halfway between the minimum value and the median"
		
	^self quantile: 0.25
]

{ #category : #'*Statistics' }
SortedCollection >> quantile: aFloat [
	"calculate a given quantile
	
	Suppose that a sample has N observations that are sorted so that x[1] ≤ x[2] ≤ ... ≤ x[N], and suppose that you are interested in estimating the p_th quantile (0 ≤ p ≤ 1) for the population. Intuitively, the data values near x[j], where j = floor(Np) are reasonable values to use to estimate the quantile. For example, if N=10 and you want to estimate the quantile for p=0.64, then j = floor(Np) = 6, so you can use the sixth ordered value (x[6]) and maybe other nearby values to estimate the quantile.

Hyndman and Fan (henceforth H&F) note that the quantile definitions in statistical software have three properties in common:

- The value p and the sample size N are used to determine two adjacent data values, x[j]and x[j+1]. The quantile estimate will be in the closed interval between those data points. For the previous example, the quantile estimate would be in the closed interval between x[6] and x[7].
- For many methods, a fractional quantity is used to determine an interpolation parameter, λ. For the previous example, the fraction quantity is (Np - j) = (6.4 - 6) = 0.4. If you use λ = 0.4, then an estimate the 64th percentile would be the value 40% of the way between x[6] and x[7].
- Each definition has a parameter m, 0 ≤ m ≤ 1, which determines how the method interpolates between adjacent data points. In general, the methods define the index j by using j = floor(Np + m). The previous example used m=0, but other choices include m=0.5 or values of m that depend on p.

Thus a general formula for quantile estimates is q = (1 - λ) x[j]+ λ x[j+1], where λ and j depend on the values of p, N, and a method-specific parameter m.

You can read Hyndman and Fan (1986) for details or see the Wikipedia article about quantiles for a summary. The Wikipedia article points out a practical consideration: for values of p that are very close to 0 or 1, some definitions need to be slightly modified. For example, if p < 1/N, the quantity Np < 1 and so j = floor(Np) equals 0, which is an invalid index. The convention is to return x[1] when p is very small and return x[N] when p is very close to 1.

	"	
			
	| n j lambda |
	n := self size.
	j := (n * aFloat) floor.
	lambda := n * aFloat - j. 
	^(1 - lambda * self at: j ) + (lambda * self at: j + 1).

]

{ #category : #'*Statistics' }
SortedCollection >> thirdQuartile [
	"The third quartile is 75% of the way through a sorted dataset or halfway between the median and the maximum value"
			
	^self quantile: 0.75
]
