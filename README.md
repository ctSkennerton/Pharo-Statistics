# Pharo-Statistics
Methods for calculating statistics on Collections in Pharo Smalltalk.

The Collection and SortedCollection classes already implements the mean (`average`), standard deviation (`stdev`), variance (`variance`), and median (`median`).

This package extends those classes to implement:

- the harmonic and geometric mean (`harmonicMean` & `geometricMean`)
- mode (`mode`)
- quantiles (`quantile:`) to calculate any quantile and shortcut messages to access the first and third quartile (`firstQuartile` & `thirdQuartile`)

