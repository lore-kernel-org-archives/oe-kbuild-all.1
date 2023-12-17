Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331ECED0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6FbcL1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702784479; x=1734320479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/i0YZDIvNup65tNXPtkcjTxcOYNAvY6nQH3K21t20iU=;
  b=n6FbcL1g4Z3J0rL8OYFKbuC90RCztX7luJ8bwK3tZ9qZZZRD446mJu3x
   wFDN4mjQhwbm0a1ziIoQLjMn5e72GYgyXotjb9lGOrdHmqTFWUfGNEV6X
   guiKqf6/p6U/V/1ugYDr0g3tzU7ZhwlBnHeVsm9ABKrTcqPudyVNOnyz1
   yOnW8PZ++P7eZXjU2tEqR6N7LP2YFs/J5IS7yjX3bD4QAVgUaqtCJrB+F
   kTQ/GV30rZukCVsUk18x9SyBoQCRK39Tt5T1QANSfw4K+FKXdJQfY414j
   bFp3Vg3qJz6gb41vf5GmOxJIABeWXXbiLSCwAE7WphoAOmF7VX8tywCXy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426530522"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426530522"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="724887761"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="724887761"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2023 19:41:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEi1i-0002ad-2J;
	Sun, 17 Dec 2023 03:41:14 +0000
Date: Sun, 17 Dec 2023 11:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 42/50] include/linux/audit.h:631:41:
 warning: 'struct kern_ipc_perm' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202312171132.FJuUdMAH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 95af5086cdbdc344aaf57a7123e5f6c98ca24996 [42/50] sem: Split out sem_types.h
config: i386-randconfig-014-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171132.FJuUdMAH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171132.FJuUdMAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171132.FJuUdMAH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fsnotify.h:16,
                    from fs/ext4/super.c:48:
>> include/linux/audit.h:631:41: warning: 'struct kern_ipc_perm' declared inside parameter list will not be visible outside of this definition or declaration
     631 | static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
         |                                         ^~~~~~~~~~~~~


vim +631 include/linux/audit.h

