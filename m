Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AF186F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 03:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676259066; x=1707795066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ioUs8+IushamO73RSLaxgn6dGMmC7jwWm6QkGkHRWOw=;
  b=ffmkrtO0HKSUMnj21672RvuLmPcWf/h+N4G1nb9gec8J0GgUFIOeJAuJ
   LZxPm79vBXP0wrP3sLGRNJUvn5IExgrmu8Sppq4WXhC9MX1K7v+uEPWDm
   aZnFUxyGYRjjeTZ8ZjFzlAlmHAinPcZjgN1sWviLe0IH4+SZ3+GFmr311
   ikwC1GcjGkHjmT9OGTrGReMI0G+wosle7DHNwDM3dFOXv7/oO8N7SzkDl
   tmwZ0teeYSWo6wr2l2pWnOMZq+Exixf6xgU63BsIQmtWxKsgxj4ql8B55
   aeJjOOiB2fYGyFrtaqWVWZ4mWU18dE0OtfuEoXqjlz2YKGci/ooTOIxo5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310433020"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="310433020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 19:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="757408916"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="757408916"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2023 19:31:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRPYV-0007WT-0M;
	Mon, 13 Feb 2023 03:31:03 +0000
Date: Mon, 13 Feb 2023 11:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Christie <michael.christie@oracle.com>, brauner@kernel.org,
	ebiederm@xmission.com, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/5] kernel: Move kernel_clone_args's fn to new struct
Message-ID: <202302131159.c56w5Bln-lkp@intel.com>
References: <20230213010020.1813-2-michael.christie@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213010020.1813-2-michael.christie@oracle.com>

