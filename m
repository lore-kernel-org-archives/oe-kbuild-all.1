Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF076FC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689445927; x=1720981927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rrd7kd3InoWIVuxLQKxPPzWe5Zx0I8gYZqBamMjO8Pw=;
  b=Opj/JRoyAMTWhbO8nZ4zv4FZNoM4Q4m6RhFOpRiyAgF+WjieSk/vsa34
   +S3Gz5kaX+3Si0dVWsD6EeIT2b2TGv7JTvdgBdlx+FbR4y+4XmomNk9r6
   2ggq0L8FFCLII316/DcLxbU6sskW3bV4BMmq8eIqGUwy+121gU1QQZzAh
   GR7rufIaQSC6lOXSE5NjuV9yINT1zlFmdzPareDk2Pw1LkyGgS7NZlid8
   CrHveEcQ0t7wVGzJZ71QTGifmMYS6wK6lNlRb1rVI3W8VTKTbcpoFvla9
   I3t2xSCXhraO775cvkJNBwatQBXxaFD7RZ53HkzUQZv6szcedc17o60N/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="355620903"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="355620903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 11:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053417696"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="1053417696"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2023 11:32:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKk3n-0008J3-2a;
	Sat, 15 Jul 2023 18:32:03 +0000
Date: Sun, 16 Jul 2023 02:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:lam-old 5/18] kernel/signal.c:1268:29: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202307160246.59YDVq4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git lam-old
head:   e64abde4d7ab69eee2b4d11651d989c451930292
commit: a94e74d3666c7519881ae8b80afb7bbf34d9a9c7 [5/18] x86/uaccess: Provide untagged_addr() and remove tags before address check
config: i386-randconfig-i063-20230713 (https://download.01.org/0day-ci/archive/20230716/202307160246.59YDVq4v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160246.59YDVq4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160246.59YDVq4v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/signal.c: note: in included file (through arch/x86/include/uapi/asm/signal.h, arch/x86/include/asm/signal.h, include/uapi/linux/signal.h, ...):
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:195:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:195:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:195:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:198:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:198:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:198:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:480:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:480:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:480:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:484:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:484:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:484:34: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:542:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *ka @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:542:53: sparse:     expected struct k_sigaction *ka
   kernel/signal.c:542:53: sparse:     got struct k_sigaction [noderef] __rcu *
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:765:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:765:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:765:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:890:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:890:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:890:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/signal.c:1087:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/signal.c:1087:9: sparse:     expected struct lockdep_map const *lock
   kernel/signal.c:1087:9: sparse:     got struct lockdep_map [noderef] __rcu *
>> kernel/signal.c:1268:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] __user *__ptr_clean @@     got unsigned char * @@
   kernel/signal.c:1268:29: sparse:     expected unsigned char [noderef] __user *__ptr_clean
   kernel/signal.c:1268:29: sparse:     got unsigned char *
   kernel/signal.c:1329:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1329:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1329:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1330:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *action @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:1330:16: sparse:     expected struct k_sigaction *action
   kernel/signal.c:1330:16: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:1350:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1350:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1350:34: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1939:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1939:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1939:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2049:44: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2068:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2068:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2068:65: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2069:40: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2087:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *psig @@     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
   kernel/signal.c:2087:14: sparse:     expected struct sighand_struct *psig
   kernel/signal.c:2087:14: sparse:     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand
   kernel/signal.c:2116:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2116:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2116:53: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2117:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2117:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2117:34: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2146:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2146:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2146:24: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2149:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2149:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2149:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/signal.c:2182:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2182:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2182:17: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2222:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2222:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2222:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2224:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2224:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2224:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2281:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2281:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2281:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2316:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2316:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2316:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2356:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2356:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2356:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2358:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2358:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2358:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2458:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2458:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2458:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2542:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2542:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2542:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2554:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2554:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2554:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2589:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2589:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2589:52: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2591:49: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2629:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2629:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2629:49: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2958:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2958:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2958:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2978:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2978:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2978:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3045:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3045:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3045:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3047:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3047:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3047:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3198:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3198:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3198:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3201:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3201:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3201:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3590:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3590:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3590:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3602:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3602:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3602:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3607:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3607:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3607:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3612:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3612:29: sparse:     expected struct spinlock [usertype] *lock

vim +1268 kernel/signal.c

7978b567d31555 Sukadev Bhattiprolu 2009-04-02  1255  
4aaefee589f97b Al Viro             2012-11-05  1256  static void print_fatal_signal(int signr)
45807a1df9f51d Ingo Molnar         2007-07-15  1257  {
4aaefee589f97b Al Viro             2012-11-05  1258  	struct pt_regs *regs = signal_pt_regs();
747800efbe8b98 Wang Xiaoqiang      2016-05-23  1259  	pr_info("potentially unexpected fatal signal %d.\n", signr);
45807a1df9f51d Ingo Molnar         2007-07-15  1260  
ca5cd877ae699e Al Viro             2007-10-29  1261  #if defined(__i386__) && !defined(__arch_um__)
747800efbe8b98 Wang Xiaoqiang      2016-05-23  1262  	pr_info("code at %08lx: ", regs->ip);
45807a1df9f51d Ingo Molnar         2007-07-15  1263  	{
45807a1df9f51d Ingo Molnar         2007-07-15  1264  		int i;
45807a1df9f51d Ingo Molnar         2007-07-15  1265  		for (i = 0; i < 16; i++) {
45807a1df9f51d Ingo Molnar         2007-07-15  1266  			unsigned char insn;
45807a1df9f51d Ingo Molnar         2007-07-15  1267  
b45c6e76bc2c72 Andi Kleen          2010-01-08 @1268  			if (get_user(insn, (unsigned char *)(regs->ip + i)))
b45c6e76bc2c72 Andi Kleen          2010-01-08  1269  				break;
747800efbe8b98 Wang Xiaoqiang      2016-05-23  1270  			pr_cont("%02x ", insn);
45807a1df9f51d Ingo Molnar         2007-07-15  1271  		}
45807a1df9f51d Ingo Molnar         2007-07-15  1272  	}
747800efbe8b98 Wang Xiaoqiang      2016-05-23  1273  	pr_cont("\n");
45807a1df9f51d Ingo Molnar         2007-07-15  1274  #endif
3a9f84d354ce1e Ed Swierk           2009-01-26  1275  	preempt_disable();
45807a1df9f51d Ingo Molnar         2007-07-15  1276  	show_regs(regs);
3a9f84d354ce1e Ed Swierk           2009-01-26  1277  	preempt_enable();
45807a1df9f51d Ingo Molnar         2007-07-15  1278  }
45807a1df9f51d Ingo Molnar         2007-07-15  1279  

:::::: The code at line 1268 was first introduced by commit
:::::: b45c6e76bc2c72f6426c14bed64fdcbc9bf37cb0 kernel/signal.c: fix kernel information leak with print-fatal-signals=1

:::::: TO: Andi Kleen <andi@firstfloor.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
