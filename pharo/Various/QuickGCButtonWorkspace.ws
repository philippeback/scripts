ButtonModel new
	label: 'Gargage Collect';
	action: [ Smalltalk garbageCollect. UIManager inform: 'Garbage is out.' ];
	openWithSpec.