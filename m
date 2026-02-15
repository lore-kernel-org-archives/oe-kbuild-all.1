Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C42405EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771124710; cv=none; b=U4ZT9UmCmTu7Yj82UOB92RwJCNfa05SGOVYTXLavrpBJE0AuFPNUPCp8dfiCtj18Imjr2cWkGh95omvYkuHpb/d9Fon1bIWXytL5yxpkPQRrse1C4yrw9Wc0jcBzk85AVzIolqEzIpqxTGWt92pGeEAt+uvaTCORNsDQ6ctzZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771124710; c=relaxed/simple;
	bh=45VHmGkTF1FRGtusweoRAi6OOtOaWjdXBecvC2akYl4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nw3X15n/grWA9VVvgb3yFibhePKnAUzWOo1Z5tFlVvLbQa+uBYSGZtX6iIMyovcONBEI8BouAbfhvJR2NKECmGP41KzR/98F596nBxi5gtn53YpEHmL3XTXeukv15vBs/BdyubOhAJRlRQCdE6p/qx/oXa+xdfjpz0iPK1MSU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckdJ18ZB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckdJ18ZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771124709; x=1802660709;
  h=date:from:to:cc:subject:message-id;
  bh=45VHmGkTF1FRGtusweoRAi6OOtOaWjdXBecvC2akYl4=;
  b=ckdJ18ZBQ6fv4nHAbbPYUxLmak5HcWWRQipUyDBsltOsk+cuqqSt0GuQ
   8oNsKIXd0atFwxJ+b+e8BRSRP4KevWLY4A1Mm/3MzlyYFSMYjvbkhoTOG
   O1oTO4Z/War4YXnrWUBoVpIIy6JF1e0ral8OvZZ4vV7zgsoiO0jimttmP
   VvMQa7I+KGhtaVy7RiogVV7bFE1eGszjzvb7Rv12h88H7sYNLbhiRElmn
   IgXxJyIwY+eQ16IsZAr0l+vgQ0RJ/QQd7daYpqzaZGyTJ4LZAfGjSU7+s
   CofiWToRXxrslstbq9mnZ0EgpFMH8iFVQ2wTWIRRx6RRyrf5EU8L0oSSM
   Q==;
X-CSE-ConnectionGUID: yr46UeX7SbSMesVg/5trlw==
X-CSE-MsgGUID: tHzZZi80THO/4ctmAlD/+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72351008"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72351008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:05:07 -0800
X-CSE-ConnectionGUID: Kyd31BvoQhmPRyPIAUlevw==
X-CSE-MsgGUID: CszUs+17SKqxkZ2iNqk6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="212526305"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2026 19:05:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrSRS-00000000xDA-2cPP;
	Sun, 15 Feb 2026 03:05:02 +0000
Date: Sun, 15 Feb 2026 11:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 86/86]
 include/linux/proc_fs.h:125:21: error: invalid use of undefined type 'const
 struct inode'
Message-ID: <202602151030.u5y68OSc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   eb0f9b74059447f014624aeec977890e35a4860e
commit: eb0f9b74059447f014624aeec977890e35a4860e [86/86] kasan: Fix a build error
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602151030.u5y68OSc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151030.u5y68OSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151030.u5y68OSc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:252,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/oplib_32.h:12,
                    from arch/sparc/include/asm/oplib.h:7,
                    from arch/sparc/include/asm/pgtable_32.h:32,
                    from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:9,
                    from include/linux/slab.h:264,
                    from include/linux/fs.h:45,
                    from include/linux/cgroup.h:17,
                    from include/linux/cgroup_api.h:1,
                    from kernel/sched/sched.h:28,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/proc_fs.h:39:58: warning: 'struct iov_iter' declared inside parameter list will not be visible outside of this definition or declaration
      39 |         ssize_t (*proc_read_iter)(struct kiocb *, struct iov_iter *);
         |                                                          ^~~~~~~~
>> include/linux/proc_fs.h:39:42: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      39 |         ssize_t (*proc_read_iter)(struct kiocb *, struct iov_iter *);
         |                                          ^~~~~
   include/linux/proc_fs.h: In function 'pde_data':
>> include/linux/proc_fs.h:125:21: error: invalid use of undefined type 'const struct inode'
     125 |         return inode->i_private;
         |                     ^~
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +125 include/linux/proc_fs.h

