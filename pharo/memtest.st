
NonInteractiveTranscript stdout install.

!

Transcript show: 'memtest.st'; cr.
Smalltalk garbageCollect.
Transcript show: SmalltalkImage current vm statisticsReport; cr.

!

| count size data timeToRun |
count := Smalltalk commandLine arguments first asInteger.
size := Smalltalk commandLine arguments second asInteger.
Transcript show: ('allocating: {1} times {2} bytes' format: { count. size }); cr.
timeToRun := [
  data := Array new: count streamContents: [ :out |
    count timesRepeat: [
      out nextPut: (ByteArray new: size) ] ].
] timeToRun.
Transcript
  show: ('allocated: {1}' format: { (data collect: #size) sum humanReadableSIByteSize });
  cr.
Transcript show: ('time to run {1}' format: { Duration milliSeconds: timeToRun }); cr.
Transcript show: '3 times GC'; cr.
timeToRun := [
  3 timesRepeat: [ Smalltalk garbageCollect ] ] timeToRun.
Transcript show: ('time to run {1}' format: { Duration milliSeconds: timeToRun }); cr.
Transcript show: SmalltalkImage current vm statisticsReport; cr.

!

SmalltalkImage current quitPrimitive.
