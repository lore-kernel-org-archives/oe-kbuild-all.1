Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF407E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692662836; x=1724198836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqIXCKShOgmzr6CGjw4kK1USMBItfy4uLiETpv4e2lc=;
  b=Q4svKD7Mn6bd1BDj23kkjScPrUF5lfVuwODh/XhP1RL5eIv82KQzFq87
   Srsk1szY5idXxqq/ZSw3l4+F/I4KZWFWgox6gaFSmz9K1ZkgZcSRPQDWI
   jouegU60g8WBnCc8eRO6V5fC4F5JOvp1sWuglk6GRnHasEVYd4bHE3mWT
   vCI1KFe5YLaGaqfskzwLw4T7bYf66L4+U+dp+fEGh5+0pbYlOO02Z0WH3
   POarrEC0OMAeRKZgkqy+cCCLSRWEwRXu1VPwlz/7DdSPcntdV8bZ8GNzE
   wwK7lxb8nWhbPk5T3cpxYm6+Uj48PKaoiRuWBxMsBVU1eo6SsYz1FmbsR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440102994"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="440102994"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685843079"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="685843079"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 17:07:13 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEvQ-00015w-0m;
	Tue, 22 Aug 2023 00:07:12 +0000
Date: Tue, 22 Aug 2023 08:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 2126/9999] net/core/scm.c:291: Error:
 unrecognized opcode `csrs sstatus,s11', extension `zicsr' required
Message-ID: <202308220853.vc6HSuQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   4e5e7fa94ee0ff378b268679d51feb1fd2a04756
commit: 0505cc4c908f46a4d22c4994dbbe7bc489d0c52d [2126/9999] cgroup: fix cgroup_sk_alloc() for sk_clone_lock()
config: riscv-randconfig-001-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220853.vc6HSuQ2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220853.vc6HSuQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220853.vc6HSuQ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c: Assembler messages:
>> net/core/scm.c:291: Error: unrecognized opcode `csrs sstatus,s11', extension `zicsr' required
>> net/core/scm.c:291: Error: unrecognized opcode `csrc sstatus,s11', extension `zicsr' required
   net/core/scm.c:308: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
   net/core/scm.c:308: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required
   net/core/scm.c:310: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
   net/core/scm.c:310: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required
   net/core/scm.c:312: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
   net/core/scm.c:312: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required


vim +291 net/core/scm.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  254  
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  void scm_detach_fds(struct msghdr *msg, struct scm_cookie *scm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  {
cfcabdcc2d5a81 Stephen Hemminger 2007-10-09  257  	struct cmsghdr __user *cm
cfcabdcc2d5a81 Stephen Hemminger 2007-10-09  258  		= (__force struct cmsghdr __user*)msg->msg_control;
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  	int fdmax = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  	int fdnum = scm->fp->count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  	struct file **fp = scm->fp->fp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	int __user *cmfptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  	int err = 0, i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	if (MSG_CMSG_COMPAT & msg->msg_flags) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  267  		scm_detach_fds_compat(msg, scm);
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  	if (msg->msg_controllen > sizeof(struct cmsghdr))
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  		fdmax = ((msg->msg_controllen - sizeof(struct cmsghdr))
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  			 / sizeof(int));
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  	if (fdnum < fdmax)
^1da177e4c3f41 Linus Torvalds    2005-04-16  276  		fdmax = fdnum;
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  
cfcabdcc2d5a81 Stephen Hemminger 2007-10-09  278  	for (i=0, cmfptr=(__force int __user *)CMSG_DATA(cm); i<fdmax;
cfcabdcc2d5a81 Stephen Hemminger 2007-10-09  279  	     i++, cmfptr++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  	{
48a87cc26c13b6 John Fastabend    2012-08-14  281  		struct socket *sock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  		int new_fd;
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  		err = security_file_receive(fp[i]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  		if (err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  			break;
4a19542e5f694c Ulrich Drepper    2007-07-15  286  		err = get_unused_fd_flags(MSG_CMSG_CLOEXEC & msg->msg_flags
4a19542e5f694c Ulrich Drepper    2007-07-15  287  					  ? O_CLOEXEC : 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  		if (err < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  289  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  		new_fd = err;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @291  		err = put_user(new_fd, cmfptr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  292  		if (err) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  			put_unused_fd(new_fd);
^1da177e4c3f41 Linus Torvalds    2005-04-16  294  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  295  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  296  		/* Bump the usage count and install the file. */
48a87cc26c13b6 John Fastabend    2012-08-14  297  		sock = sock_from_file(fp[i], &err);
d84295067fc7e9 Daniel Wagner     2013-01-21  298  		if (sock) {
2a56a1fec290bf Tejun Heo         2015-12-07  299  			sock_update_netprioidx(&sock->sk->sk_cgrp_data);
2a56a1fec290bf Tejun Heo         2015-12-07  300  			sock_update_classid(&sock->sk->sk_cgrp_data);
d84295067fc7e9 Daniel Wagner     2013-01-21  301  		}
cb0942b8124979 Al Viro           2012-08-27  302  		fd_install(new_fd, get_file(fp[i]));
^1da177e4c3f41 Linus Torvalds    2005-04-16  303  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  304  
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  	if (i > 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  		int cmlen = CMSG_LEN(i*sizeof(int));
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  		err = put_user(SOL_SOCKET, &cm->cmsg_level);
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  		if (!err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  			err = put_user(SCM_RIGHTS, &cm->cmsg_type);
^1da177e4c3f41 Linus Torvalds    2005-04-16  311  		if (!err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  			err = put_user(cmlen, &cm->cmsg_len);
^1da177e4c3f41 Linus Torvalds    2005-04-16  313  		if (!err) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  			cmlen = CMSG_SPACE(i*sizeof(int));
6900317f5eff0a Daniel Borkmann   2015-11-20  315  			if (msg->msg_controllen < cmlen)
6900317f5eff0a Daniel Borkmann   2015-11-20  316  				cmlen = msg->msg_controllen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  317  			msg->msg_control += cmlen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  318  			msg->msg_controllen -= cmlen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  320  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  	if (i < fdnum || (fdnum && fdmax <= 0))
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  		msg->msg_flags |= MSG_CTRUNC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  	 * All of the files that fit in the message have had their
^1da177e4c3f41 Linus Torvalds    2005-04-16  326  	 * usage counts incremented, so we just free the list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  	__scm_destroy(scm);
^1da177e4c3f41 Linus Torvalds    2005-04-16  329  }
9e34a5b51684bc Eric Dumazet      2010-07-09  330  EXPORT_SYMBOL(scm_detach_fds);
^1da177e4c3f41 Linus Torvalds    2005-04-16  331  

:::::: The code at line 291 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