Hi Mike,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on vfs-idmapping/for-next linus/master v6.2-rc8]
[cannot apply to davem-sparc/master next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Christie/kernel-Move-kernel_clone_args-s-fn-to-new-struct/20230213-090304
patch link:    https://lore.kernel.org/r/20230213010020.1813-2-michael.christie%40oracle.com
patch subject: [PATCH 1/5] kernel: Move kernel_clone_args's fn to new struct
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230213/202302131159.c56w5Bln-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3eb77c0672cdc93fa577d5feb91b79f272d883b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Christie/kernel-Move-kernel_clone_args-s-fn-to-new-struct/20230213-090304
        git checkout 3eb77c0672cdc93fa577d5feb91b79f272d883b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131159.c56w5Bln-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/kernel/process.c:51:5: warning: no previous prototype for 'pid_to_processor_id' [-Wmissing-prototypes]
      51 | int pid_to_processor_id(int pid)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:87:7: warning: no previous prototype for '__switch_to' [-Wmissing-prototypes]
      87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
         |       ^~~~~~~~~~~
   arch/um/kernel/process.c: In function 'new_thread_handler':
   arch/um/kernel/process.c:122:28: warning: variable 'n' set but not used [-Wunused-but-set-variable]
     122 |         int (*fn)(void *), n;
         |                            ^
   arch/um/kernel/process.c: At top level:
   arch/um/kernel/process.c:140:6: warning: no previous prototype for 'fork_handler' [-Wmissing-prototypes]
     140 | void fork_handler(void)
         |      ^~~~~~~~~~~~
   arch/um/kernel/process.c: In function 'copy_thread':
>> arch/um/kernel/process.c:187:20: error: 'const struct kernel_clone_args' has no member named 'fn'; did you mean 'fns'?
     187 |         if (!args->fn) {
         |                    ^~
         |                    fns
   arch/um/kernel/process.c: At top level:
   arch/um/kernel/process.c:217:6: warning: no previous prototype for 'arch_cpu_idle' [-Wmissing-prototypes]
     217 | void arch_cpu_idle(void)
         |      ^~~~~~~~~~~~~
   arch/um/kernel/process.c:253:5: warning: no previous prototype for 'copy_to_user_proc' [-Wmissing-prototypes]
     253 | int copy_to_user_proc(void __user *to, void *from, int size)
         |     ^~~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:263:5: warning: no previous prototype for 'clear_user_proc' [-Wmissing-prototypes]
     263 | int clear_user_proc(void __user *buf, int size)
         |     ^~~~~~~~~~~~~~~
   arch/um/kernel/process.c:316:12: warning: no previous prototype for 'make_proc_sysemu' [-Wmissing-prototypes]
     316 | int __init make_proc_sysemu(void)
         |            ^~~~~~~~~~~~~~~~
   arch/um/kernel/process.c:356:15: warning: no previous prototype for 'arch_align_stack' [-Wmissing-prototypes]
     356 | unsigned long arch_align_stack(unsigned long sp)
         |               ^~~~~~~~~~~~~~~~


vim +187 arch/um/kernel/process.c

77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  157  
c5febea0956fd3 arch/um/kernel/process.c      Eric W. Biederman              2022-04-08  158  int copy_thread(struct task_struct * p, const struct kernel_clone_args *args)
^1da177e4c3f41 arch/um/kernel/process_kern.c Linus Torvalds                 2005-04-16  159  {
c5febea0956fd3 arch/um/kernel/process.c      Eric W. Biederman              2022-04-08  160  	unsigned long clone_flags = args->flags;
c5febea0956fd3 arch/um/kernel/process.c      Eric W. Biederman              2022-04-08  161  	unsigned long sp = args->stack;
c5febea0956fd3 arch/um/kernel/process.c      Eric W. Biederman              2022-04-08  162  	unsigned long tls = args->tls;
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  163  	void (*handler)(void);
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  164  	int ret = 0;
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  165  
^1da177e4c3f41 arch/um/kernel/process_kern.c Linus Torvalds                 2005-04-16  166  	p->thread = (struct thread_struct) INIT_THREAD;
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  167  
3eb77c0672cdc9 arch/um/kernel/process.c      Mike Christie                  2023-02-12  168  	if (!args->fns || !args->fns->thread_fn) {
2b067fc9dd143b arch/um/kernel/process.c      Al Viro                        2012-10-29  169  	  	memcpy(&p->thread.regs.regs, current_pt_regs(),
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  170  		       sizeof(p->thread.regs.regs));
a3170d2ec25f84 arch/um/kernel/process.c      Al Viro                        2012-05-22  171  		PT_REGS_SET_SYSCALL_RETURN(&p->thread.regs, 0);
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  172  		if (sp != 0)
18badddaa84e13 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  173  			REGS_SP(p->thread.regs.regs.gp) = sp;
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  174  
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  175  		handler = fork_handler;
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  176  
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  177  		arch_copy_thread(&current->thread.arch, &p->thread.arch);
d2ce4e92fa4f79 arch/um/kernel/process.c      Al Viro                        2012-09-20  178  	} else {
fbfe9c847edf57 arch/um/kernel/process.c      Ingo van Lil                   2011-09-14  179  		get_safe_registers(p->thread.regs.regs.gp, p->thread.regs.regs.fp);
3eb77c0672cdc9 arch/um/kernel/process.c      Mike Christie                  2023-02-12  180  		p->thread.request.u.thread.proc = args->fns->thread_fn;
5bd2e97c868a8a arch/um/kernel/process.c      Eric W. Biederman              2022-04-12  181  		p->thread.request.u.thread.arg = args->fn_arg;
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  182  		handler = new_thread_handler;
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  183  	}
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  184  
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  185  	new_thread(task_stack_page(p), &p->thread.switch_buf, handler);
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  186  
5bd2e97c868a8a arch/um/kernel/process.c      Eric W. Biederman              2022-04-12 @187  	if (!args->fn) {
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  188  		clear_flushed_tls(p);
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  189  
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  190  		/*
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  191  		 * Set a new TLS for the child thread?
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  192  		 */
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  193  		if (clone_flags & CLONE_SETTLS)
457677c70c7672 arch/um/kernel/process.c      Amanieu d'Antras               2020-01-04  194  			ret = arch_set_tls(p, tls);
77bf4400319db9 arch/um/kernel/process.c      Jeff Dike                      2007-10-16  195  	}
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  196  
aa6758d4867cd0 arch/um/kernel/process_kern.c Paolo 'Blaisorblade' Giarrusso 2006-03-31  197  	return ret;
^1da177e4c3f41 arch/um/kernel/process_kern.c Linus Torvalds                 2005-04-16  198  }
^1da177e4c3f41 arch/um/kernel/process_kern.c Linus Torvalds                 2005-04-16  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
