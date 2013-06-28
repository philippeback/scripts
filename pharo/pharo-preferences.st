"Put this in ~/Library/Preferences/pharo/ "

Smalltalk isHeadless ifFalse: [
StartupLoader default executeAtomicItems: {
StartupAction name: 'Image Setup' code: [
| color red green yellow white isIssueImage backgroundColor |

"============================================================================="
"some helper blocks for error printing"
color := [:colorCode :text|
    FileStream stderr 
        "set the color"
        nextPut: Character escape; nextPut: $[; print: colorCode; nextPut: $m;
        nextPutAll: text; crlf;
        "reset the color"
        nextPut: Character escape; nextPutAll: '[0m'.
].

red    := [:text| color value: 31 value: text ].
green  := [:text| color value: 32 value: text ].
yellow := [:text| color value: 33 value: text ].
white  := [:text| FileStream stderr nextPutAll: text; crlf ].

"Check whether we use an image for issue reporting"
isIssueImage := Smalltalk imageFile basename first isDigit.

"============================================================================="

Author fullName: 'PhilippeBack'.

"============================================================================="

"["
	yellow value: 'Loading custom preferences'.

	Debugger 
		alwaysOpenFullDebugger: true;
		filterCommonMessageSends: true.


	white value: '- set default fonts'.
	StandardFonts defaultFont: (LogicalFont familyName: 'Source Code Pro' pointSize: 11).
	GraphicFontSettings resetAllFontToDefault.

	white value: '- preparing tools'.
	backgroundColor := Color r: 0.287 g: 0.228 b: 0.338.
	PolymorphSystemSettings 
		desktopColor: backgroundColor;
		showDesktopLogo: false.

	"UITheme currentSettings fastDragging: true."

	TextEditorDialogWindow autoAccept: true.

	SHPreferences setStyleTableNamed: 'Tango'.

	UITheme currentSettings
		preferGradientFill: false;
		preferRoundCorner: false;
		menuColor: Color white.
		

	

	isIssueImage ifFalse: [
		(SystemVersion current major >= 3) ifTrue: [
			white value: '- loading Eclipse icons...'.
			Gofer new
				smalltalkhubUser: 'estebanlm' project: 'EclipsePack';
				package: 'EclipsePack';
				load.
			white value: '- setting theme to Eclipse theme icons'. 
			ThemeIcons current: EclipseUIThemeIcons new.
			white value: '- resetting world menu'.
			World resetWorldMenu.
			white value: '- reset icon caches of Nautilus'.
			NautilusUI resetIconCaches.
			white value: '- Eclipse icons update done.'.
		 ]
	    ].


	(isIssueImage and: [ Smalltalk isInteractive ])
		ifTrue: [ | slice |
			"open a slice inspector"
			slice := (Smalltalk imageFile basename copyUpTo: $-).
			(MCFileRepositoryInspector repository: (MCHttpRepository inboxRepository) workingCopy: nil)
				versionSearchAccept: slice;
				show.
		].

	white value: '- adding repositories'.

	MCRepositoryGroup default 
	    addRepository: (MCSmalltalkhubRepository 
		owner: 'philippeback' 
		project: 'DripfeedIt');
	    addRepository: (MCSmalltalkhubRepository
		owner: 'philippeback'
		project: 'HOWebStack');
	    addRepository: (MCSmalltalkhubRepository
		owner: 'philippeback'
		project: 'HOExperiments').

    (SystemVersion current major = 3) ifTrue: [
	white value: '- specific customizations for 3.0'.
	white value: '- adding metarepo for 3.0'.
	MCHttpRepository
		location: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main'
		user: 'philippeback'
		password: ''.
	].

    (SystemVersion current major = 2) ifTrue: [
	white value: '- specific customizations for 2.0'.
	].


"] fork."

white value: '- enabling TrueType fonts'.
FreeTypeSystemSettings loadFt2Library: true.
"============================================================================="

(Workspace new contents: '';
    openLabel: '')
	width: 1200; height: 230;
	setToAdhereToEdge: #bottomLeft;
	makeUnclosable.

MCWorkingCopyBrowser new show window
	width: 700; height: 230;
	setToAdhereToEdge: #topLeft;
	makeUnclosable.
	

] 
runOnce: true}].
