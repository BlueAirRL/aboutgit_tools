gitHub简介

Git是一个分布式版本控制系统，与其相对的是CVS、SVN等集中式的版本控制系统。

2.Git的安装

1)安装Git

a.查看与使用

在ubuntu下可以使用如下命令进行查看系统中是否安装了Git：

$ git

b.安装

若当前系统中尚未安装Git，在ubuntu下可以使用如下命令进行安装：

$ sudo apt-get install git

找不到git package时：
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24
su -c "echo 'deb http://ppa.launchpad.net/git-core/ppa/ubuntu trusty main' > /etc/apt/sources.list.d/git.list"



2)注册GitHub帐号

进入GitHub官网，进行帐号的注册，如下图所示： 


注册完成之后，务必要记得激活邮箱，否则会影响后续工作的进行，可在设置(Account settings)->Emails下面进行激活。

3)建立仓库(Repository)
	
	注册完成并激活帐号之后，我们需要建立一个仓库，因为私有仓库是需要付费的，所以，我们选择建立公有仓库，如下图所示： 
	
	
	上图信息可根据自身实际情况进行选择与填写。
	
	3)生成公钥(key)
	
	我们在建立好一个仓库后，需要为这个仓库添加可以提交代码的电脑的公钥。在终端上输入如下命令可以进行公钥(key)生成情况的检查：
	
	$ cd ~/.ssh 
	若是出现“No such file or directory”一类的数据，则说明缺少公钥(key)。
	
	在ubuntu系统下，有一个ssh-keygen的工具，我们可以在终端上输入如下命令进行公钥(key)的生成：
	
	$ ssh-keygen -t rsa -C “your_email@committermail.com”  
	上条命令中引号中的内容，需要根据自己的实际情况，更改为自己的邮箱地址，如：mygithub@163.com。
	
	出现下图所示的提示，则表明创建成功，在生成公钥期间，会有提示让输入密码等操作，建议按默认无需输入任何信息，只需一路回车即可： 
	
	
	4)添加公钥(key)
	
	添加公钥到所建立的仓库之中，可在设置(Account settings)->SSH Keys之中进行公钥的添加。
	
	a.Title尽量不要使用中文；
	
	b.Key框中，请查看home文件夹中的.ssh/id_rsa.pub 内容，并将其中所包含的文本全部复制到Key框中即可； 
	
	
	若出现“Key is invalid. Ensure you’ve copied the file correctly”一类的错误信息，只需重新执行一下第三步（即生成公钥），重新生成一下SSH Key，然后再执行此步骤进行SSH Key的添加即可。
	
	至此，GitHub配置完毕。
	
	5)验证
	
	在终端中输入如下命令进行以上所有配置成功与否的验证：
	
	$ ssh -T git@github.com 
	验证期间若有“Are you sure you want to continue connecting (yes/no)?”的提示操作，输入“yes”，然后回车即可。
	
	最后，若出现“Hi Willido! You’ve successfully authenticated, but GitHub does not provide shell access.”的信息，则表示已成功连上GitHub。 
	6)设置GitHub
	
	在成功连上GitHub之后，我们要做的就是把本地仓库上传到GitHub上去，但在此之前我们还需要设置username和email，因为GitHub每次commit时都会记录他们。
	
	在终端输入如下命令进行username和email的设置：
	
	git config –-global user.name “yourname” 
	git config -–global user.email “your_email@youremail.com” 
	注:使用git config命令的–global参数之后，表示当前机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的username和Email地址；这里可以是随便配置用户名和邮箱都可以，这个主要是为了方便大家的联系。
	
	7)创建版本库
	
	a.创建目录
	
	在本机上选择一个合适的地方，创建一个本地目录，命令如下：
	
	mkdirdirectory−namemkdirdirectory−name cd directory-name 
	$ pwd
	
	b.使用目录
	
	进入所创建的目录，然后将该目录变为Git可以管理的仓库，命令如下：
	
	$ git init 
	c.查看仓库
	
	进入本地仓库目录，可查看本地仓库目录的状态，命令如下：
	
	$ git status 
	d.远程初始一个Git仓库
	
	远程初始一个Git仓库，命令如下：
	
	$ git –bare init  
	e.添加远程地址
	
	添加远程地址，设置GitHub的仓库地址并取名为origin(不知是否可以取其它名字)，命令如下：
	
	$ git remote add origin git@github.com:yourName/yourRepo.git 
	上条命令中的yourName和yourRepo表示你在GitHub中的用户名和前面在GitHub中所新建的仓库的名称，添加完之后进入.git，打开config，这里会多出一个remote “origin”内容，这就是刚才添加的远程地址，也可以直接修改config来配置远程地址。
	
	f.添加文件
	
	在本地仓库中添加一些文件，如readme，命令如下：
	
	$ git add README 
	此处添加的内容，必须在本地仓库中，而且git命令须都在本地仓库目录中才能执行。
	
	g.提交评论
	
	提交文件，并对此次提交进行评论，命令如下：
	
	$ git commit -m “your comment” 
	 h.上传文件
	 
	 将文件上传到GitHub服务器上，命令如下：
	 
	 $ git push origin master 
	 git push命令会将本地仓库中的内容推送到远程服务器上。
	 
	 修改完代码后，使用git status可以查看文件的差别；使用git add 添加要commit的文件，也可以用git add -i来智能添加文件，git add -A添加所有文件；之后使用git commit提交本次修改；最后使用git push上传到github。
	 "''"
