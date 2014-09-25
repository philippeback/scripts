KMLog setDebug.
KMLog removeDebug.
KMRepository reset.
KMCategory allInstances collect: [ :k | k name ].

KMCategory allInstances select: [ :k | k name = #twmShortcuts ].

Smalltalk garbageCollect.