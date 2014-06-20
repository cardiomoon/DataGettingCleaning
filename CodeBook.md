---
title: "CodeBook.md"
output: html_document
---

Activity Labels
================
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING


 Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal     
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean   
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector are as follows.

Complete List of Feature Vector
================================


```r
features=read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
features
```

```
     V1                                   V2
1     1                    tBodyAcc-mean()-X
2     2                    tBodyAcc-mean()-Y
3     3                    tBodyAcc-mean()-Z
4     4                     tBodyAcc-std()-X
5     5                     tBodyAcc-std()-Y
6     6                     tBodyAcc-std()-Z
7     7                     tBodyAcc-mad()-X
8     8                     tBodyAcc-mad()-Y
9     9                     tBodyAcc-mad()-Z
10   10                     tBodyAcc-max()-X
11   11                     tBodyAcc-max()-Y
12   12                     tBodyAcc-max()-Z
13   13                     tBodyAcc-min()-X
14   14                     tBodyAcc-min()-Y
15   15                     tBodyAcc-min()-Z
16   16                       tBodyAcc-sma()
17   17                  tBodyAcc-energy()-X
18   18                  tBodyAcc-energy()-Y
19   19                  tBodyAcc-energy()-Z
20   20                     tBodyAcc-iqr()-X
21   21                     tBodyAcc-iqr()-Y
22   22                     tBodyAcc-iqr()-Z
23   23                 tBodyAcc-entropy()-X
24   24                 tBodyAcc-entropy()-Y
25   25                 tBodyAcc-entropy()-Z
26   26               tBodyAcc-arCoeff()-X,1
27   27               tBodyAcc-arCoeff()-X,2
28   28               tBodyAcc-arCoeff()-X,3
29   29               tBodyAcc-arCoeff()-X,4
30   30               tBodyAcc-arCoeff()-Y,1
31   31               tBodyAcc-arCoeff()-Y,2
32   32               tBodyAcc-arCoeff()-Y,3
33   33               tBodyAcc-arCoeff()-Y,4
34   34               tBodyAcc-arCoeff()-Z,1
35   35               tBodyAcc-arCoeff()-Z,2
36   36               tBodyAcc-arCoeff()-Z,3
37   37               tBodyAcc-arCoeff()-Z,4
38   38           tBodyAcc-correlation()-X,Y
39   39           tBodyAcc-correlation()-X,Z
40   40           tBodyAcc-correlation()-Y,Z
41   41                 tGravityAcc-mean()-X
42   42                 tGravityAcc-mean()-Y
43   43                 tGravityAcc-mean()-Z
44   44                  tGravityAcc-std()-X
45   45                  tGravityAcc-std()-Y
46   46                  tGravityAcc-std()-Z
47   47                  tGravityAcc-mad()-X
48   48                  tGravityAcc-mad()-Y
49   49                  tGravityAcc-mad()-Z
50   50                  tGravityAcc-max()-X
51   51                  tGravityAcc-max()-Y
52   52                  tGravityAcc-max()-Z
53   53                  tGravityAcc-min()-X
54   54                  tGravityAcc-min()-Y
55   55                  tGravityAcc-min()-Z
56   56                    tGravityAcc-sma()
57   57               tGravityAcc-energy()-X
58   58               tGravityAcc-energy()-Y
59   59               tGravityAcc-energy()-Z
60   60                  tGravityAcc-iqr()-X
61   61                  tGravityAcc-iqr()-Y
62   62                  tGravityAcc-iqr()-Z
63   63              tGravityAcc-entropy()-X
64   64              tGravityAcc-entropy()-Y
65   65              tGravityAcc-entropy()-Z
66   66            tGravityAcc-arCoeff()-X,1
67   67            tGravityAcc-arCoeff()-X,2
68   68            tGravityAcc-arCoeff()-X,3
69   69            tGravityAcc-arCoeff()-X,4
70   70            tGravityAcc-arCoeff()-Y,1
71   71            tGravityAcc-arCoeff()-Y,2
72   72            tGravityAcc-arCoeff()-Y,3
73   73            tGravityAcc-arCoeff()-Y,4
74   74            tGravityAcc-arCoeff()-Z,1
75   75            tGravityAcc-arCoeff()-Z,2
76   76            tGravityAcc-arCoeff()-Z,3
77   77            tGravityAcc-arCoeff()-Z,4
78   78        tGravityAcc-correlation()-X,Y
79   79        tGravityAcc-correlation()-X,Z
80   80        tGravityAcc-correlation()-Y,Z
81   81                tBodyAccJerk-mean()-X
82   82                tBodyAccJerk-mean()-Y
83   83                tBodyAccJerk-mean()-Z
84   84                 tBodyAccJerk-std()-X
85   85                 tBodyAccJerk-std()-Y
86   86                 tBodyAccJerk-std()-Z
87   87                 tBodyAccJerk-mad()-X
88   88                 tBodyAccJerk-mad()-Y
89   89                 tBodyAccJerk-mad()-Z
90   90                 tBodyAccJerk-max()-X
91   91                 tBodyAccJerk-max()-Y
92   92                 tBodyAccJerk-max()-Z
93   93                 tBodyAccJerk-min()-X
94   94                 tBodyAccJerk-min()-Y
95   95                 tBodyAccJerk-min()-Z
96   96                   tBodyAccJerk-sma()
97   97              tBodyAccJerk-energy()-X
98   98              tBodyAccJerk-energy()-Y
99   99              tBodyAccJerk-energy()-Z
100 100                 tBodyAccJerk-iqr()-X
101 101                 tBodyAccJerk-iqr()-Y
102 102                 tBodyAccJerk-iqr()-Z
103 103             tBodyAccJerk-entropy()-X
104 104             tBodyAccJerk-entropy()-Y
105 105             tBodyAccJerk-entropy()-Z
106 106           tBodyAccJerk-arCoeff()-X,1
107 107           tBodyAccJerk-arCoeff()-X,2
108 108           tBodyAccJerk-arCoeff()-X,3
109 109           tBodyAccJerk-arCoeff()-X,4
110 110           tBodyAccJerk-arCoeff()-Y,1
111 111           tBodyAccJerk-arCoeff()-Y,2
112 112           tBodyAccJerk-arCoeff()-Y,3
113 113           tBodyAccJerk-arCoeff()-Y,4
114 114           tBodyAccJerk-arCoeff()-Z,1
115 115           tBodyAccJerk-arCoeff()-Z,2
116 116           tBodyAccJerk-arCoeff()-Z,3
117 117           tBodyAccJerk-arCoeff()-Z,4
118 118       tBodyAccJerk-correlation()-X,Y
119 119       tBodyAccJerk-correlation()-X,Z
120 120       tBodyAccJerk-correlation()-Y,Z
121 121                   tBodyGyro-mean()-X
122 122                   tBodyGyro-mean()-Y
123 123                   tBodyGyro-mean()-Z
124 124                    tBodyGyro-std()-X
125 125                    tBodyGyro-std()-Y
126 126                    tBodyGyro-std()-Z
127 127                    tBodyGyro-mad()-X
128 128                    tBodyGyro-mad()-Y
129 129                    tBodyGyro-mad()-Z
130 130                    tBodyGyro-max()-X
131 131                    tBodyGyro-max()-Y
132 132                    tBodyGyro-max()-Z
133 133                    tBodyGyro-min()-X
134 134                    tBodyGyro-min()-Y
135 135                    tBodyGyro-min()-Z
136 136                      tBodyGyro-sma()
137 137                 tBodyGyro-energy()-X
138 138                 tBodyGyro-energy()-Y
139 139                 tBodyGyro-energy()-Z
140 140                    tBodyGyro-iqr()-X
141 141                    tBodyGyro-iqr()-Y
142 142                    tBodyGyro-iqr()-Z
143 143                tBodyGyro-entropy()-X
144 144                tBodyGyro-entropy()-Y
145 145                tBodyGyro-entropy()-Z
146 146              tBodyGyro-arCoeff()-X,1
147 147              tBodyGyro-arCoeff()-X,2
148 148              tBodyGyro-arCoeff()-X,3
149 149              tBodyGyro-arCoeff()-X,4
150 150              tBodyGyro-arCoeff()-Y,1
151 151              tBodyGyro-arCoeff()-Y,2
152 152              tBodyGyro-arCoeff()-Y,3
153 153              tBodyGyro-arCoeff()-Y,4
154 154              tBodyGyro-arCoeff()-Z,1
155 155              tBodyGyro-arCoeff()-Z,2
156 156              tBodyGyro-arCoeff()-Z,3
157 157              tBodyGyro-arCoeff()-Z,4
158 158          tBodyGyro-correlation()-X,Y
159 159          tBodyGyro-correlation()-X,Z
160 160          tBodyGyro-correlation()-Y,Z
161 161               tBodyGyroJerk-mean()-X
162 162               tBodyGyroJerk-mean()-Y
163 163               tBodyGyroJerk-mean()-Z
164 164                tBodyGyroJerk-std()-X
165 165                tBodyGyroJerk-std()-Y
166 166                tBodyGyroJerk-std()-Z
167 167                tBodyGyroJerk-mad()-X
168 168                tBodyGyroJerk-mad()-Y
169 169                tBodyGyroJerk-mad()-Z
170 170                tBodyGyroJerk-max()-X
171 171                tBodyGyroJerk-max()-Y
172 172                tBodyGyroJerk-max()-Z
173 173                tBodyGyroJerk-min()-X
174 174                tBodyGyroJerk-min()-Y
175 175                tBodyGyroJerk-min()-Z
176 176                  tBodyGyroJerk-sma()
177 177             tBodyGyroJerk-energy()-X
178 178             tBodyGyroJerk-energy()-Y
179 179             tBodyGyroJerk-energy()-Z
180 180                tBodyGyroJerk-iqr()-X
181 181                tBodyGyroJerk-iqr()-Y
182 182                tBodyGyroJerk-iqr()-Z
183 183            tBodyGyroJerk-entropy()-X
184 184            tBodyGyroJerk-entropy()-Y
185 185            tBodyGyroJerk-entropy()-Z
186 186          tBodyGyroJerk-arCoeff()-X,1
187 187          tBodyGyroJerk-arCoeff()-X,2
188 188          tBodyGyroJerk-arCoeff()-X,3
189 189          tBodyGyroJerk-arCoeff()-X,4
190 190          tBodyGyroJerk-arCoeff()-Y,1
191 191          tBodyGyroJerk-arCoeff()-Y,2
192 192          tBodyGyroJerk-arCoeff()-Y,3
193 193          tBodyGyroJerk-arCoeff()-Y,4
194 194          tBodyGyroJerk-arCoeff()-Z,1
195 195          tBodyGyroJerk-arCoeff()-Z,2
196 196          tBodyGyroJerk-arCoeff()-Z,3
197 197          tBodyGyroJerk-arCoeff()-Z,4
198 198      tBodyGyroJerk-correlation()-X,Y
199 199      tBodyGyroJerk-correlation()-X,Z
200 200      tBodyGyroJerk-correlation()-Y,Z
201 201                   tBodyAccMag-mean()
202 202                    tBodyAccMag-std()
203 203                    tBodyAccMag-mad()
204 204                    tBodyAccMag-max()
205 205                    tBodyAccMag-min()
206 206                    tBodyAccMag-sma()
207 207                 tBodyAccMag-energy()
208 208                    tBodyAccMag-iqr()
209 209                tBodyAccMag-entropy()
210 210               tBodyAccMag-arCoeff()1
211 211               tBodyAccMag-arCoeff()2
212 212               tBodyAccMag-arCoeff()3
213 213               tBodyAccMag-arCoeff()4
214 214                tGravityAccMag-mean()
215 215                 tGravityAccMag-std()
216 216                 tGravityAccMag-mad()
217 217                 tGravityAccMag-max()
218 218                 tGravityAccMag-min()
219 219                 tGravityAccMag-sma()
220 220              tGravityAccMag-energy()
221 221                 tGravityAccMag-iqr()
222 222             tGravityAccMag-entropy()
223 223            tGravityAccMag-arCoeff()1
224 224            tGravityAccMag-arCoeff()2
225 225            tGravityAccMag-arCoeff()3
226 226            tGravityAccMag-arCoeff()4
227 227               tBodyAccJerkMag-mean()
228 228                tBodyAccJerkMag-std()
229 229                tBodyAccJerkMag-mad()
230 230                tBodyAccJerkMag-max()
231 231                tBodyAccJerkMag-min()
232 232                tBodyAccJerkMag-sma()
233 233             tBodyAccJerkMag-energy()
234 234                tBodyAccJerkMag-iqr()
235 235            tBodyAccJerkMag-entropy()
236 236           tBodyAccJerkMag-arCoeff()1
237 237           tBodyAccJerkMag-arCoeff()2
238 238           tBodyAccJerkMag-arCoeff()3
239 239           tBodyAccJerkMag-arCoeff()4
240 240                  tBodyGyroMag-mean()
241 241                   tBodyGyroMag-std()
242 242                   tBodyGyroMag-mad()
243 243                   tBodyGyroMag-max()
244 244                   tBodyGyroMag-min()
245 245                   tBodyGyroMag-sma()
246 246                tBodyGyroMag-energy()
247 247                   tBodyGyroMag-iqr()
248 248               tBodyGyroMag-entropy()
249 249              tBodyGyroMag-arCoeff()1
250 250              tBodyGyroMag-arCoeff()2
251 251              tBodyGyroMag-arCoeff()3
252 252              tBodyGyroMag-arCoeff()4
253 253              tBodyGyroJerkMag-mean()
254 254               tBodyGyroJerkMag-std()
255 255               tBodyGyroJerkMag-mad()
256 256               tBodyGyroJerkMag-max()
257 257               tBodyGyroJerkMag-min()
258 258               tBodyGyroJerkMag-sma()
259 259            tBodyGyroJerkMag-energy()
260 260               tBodyGyroJerkMag-iqr()
261 261           tBodyGyroJerkMag-entropy()
262 262          tBodyGyroJerkMag-arCoeff()1
263 263          tBodyGyroJerkMag-arCoeff()2
264 264          tBodyGyroJerkMag-arCoeff()3
265 265          tBodyGyroJerkMag-arCoeff()4
266 266                    fBodyAcc-mean()-X
267 267                    fBodyAcc-mean()-Y
268 268                    fBodyAcc-mean()-Z
269 269                     fBodyAcc-std()-X
270 270                     fBodyAcc-std()-Y
271 271                     fBodyAcc-std()-Z
272 272                     fBodyAcc-mad()-X
273 273                     fBodyAcc-mad()-Y
274 274                     fBodyAcc-mad()-Z
275 275                     fBodyAcc-max()-X
276 276                     fBodyAcc-max()-Y
277 277                     fBodyAcc-max()-Z
278 278                     fBodyAcc-min()-X
279 279                     fBodyAcc-min()-Y
280 280                     fBodyAcc-min()-Z
281 281                       fBodyAcc-sma()
282 282                  fBodyAcc-energy()-X
283 283                  fBodyAcc-energy()-Y
284 284                  fBodyAcc-energy()-Z
285 285                     fBodyAcc-iqr()-X
286 286                     fBodyAcc-iqr()-Y
287 287                     fBodyAcc-iqr()-Z
288 288                 fBodyAcc-entropy()-X
289 289                 fBodyAcc-entropy()-Y
290 290                 fBodyAcc-entropy()-Z
291 291                   fBodyAcc-maxInds-X
292 292                   fBodyAcc-maxInds-Y
293 293                   fBodyAcc-maxInds-Z
294 294                fBodyAcc-meanFreq()-X
295 295                fBodyAcc-meanFreq()-Y
296 296                fBodyAcc-meanFreq()-Z
297 297                fBodyAcc-skewness()-X
298 298                fBodyAcc-kurtosis()-X
299 299                fBodyAcc-skewness()-Y
300 300                fBodyAcc-kurtosis()-Y
301 301                fBodyAcc-skewness()-Z
302 302                fBodyAcc-kurtosis()-Z
303 303           fBodyAcc-bandsEnergy()-1,8
304 304          fBodyAcc-bandsEnergy()-9,16
305 305         fBodyAcc-bandsEnergy()-17,24
306 306         fBodyAcc-bandsEnergy()-25,32
307 307         fBodyAcc-bandsEnergy()-33,40
308 308         fBodyAcc-bandsEnergy()-41,48
309 309         fBodyAcc-bandsEnergy()-49,56
310 310         fBodyAcc-bandsEnergy()-57,64
311 311          fBodyAcc-bandsEnergy()-1,16
312 312         fBodyAcc-bandsEnergy()-17,32
313 313         fBodyAcc-bandsEnergy()-33,48
314 314         fBodyAcc-bandsEnergy()-49,64
315 315          fBodyAcc-bandsEnergy()-1,24
316 316         fBodyAcc-bandsEnergy()-25,48
317 317           fBodyAcc-bandsEnergy()-1,8
318 318          fBodyAcc-bandsEnergy()-9,16
319 319         fBodyAcc-bandsEnergy()-17,24
320 320         fBodyAcc-bandsEnergy()-25,32
321 321         fBodyAcc-bandsEnergy()-33,40
322 322         fBodyAcc-bandsEnergy()-41,48
323 323         fBodyAcc-bandsEnergy()-49,56
324 324         fBodyAcc-bandsEnergy()-57,64
325 325          fBodyAcc-bandsEnergy()-1,16
326 326         fBodyAcc-bandsEnergy()-17,32
327 327         fBodyAcc-bandsEnergy()-33,48
328 328         fBodyAcc-bandsEnergy()-49,64
329 329          fBodyAcc-bandsEnergy()-1,24
330 330         fBodyAcc-bandsEnergy()-25,48
331 331           fBodyAcc-bandsEnergy()-1,8
332 332          fBodyAcc-bandsEnergy()-9,16
333 333         fBodyAcc-bandsEnergy()-17,24
334 334         fBodyAcc-bandsEnergy()-25,32
335 335         fBodyAcc-bandsEnergy()-33,40
336 336         fBodyAcc-bandsEnergy()-41,48
337 337         fBodyAcc-bandsEnergy()-49,56
338 338         fBodyAcc-bandsEnergy()-57,64
339 339          fBodyAcc-bandsEnergy()-1,16
340 340         fBodyAcc-bandsEnergy()-17,32
341 341         fBodyAcc-bandsEnergy()-33,48
342 342         fBodyAcc-bandsEnergy()-49,64
343 343          fBodyAcc-bandsEnergy()-1,24
344 344         fBodyAcc-bandsEnergy()-25,48
345 345                fBodyAccJerk-mean()-X
346 346                fBodyAccJerk-mean()-Y
347 347                fBodyAccJerk-mean()-Z
348 348                 fBodyAccJerk-std()-X
349 349                 fBodyAccJerk-std()-Y
350 350                 fBodyAccJerk-std()-Z
351 351                 fBodyAccJerk-mad()-X
352 352                 fBodyAccJerk-mad()-Y
353 353                 fBodyAccJerk-mad()-Z
354 354                 fBodyAccJerk-max()-X
355 355                 fBodyAccJerk-max()-Y
356 356                 fBodyAccJerk-max()-Z
357 357                 fBodyAccJerk-min()-X
358 358                 fBodyAccJerk-min()-Y
359 359                 fBodyAccJerk-min()-Z
360 360                   fBodyAccJerk-sma()
361 361              fBodyAccJerk-energy()-X
362 362              fBodyAccJerk-energy()-Y
363 363              fBodyAccJerk-energy()-Z
364 364                 fBodyAccJerk-iqr()-X
365 365                 fBodyAccJerk-iqr()-Y
366 366                 fBodyAccJerk-iqr()-Z
367 367             fBodyAccJerk-entropy()-X
368 368             fBodyAccJerk-entropy()-Y
369 369             fBodyAccJerk-entropy()-Z
370 370               fBodyAccJerk-maxInds-X
371 371               fBodyAccJerk-maxInds-Y
372 372               fBodyAccJerk-maxInds-Z
373 373            fBodyAccJerk-meanFreq()-X
374 374            fBodyAccJerk-meanFreq()-Y
375 375            fBodyAccJerk-meanFreq()-Z
376 376            fBodyAccJerk-skewness()-X
377 377            fBodyAccJerk-kurtosis()-X
378 378            fBodyAccJerk-skewness()-Y
379 379            fBodyAccJerk-kurtosis()-Y
380 380            fBodyAccJerk-skewness()-Z
381 381            fBodyAccJerk-kurtosis()-Z
382 382       fBodyAccJerk-bandsEnergy()-1,8
383 383      fBodyAccJerk-bandsEnergy()-9,16
384 384     fBodyAccJerk-bandsEnergy()-17,24
385 385     fBodyAccJerk-bandsEnergy()-25,32
386 386     fBodyAccJerk-bandsEnergy()-33,40
387 387     fBodyAccJerk-bandsEnergy()-41,48
388 388     fBodyAccJerk-bandsEnergy()-49,56
389 389     fBodyAccJerk-bandsEnergy()-57,64
390 390      fBodyAccJerk-bandsEnergy()-1,16
391 391     fBodyAccJerk-bandsEnergy()-17,32
392 392     fBodyAccJerk-bandsEnergy()-33,48
393 393     fBodyAccJerk-bandsEnergy()-49,64
394 394      fBodyAccJerk-bandsEnergy()-1,24
395 395     fBodyAccJerk-bandsEnergy()-25,48
396 396       fBodyAccJerk-bandsEnergy()-1,8
397 397      fBodyAccJerk-bandsEnergy()-9,16
398 398     fBodyAccJerk-bandsEnergy()-17,24
399 399     fBodyAccJerk-bandsEnergy()-25,32
400 400     fBodyAccJerk-bandsEnergy()-33,40
401 401     fBodyAccJerk-bandsEnergy()-41,48
402 402     fBodyAccJerk-bandsEnergy()-49,56
403 403     fBodyAccJerk-bandsEnergy()-57,64
404 404      fBodyAccJerk-bandsEnergy()-1,16
405 405     fBodyAccJerk-bandsEnergy()-17,32
406 406     fBodyAccJerk-bandsEnergy()-33,48
407 407     fBodyAccJerk-bandsEnergy()-49,64
408 408      fBodyAccJerk-bandsEnergy()-1,24
409 409     fBodyAccJerk-bandsEnergy()-25,48
410 410       fBodyAccJerk-bandsEnergy()-1,8
411 411      fBodyAccJerk-bandsEnergy()-9,16
412 412     fBodyAccJerk-bandsEnergy()-17,24
413 413     fBodyAccJerk-bandsEnergy()-25,32
414 414     fBodyAccJerk-bandsEnergy()-33,40
415 415     fBodyAccJerk-bandsEnergy()-41,48
416 416     fBodyAccJerk-bandsEnergy()-49,56
417 417     fBodyAccJerk-bandsEnergy()-57,64
418 418      fBodyAccJerk-bandsEnergy()-1,16
419 419     fBodyAccJerk-bandsEnergy()-17,32
420 420     fBodyAccJerk-bandsEnergy()-33,48
421 421     fBodyAccJerk-bandsEnergy()-49,64
422 422      fBodyAccJerk-bandsEnergy()-1,24
423 423     fBodyAccJerk-bandsEnergy()-25,48
424 424                   fBodyGyro-mean()-X
425 425                   fBodyGyro-mean()-Y
426 426                   fBodyGyro-mean()-Z
427 427                    fBodyGyro-std()-X
428 428                    fBodyGyro-std()-Y
429 429                    fBodyGyro-std()-Z
430 430                    fBodyGyro-mad()-X
431 431                    fBodyGyro-mad()-Y
432 432                    fBodyGyro-mad()-Z
433 433                    fBodyGyro-max()-X
434 434                    fBodyGyro-max()-Y
435 435                    fBodyGyro-max()-Z
436 436                    fBodyGyro-min()-X
437 437                    fBodyGyro-min()-Y
438 438                    fBodyGyro-min()-Z
439 439                      fBodyGyro-sma()
440 440                 fBodyGyro-energy()-X
441 441                 fBodyGyro-energy()-Y
442 442                 fBodyGyro-energy()-Z
443 443                    fBodyGyro-iqr()-X
444 444                    fBodyGyro-iqr()-Y
445 445                    fBodyGyro-iqr()-Z
446 446                fBodyGyro-entropy()-X
447 447                fBodyGyro-entropy()-Y
448 448                fBodyGyro-entropy()-Z
449 449                  fBodyGyro-maxInds-X
450 450                  fBodyGyro-maxInds-Y
451 451                  fBodyGyro-maxInds-Z
452 452               fBodyGyro-meanFreq()-X
453 453               fBodyGyro-meanFreq()-Y
454 454               fBodyGyro-meanFreq()-Z
455 455               fBodyGyro-skewness()-X
456 456               fBodyGyro-kurtosis()-X
457 457               fBodyGyro-skewness()-Y
458 458               fBodyGyro-kurtosis()-Y
459 459               fBodyGyro-skewness()-Z
460 460               fBodyGyro-kurtosis()-Z
461 461          fBodyGyro-bandsEnergy()-1,8
462 462         fBodyGyro-bandsEnergy()-9,16
463 463        fBodyGyro-bandsEnergy()-17,24
464 464        fBodyGyro-bandsEnergy()-25,32
465 465        fBodyGyro-bandsEnergy()-33,40
466 466        fBodyGyro-bandsEnergy()-41,48
467 467        fBodyGyro-bandsEnergy()-49,56
468 468        fBodyGyro-bandsEnergy()-57,64
469 469         fBodyGyro-bandsEnergy()-1,16
470 470        fBodyGyro-bandsEnergy()-17,32
471 471        fBodyGyro-bandsEnergy()-33,48
472 472        fBodyGyro-bandsEnergy()-49,64
473 473         fBodyGyro-bandsEnergy()-1,24
474 474        fBodyGyro-bandsEnergy()-25,48
475 475          fBodyGyro-bandsEnergy()-1,8
476 476         fBodyGyro-bandsEnergy()-9,16
477 477        fBodyGyro-bandsEnergy()-17,24
478 478        fBodyGyro-bandsEnergy()-25,32
479 479        fBodyGyro-bandsEnergy()-33,40
480 480        fBodyGyro-bandsEnergy()-41,48
481 481        fBodyGyro-bandsEnergy()-49,56
482 482        fBodyGyro-bandsEnergy()-57,64
483 483         fBodyGyro-bandsEnergy()-1,16
484 484        fBodyGyro-bandsEnergy()-17,32
485 485        fBodyGyro-bandsEnergy()-33,48
486 486        fBodyGyro-bandsEnergy()-49,64
487 487         fBodyGyro-bandsEnergy()-1,24
488 488        fBodyGyro-bandsEnergy()-25,48
489 489          fBodyGyro-bandsEnergy()-1,8
490 490         fBodyGyro-bandsEnergy()-9,16
491 491        fBodyGyro-bandsEnergy()-17,24
492 492        fBodyGyro-bandsEnergy()-25,32
493 493        fBodyGyro-bandsEnergy()-33,40
494 494        fBodyGyro-bandsEnergy()-41,48
495 495        fBodyGyro-bandsEnergy()-49,56
496 496        fBodyGyro-bandsEnergy()-57,64
497 497         fBodyGyro-bandsEnergy()-1,16
498 498        fBodyGyro-bandsEnergy()-17,32
499 499        fBodyGyro-bandsEnergy()-33,48
500 500        fBodyGyro-bandsEnergy()-49,64
501 501         fBodyGyro-bandsEnergy()-1,24
502 502        fBodyGyro-bandsEnergy()-25,48
503 503                   fBodyAccMag-mean()
504 504                    fBodyAccMag-std()
505 505                    fBodyAccMag-mad()
506 506                    fBodyAccMag-max()
507 507                    fBodyAccMag-min()
508 508                    fBodyAccMag-sma()
509 509                 fBodyAccMag-energy()
510 510                    fBodyAccMag-iqr()
511 511                fBodyAccMag-entropy()
512 512                  fBodyAccMag-maxInds
513 513               fBodyAccMag-meanFreq()
514 514               fBodyAccMag-skewness()
515 515               fBodyAccMag-kurtosis()
516 516           fBodyBodyAccJerkMag-mean()
517 517            fBodyBodyAccJerkMag-std()
518 518            fBodyBodyAccJerkMag-mad()
519 519            fBodyBodyAccJerkMag-max()
520 520            fBodyBodyAccJerkMag-min()
521 521            fBodyBodyAccJerkMag-sma()
522 522         fBodyBodyAccJerkMag-energy()
523 523            fBodyBodyAccJerkMag-iqr()
524 524        fBodyBodyAccJerkMag-entropy()
525 525          fBodyBodyAccJerkMag-maxInds
526 526       fBodyBodyAccJerkMag-meanFreq()
527 527       fBodyBodyAccJerkMag-skewness()
528 528       fBodyBodyAccJerkMag-kurtosis()
529 529              fBodyBodyGyroMag-mean()
530 530               fBodyBodyGyroMag-std()
531 531               fBodyBodyGyroMag-mad()
532 532               fBodyBodyGyroMag-max()
533 533               fBodyBodyGyroMag-min()
534 534               fBodyBodyGyroMag-sma()
535 535            fBodyBodyGyroMag-energy()
536 536               fBodyBodyGyroMag-iqr()
537 537           fBodyBodyGyroMag-entropy()
538 538             fBodyBodyGyroMag-maxInds
539 539          fBodyBodyGyroMag-meanFreq()
540 540          fBodyBodyGyroMag-skewness()
541 541          fBodyBodyGyroMag-kurtosis()
542 542          fBodyBodyGyroJerkMag-mean()
543 543           fBodyBodyGyroJerkMag-std()
544 544           fBodyBodyGyroJerkMag-mad()
545 545           fBodyBodyGyroJerkMag-max()
546 546           fBodyBodyGyroJerkMag-min()
547 547           fBodyBodyGyroJerkMag-sma()
548 548        fBodyBodyGyroJerkMag-energy()
549 549           fBodyBodyGyroJerkMag-iqr()
550 550       fBodyBodyGyroJerkMag-entropy()
551 551         fBodyBodyGyroJerkMag-maxInds
552 552      fBodyBodyGyroJerkMag-meanFreq()
553 553      fBodyBodyGyroJerkMag-skewness()
554 554      fBodyBodyGyroJerkMag-kurtosis()
555 555          angle(tBodyAccMean,gravity)
556 556 angle(tBodyAccJerkMean),gravityMean)
557 557     angle(tBodyGyroMean,gravityMean)
558 558 angle(tBodyGyroJerkMean,gravityMean)
559 559                 angle(X,gravityMean)
560 560                 angle(Y,gravityMean)
561 561                 angle(Z,gravityMean)
```