c4dad0aab3fca0 Richard Guy Briggs  2020-04-22  574  
471a5c7c839114 Al Viro             2006-07-10  575  extern int audit_n_rules;
e54dc2431d740a Amy Griffis         2007-03-29  576  extern int audit_signals;
d7e7528bcd456f Eric Paris          2012-01-03  577  #else /* CONFIG_AUDITSYSCALL */
9321d526dd7315 Kees Cook           2012-10-04  578  static inline int audit_alloc(struct task_struct *task)
9321d526dd7315 Kees Cook           2012-10-04  579  {
9321d526dd7315 Kees Cook           2012-10-04  580  	return 0;
9321d526dd7315 Kees Cook           2012-10-04  581  }
9321d526dd7315 Kees Cook           2012-10-04  582  static inline void audit_free(struct task_struct *task)
9321d526dd7315 Kees Cook           2012-10-04  583  { }
5bd2182d58e9d9 Paul Moore          2021-02-16  584  static inline void audit_uring_entry(u8 op)
5bd2182d58e9d9 Paul Moore          2021-02-16  585  { }
5bd2182d58e9d9 Paul Moore          2021-02-16  586  static inline void audit_uring_exit(int success, long code)
5bd2182d58e9d9 Paul Moore          2021-02-16  587  { }
91397401bb5072 Eric Paris          2014-03-11  588  static inline void audit_syscall_entry(int major, unsigned long a0,
9321d526dd7315 Kees Cook           2012-10-04  589  				       unsigned long a1, unsigned long a2,
9321d526dd7315 Kees Cook           2012-10-04  590  				       unsigned long a3)
9321d526dd7315 Kees Cook           2012-10-04  591  { }
9321d526dd7315 Kees Cook           2012-10-04  592  static inline void audit_syscall_exit(void *pt_regs)
9321d526dd7315 Kees Cook           2012-10-04  593  { }
36734810488e61 Yaowei Bai          2015-11-04  594  static inline bool audit_dummy_context(void)
9321d526dd7315 Kees Cook           2012-10-04  595  {
36734810488e61 Yaowei Bai          2015-11-04  596  	return true;
9321d526dd7315 Kees Cook           2012-10-04  597  }
c0b0ae8a871bc2 Richard Guy Briggs  2018-05-12  598  static inline void audit_set_context(struct task_struct *task, struct audit_context *ctx)
c0b0ae8a871bc2 Richard Guy Briggs  2018-05-12  599  { }
cdfb6b341f0f24 Richard Guy Briggs  2018-05-12  600  static inline struct audit_context *audit_context(void)
cdfb6b341f0f24 Richard Guy Briggs  2018-05-12  601  {
cdfb6b341f0f24 Richard Guy Briggs  2018-05-12  602  	return NULL;
cdfb6b341f0f24 Richard Guy Briggs  2018-05-12  603  }
7ac86265dc8f66 Jeff Layton         2012-10-10  604  static inline struct filename *audit_reusename(const __user char *name)
7ac86265dc8f66 Jeff Layton         2012-10-10  605  {
7ac86265dc8f66 Jeff Layton         2012-10-10  606  	return NULL;
7ac86265dc8f66 Jeff Layton         2012-10-10  607  }
91a27b2a756784 Jeff Layton         2012-10-10  608  static inline void audit_getname(struct filename *name)
9321d526dd7315 Kees Cook           2012-10-04  609  { }
adb5c2473d3f91 Jeff Layton         2012-10-10  610  static inline void audit_inode(struct filename *name,
adb5c2473d3f91 Jeff Layton         2012-10-10  611  				const struct dentry *dentry,
c9b07eab0c8760 Al Viro             2019-07-14  612  				unsigned int aflags)
9321d526dd7315 Kees Cook           2012-10-04  613  { }
9f45f5bf302daa Al Viro             2014-10-31  614  static inline void audit_file(struct file *file)
9f45f5bf302daa Al Viro             2014-10-31  615  {
9f45f5bf302daa Al Viro             2014-10-31  616  }
79f6530cb59e2a Jeff Layton         2013-07-08  617  static inline void audit_inode_parent_hidden(struct filename *name,
79f6530cb59e2a Jeff Layton         2013-07-08  618  				const struct dentry *dentry)
79f6530cb59e2a Jeff Layton         2013-07-08  619  { }
d6335d77a7622a Andreas Gruenbacher 2015-12-24  620  static inline void audit_inode_child(struct inode *parent,
4fa6b5ecbf092c Jeff Layton         2012-10-10  621  				     const struct dentry *dentry,
4fa6b5ecbf092c Jeff Layton         2012-10-10  622  				     const unsigned char type)
9321d526dd7315 Kees Cook           2012-10-04  623  { }
9321d526dd7315 Kees Cook           2012-10-04  624  static inline void audit_core_dumps(long signr)
9321d526dd7315 Kees Cook           2012-10-04  625  { }
9321d526dd7315 Kees Cook           2012-10-04  626  static inline void audit_seccomp(unsigned long syscall, long signr, int code)
9321d526dd7315 Kees Cook           2012-10-04  627  { }
ea6eca778500b0 Tyler Hicks         2018-05-04  628  static inline void audit_seccomp_actions_logged(const char *names,
ea6eca778500b0 Tyler Hicks         2018-05-04  629  						const char *old_names, int res)
ea6eca778500b0 Tyler Hicks         2018-05-04  630  { }
9321d526dd7315 Kees Cook           2012-10-04 @631  static inline void audit_ipc_obj(struct kern_ipc_perm *ipcp)
9321d526dd7315 Kees Cook           2012-10-04  632  { }
9321d526dd7315 Kees Cook           2012-10-04  633  static inline void audit_ipc_set_perm(unsigned long qbytes, uid_t uid,
9321d526dd7315 Kees Cook           2012-10-04  634  					gid_t gid, umode_t mode)
9321d526dd7315 Kees Cook           2012-10-04  635  { }
9410d228a4cf43 Richard Guy Briggs  2013-10-30  636  static inline void audit_bprm(struct linux_binprm *bprm)
9410d228a4cf43 Richard Guy Briggs  2013-10-30  637  { }
2950fa9d3291b9 Chen Gang           2013-04-07  638  static inline int audit_socketcall(int nargs, unsigned long *args)
2950fa9d3291b9 Chen Gang           2013-04-07  639  {
2950fa9d3291b9 Chen Gang           2013-04-07  640  	return 0;
2950fa9d3291b9 Chen Gang           2013-04-07  641  }
62bc306e208343 Richard Guy Briggs  2017-01-17  642  

:::::: The code at line 631 was first introduced by commit
:::::: 9321d526dd731588f09508af48de50041785a26a audit.h: replace defines with C stubs

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
