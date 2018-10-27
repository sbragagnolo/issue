| pharo issue branchName githubRepository protocol user issueNumber url | 



user := CommandLineArguments new optionAt: #user ifAbsent: [ self error: 'specify user by adding  --user / -u ' ] .
protocol := CommandLineArguments new optionAt: #protocol ifAbsent: [ 'ssh'] .
url := protocol = #ssh ifTrue: [ 'git@github.com:{1}/pharo.git' format:{user}] ifFalse:['https://github.com/{1}/pharo.git' format:{user}].
protocol := protocol = #ssh ifTrue: [ #ssh_url ] ifFalse: [ #html_url ].
issueNumber := CommandLineArguments new optionAt: #issue ifAbsent: [ self error: ' Issue is passed by --issue -i is mandatory' ] .
(issueNumber size = 5 and: [ issueNumber isAllDigits ] ) ifFalse:  [ self error: ' The issue number is not valid ' ].

IceCredentialsProvider useCustomSsh: true. 

issue := PharoIssue number: issueNumber. 
issue downloadTitle.
branchName := IcePharoNewBranchFromIssuePanel basicNew sanitizeTitle: issue title. 

branchName  ='INVALID-ISSUE' ifTrue: [ self error: ' The issue number is not valid ' ].


pharo := IceRepository registry detect: [  : r | r name = #pharo ].
IceRepositoryCreator new 
	repository: pharo;
	remote: (IceGitRemote url: (url));
	createRepository.
	
githubRepository := IceGitHubAPI new
	beAnonymous;
	getRepository: user project: 'pharo'.
(githubRepository at: #fork)
	ifTrue: [ | parent remote |
		parent := githubRepository at: #parent.
		remote := IceGitRemote name: ((parent at: #owner) at: #login) url: (parent at: protocol).
		pharo addRemote: remote.
		remote fetch. ].

pharo createBranch: branchName inCommit: pharo workingCopy referenceCommit.

Smalltalk saveAs: branchName.