d919b33dafb3e2 Alexey Dobriyan   2020-04-06   34  
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   35  struct proc_ops {
d919b33dafb3e2 Alexey Dobriyan   2020-04-06   36  	unsigned int proc_flags;
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   37  	int	(*proc_open)(struct inode *, struct file *);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   38  	ssize_t	(*proc_read)(struct file *, char __user *, size_t, loff_t *);
fd5a13f4893c8d Christoph Hellwig 2020-09-03  @39  	ssize_t (*proc_read_iter)(struct kiocb *, struct iov_iter *);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   40  	ssize_t	(*proc_write)(struct file *, const char __user *, size_t, loff_t *);
d4455faccd6cbe Alexey Dobriyan   2021-05-06   41  	/* mandatory unless nonseekable_open() or equivalent is used */
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   42  	loff_t	(*proc_lseek)(struct file *, loff_t, int);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   43  	int	(*proc_release)(struct inode *, struct file *);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   44  	__poll_t (*proc_poll)(struct file *, struct poll_table_struct *);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   45  	long	(*proc_ioctl)(struct file *, unsigned int, unsigned long);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   46  #ifdef CONFIG_COMPAT
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   47  	long	(*proc_compat_ioctl)(struct file *, unsigned int, unsigned long);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   48  #endif
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   49  	int	(*proc_mmap)(struct file *, struct vm_area_struct *);
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   50  	unsigned long (*proc_get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
d919b33dafb3e2 Alexey Dobriyan   2020-04-06   51  } __randomize_layout;
d56c0d45f0e27f Alexey Dobriyan   2020-02-03   52  
fa10fed30f2550 Alexey Gladkov    2020-04-19   53  /* definitions for hide_pid field */
e61bb8b36a287d Alexey Gladkov    2020-04-19   54  enum proc_hidepid {
fa10fed30f2550 Alexey Gladkov    2020-04-19   55  	HIDEPID_OFF	  = 0,
fa10fed30f2550 Alexey Gladkov    2020-04-19   56  	HIDEPID_NO_ACCESS = 1,
fa10fed30f2550 Alexey Gladkov    2020-04-19   57  	HIDEPID_INVISIBLE = 2,
24a71ce5c47f6b Alexey Gladkov    2020-04-19   58  	HIDEPID_NOT_PTRACEABLE = 4, /* Limit pids to only ptraceable pids */
fa10fed30f2550 Alexey Gladkov    2020-04-19   59  };
fa10fed30f2550 Alexey Gladkov    2020-04-19   60  
6814ef2d992af0 Alexey Gladkov    2020-04-19   61  /* definitions for proc mount option pidonly */
e61bb8b36a287d Alexey Gladkov    2020-04-19   62  enum proc_pidonly {
6814ef2d992af0 Alexey Gladkov    2020-04-19   63  	PROC_PIDONLY_OFF = 0,
6814ef2d992af0 Alexey Gladkov    2020-04-19   64  	PROC_PIDONLY_ON  = 1,
6814ef2d992af0 Alexey Gladkov    2020-04-19   65  };
6814ef2d992af0 Alexey Gladkov    2020-04-19   66  
fa10fed30f2550 Alexey Gladkov    2020-04-19   67  struct proc_fs_info {
fa10fed30f2550 Alexey Gladkov    2020-04-19   68  	struct pid_namespace *pid_ns;
fa10fed30f2550 Alexey Gladkov    2020-04-19   69  	kgid_t pid_gid;
e61bb8b36a287d Alexey Gladkov    2020-04-19   70  	enum proc_hidepid hide_pid;
e61bb8b36a287d Alexey Gladkov    2020-04-19   71  	enum proc_pidonly pidonly;
e31f0a57ae1ab2 Al Viro           2023-09-20   72  	struct rcu_head rcu;
fa10fed30f2550 Alexey Gladkov    2020-04-19   73  };
fa10fed30f2550 Alexey Gladkov    2020-04-19   74  
fa10fed30f2550 Alexey Gladkov    2020-04-19   75  static inline struct proc_fs_info *proc_sb_info(struct super_block *sb)
fa10fed30f2550 Alexey Gladkov    2020-04-19   76  {
fa10fed30f2550 Alexey Gladkov    2020-04-19   77  	return sb->s_fs_info;
fa10fed30f2550 Alexey Gladkov    2020-04-19   78  }
fa10fed30f2550 Alexey Gladkov    2020-04-19   79  
^1da177e4c3f41 Linus Torvalds    2005-04-16   80  #ifdef CONFIG_PROC_FS
^1da177e4c3f41 Linus Torvalds    2005-04-16   81  
564def71765caf David Howells     2018-05-18   82  typedef int (*proc_write_t)(struct file *, char *, size_t);
564def71765caf David Howells     2018-05-18   83  
^1da177e4c3f41 Linus Torvalds    2005-04-16   84  extern void proc_root_init(void);
7bc3e6e55acf06 Eric W. Biederman 2020-02-19   85  extern void proc_flush_pid(struct pid *);
^1da177e4c3f41 Linus Torvalds    2005-04-16   86  
^1da177e4c3f41 Linus Torvalds    2005-04-16   87  extern struct proc_dir_entry *proc_symlink(const char *,
^1da177e4c3f41 Linus Torvalds    2005-04-16   88  		struct proc_dir_entry *, const char *);
c6c75deda81344 Alexey Dobriyan   2020-12-15   89  struct proc_dir_entry *_proc_mkdir(const char *, umode_t, struct proc_dir_entry *, void *, bool);
^1da177e4c3f41 Linus Torvalds    2005-04-16   90  extern struct proc_dir_entry *proc_mkdir(const char *, struct proc_dir_entry *);
270b5ac2151707 David Howells     2013-04-12   91  extern struct proc_dir_entry *proc_mkdir_data(const char *, umode_t,
270b5ac2151707 David Howells     2013-04-12   92  					      struct proc_dir_entry *, void *);
59d8053f1e1690 David Howells     2013-04-11   93  extern struct proc_dir_entry *proc_mkdir_mode(const char *, umode_t,
59d8053f1e1690 David Howells     2013-04-11   94  					      struct proc_dir_entry *);
f97df70b1c879f Seth Forshee      2016-11-14   95  struct proc_dir_entry *proc_create_mount_point(const char *name);
59d8053f1e1690 David Howells     2013-04-11   96  
44414d82cfe0f6 Christoph Hellwig 2018-04-24   97  struct proc_dir_entry *proc_create_seq_private(const char *name, umode_t mode,
fddda2b7b52118 Christoph Hellwig 2018-04-13   98  		struct proc_dir_entry *parent, const struct seq_operations *ops,
44414d82cfe0f6 Christoph Hellwig 2018-04-24   99  		unsigned int state_size, void *data);
44414d82cfe0f6 Christoph Hellwig 2018-04-24  100  #define proc_create_seq_data(name, mode, parent, ops, data) \
44414d82cfe0f6 Christoph Hellwig 2018-04-24  101  	proc_create_seq_private(name, mode, parent, ops, 0, data)
fddda2b7b52118 Christoph Hellwig 2018-04-13  102  #define proc_create_seq(name, mode, parent, ops) \
44414d82cfe0f6 Christoph Hellwig 2018-04-24  103  	proc_create_seq_private(name, mode, parent, ops, 0, NULL)
3f3942aca6da35 Christoph Hellwig 2018-05-15  104  struct proc_dir_entry *proc_create_single_data(const char *name, umode_t mode,
3f3942aca6da35 Christoph Hellwig 2018-05-15  105  		struct proc_dir_entry *parent,
3f3942aca6da35 Christoph Hellwig 2018-05-15  106  		int (*show)(struct seq_file *, void *), void *data);
3f3942aca6da35 Christoph Hellwig 2018-05-15  107  #define proc_create_single(name, mode, parent, show) \
3f3942aca6da35 Christoph Hellwig 2018-05-15  108  	proc_create_single_data(name, mode, parent, show, NULL)
fddda2b7b52118 Christoph Hellwig 2018-04-13  109   
59d8053f1e1690 David Howells     2013-04-11  110  extern struct proc_dir_entry *proc_create_data(const char *, umode_t,
59d8053f1e1690 David Howells     2013-04-11  111  					       struct proc_dir_entry *,
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  112  					       const struct proc_ops *,
59d8053f1e1690 David Howells     2013-04-11  113  					       void *);
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  
d56c0d45f0e27f Alexey Dobriyan   2020-02-03  115  struct proc_dir_entry *proc_create(const char *name, umode_t mode, struct proc_dir_entry *parent, const struct proc_ops *proc_ops);
271a15eabe0945 David Howells     2013-04-12  116  extern void proc_set_size(struct proc_dir_entry *, loff_t);
271a15eabe0945 David Howells     2013-04-12  117  extern void proc_set_user(struct proc_dir_entry *, kuid_t, kgid_t);
6dfbbae14a7b96 Muchun Song       2022-01-21  118  
6dfbbae14a7b96 Muchun Song       2022-01-21  119  /*
6dfbbae14a7b96 Muchun Song       2022-01-21  120   * Obtain the private data passed by user through proc_create_data() or
6dfbbae14a7b96 Muchun Song       2022-01-21  121   * related.
6dfbbae14a7b96 Muchun Song       2022-01-21  122   */
6dfbbae14a7b96 Muchun Song       2022-01-21  123  static inline void *pde_data(const struct inode *inode)
6dfbbae14a7b96 Muchun Song       2022-01-21  124  {
6dfbbae14a7b96 Muchun Song       2022-01-21 @125  	return inode->i_private;
6dfbbae14a7b96 Muchun Song       2022-01-21  126  }
6dfbbae14a7b96 Muchun Song       2022-01-21  127  

:::::: The code at line 125 was first introduced by commit
:::::: 6dfbbae14a7b961f41d80a106e1ab60e86d061c5 fs: proc: store PDE()->data into inode->i_private

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
