Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393ECAD53
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693605478; x=1725141478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZwZ3OAB97QQaMveabB38nMqL+Uhn/q1PYgAFgSV2nY=;
  b=ke/e2G+72qMaYC+UcEpHi8sTd7B+UIq/cHQozZawTsvceiA+7SWxtUr7
   fJVv7xZofs1qLEVRC1ABajq8KBYQ9+9kkA/VycWhanKDOd+E//PWoTRXP
   ETW/Tmb8mtBg4MrF3QF1EVAI9DJ7GoBIqHJrW43/DgowItQJvQ3JHF4NR
   xb2i3fXPvtsh9/aJDa+gIiF732aiGze+Q87epK8NTPoDHT9mR73Wv+IEr
   smZz//FQnQUxmnsZwf+5IF21BXdatGTd5fTewRbiqYP7PAgGEaI2UW5fm
   +50whlSv3JKFO5l2zqU9DeUiUhnFX1rdia/HhChG0GspkmP82DfxN00qh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376246081"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="376246081"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070886470"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="1070886470"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 14:57:56 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcC9K-0001g3-0L;
	Fri, 01 Sep 2023 21:57:54 +0000
Date: Sat, 2 Sep 2023 05:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 15/21]
 arch/s390/kernel/rethook.c:6:6: error: conflicting types for
 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *,
 bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
Message-ID: <202309020520.vTdgQezd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   398bcb2fcb442bac23d5e514b6144ef4c32d74e8
commit: e86cf59b1f5e0e053bc45e73a72f11a73874ed83 [15/21] fprobe: rethook: Use ftrace_regs in fprobe exit handler and rethook
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230902/202309020520.vTdgQezd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020520.vTdgQezd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020520.vTdgQezd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/rethook.c:6:6: error: conflicting types for 'arch_rethook_prepare'; have 'void(struct rethook_node *, struct pt_regs *, bool)' {aka 'void(struct rethook_node *, struct pt_regs *, _Bool)'}
       6 | void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/rethook.c:2:
   include/linux/rethook.h:73:6: note: previous declaration of 'arch_rethook_prepare' with type 'void(struct rethook_node *, struct ftrace_regs *, bool)' {aka 'void(struct rethook_node *, struct ftrace_regs *, _Bool)'}
      73 | void arch_rethook_prepare(struct rethook_node *node, struct ftrace_regs *regs, bool mcount);
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/rethook.c:16:6: error: conflicting types for 'arch_rethook_fixup_return'; have 'void(struct pt_regs *, long unsigned int)'
      16 | void arch_rethook_fixup_return(struct pt_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rethook.h:88:6: note: previous declaration of 'arch_rethook_fixup_return' with type 'void(struct ftrace_regs *, long unsigned int)'
      88 | void arch_rethook_fixup_return(struct ftrace_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/rethook.c: In function 'arch_rethook_trampoline_callback':
>> arch/s390/kernel/rethook.c:29:43: error: passing argument 1 of 'rethook_trampoline_handler' from incompatible pointer type [-Werror=incompatible-pointer-types]
      29 |         return rethook_trampoline_handler(regs, regs->gprs[15]);
         |                                           ^~~~
         |                                           |
         |                                           struct pt_regs *
   include/linux/rethook.h:92:62: note: expected 'struct ftrace_regs *' but argument is of type 'struct pt_regs *'
      92 | unsigned long rethook_trampoline_handler(struct ftrace_regs *regs,
         |                                          ~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +6 arch/s390/kernel/rethook.c

1a280f48c0e403 Vasily Gorbik 2023-01-17   5  
1a280f48c0e403 Vasily Gorbik 2023-01-17  @6  void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
1a280f48c0e403 Vasily Gorbik 2023-01-17   7  {
1a280f48c0e403 Vasily Gorbik 2023-01-17   8  	rh->ret_addr = regs->gprs[14];
1a280f48c0e403 Vasily Gorbik 2023-01-17   9  	rh->frame = regs->gprs[15];
1a280f48c0e403 Vasily Gorbik 2023-01-17  10  
1a280f48c0e403 Vasily Gorbik 2023-01-17  11  	/* Replace the return addr with trampoline addr */
1a280f48c0e403 Vasily Gorbik 2023-01-17  12  	regs->gprs[14] = (unsigned long)&arch_rethook_trampoline;
1a280f48c0e403 Vasily Gorbik 2023-01-17  13  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  14  NOKPROBE_SYMBOL(arch_rethook_prepare);
1a280f48c0e403 Vasily Gorbik 2023-01-17  15  
1a280f48c0e403 Vasily Gorbik 2023-01-17 @16  void arch_rethook_fixup_return(struct pt_regs *regs,
1a280f48c0e403 Vasily Gorbik 2023-01-17  17  			       unsigned long correct_ret_addr)
1a280f48c0e403 Vasily Gorbik 2023-01-17  18  {
1a280f48c0e403 Vasily Gorbik 2023-01-17  19  	/* Replace fake return address with real one. */
1a280f48c0e403 Vasily Gorbik 2023-01-17  20  	regs->gprs[14] = correct_ret_addr;
1a280f48c0e403 Vasily Gorbik 2023-01-17  21  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  22  NOKPROBE_SYMBOL(arch_rethook_fixup_return);
1a280f48c0e403 Vasily Gorbik 2023-01-17  23  
1a280f48c0e403 Vasily Gorbik 2023-01-17  24  /*
1a280f48c0e403 Vasily Gorbik 2023-01-17  25   * Called from arch_rethook_trampoline
1a280f48c0e403 Vasily Gorbik 2023-01-17  26   */
1a280f48c0e403 Vasily Gorbik 2023-01-17  27  unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
1a280f48c0e403 Vasily Gorbik 2023-01-17  28  {
1a280f48c0e403 Vasily Gorbik 2023-01-17 @29  	return rethook_trampoline_handler(regs, regs->gprs[15]);
1a280f48c0e403 Vasily Gorbik 2023-01-17  30  }
1a280f48c0e403 Vasily Gorbik 2023-01-17  31  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
1a280f48c0e403 Vasily Gorbik 2023-01-17  32  

:::::: The code at line 6 was first introduced by commit
:::::: 1a280f48c0e403903cf0b4231c95b948e664f25a s390/kprobes: replace kretprobe with rethook

:::::: TO: Vasily Gorbik <gor@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
