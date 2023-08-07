Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD3511C8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691425335; x=1722961335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOoH5OSEY4AOGIjoSPF+Cm4RO0GQLUDU6OzNim570F0=;
  b=WruPKNWroiEn4xqc+DrehaiL0vZ9+brhgpEgYBvitd7CdJ+MLuU7wjhU
   TM/UfaonX9zvUWarexUkn5q+xi5N4FGvMnVc9QXsd1VQ6ZHkE8+Dph1Ri
   7OuaMnxSofFacWL67BrprFsk8spK8G8IPLS1vAZP51yAObjuaMTkr6gW2
   FhKskXgbZ2cmrbzmCuu4mMBBuhXDl7JhPpEZyWoNMxOf28UpK3DVglkLB
   M/pyQTgy5O6Y+sNtld4dZgT4yWShYlhmw+asfXnrlkp8DAGmM4+MnkZZs
   FcZ0WaTemYhsYo/DX2PvxAvtMYOR6wLdv/iINBF2eePEe+zzRZAoV3IiI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350177854"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="350177854"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 09:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731029674"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="731029674"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Aug 2023 09:22:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT2za-0004lH-2L;
	Mon, 07 Aug 2023 16:22:02 +0000
Date: Tue, 8 Aug 2023 00:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Christopher M. Riedl" <cmr@informatik.wtf>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.4.y 5527/24285]
 arch/powerpc/xmon/xmon.c:489:13: error: variable 'cmd' might be clobbered by
 'longjmp' or 'vfork'
Message-ID: <202308080056.MgsBpxgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christopher,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   dae166b715990303db0f2eb0d29d7005eb7a183a
commit: 99c63ba21d2ea9d28880b0341b25e4a4ce8a18bb [5527/24285] powerpc/xmon: Restrict when kernel is locked down
config: powerpc-randconfig-r033-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080056.MgsBpxgK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080056.MgsBpxgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080056.MgsBpxgK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/xmon/xmon.c: In function 'xmon_print_symbol':
   arch/powerpc/xmon/xmon.c:3535:21: error: variable 'name' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
    3535 |         const char *name = NULL;
         |                     ^~~~
   arch/powerpc/xmon/xmon.c: In function 'show_tasks':
   arch/powerpc/xmon/xmon.c:3217:29: error: variable 'tsk' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
    3217 |         struct task_struct *tsk = NULL;
         |                             ^~~
   arch/powerpc/xmon/xmon.c: In function 'xmon_core.constprop':
>> arch/powerpc/xmon/xmon.c:489:13: error: variable 'cmd' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
     489 |         int cmd = 0;
         |             ^~~
   cc1: all warnings being treated as errors


vim +489 arch/powerpc/xmon/xmon.c

daf8f40391b2a1 arch/powerpc/xmon/xmon.c Josh Boyer           2009-09-23  486  
b0da985644faa4 arch/powerpc/xmon/xmon.c Arnd Bergmann        2006-01-11  487  static int xmon_core(struct pt_regs *regs, int fromipi)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  488  {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16 @489  	int cmd = 0;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  490  	struct bpt *bp;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  491  	long recurse_jmp[JMP_BUF_LEN];
99c63ba21d2ea9 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  492  	bool locked_down;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  493  	unsigned long offset;
f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  494  	unsigned long flags;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  495  #ifdef CONFIG_SMP
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  496  	int cpu;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  497  	int secondary;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  498  #endif
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  499  
f13659e0b39075 arch/powerpc/xmon/xmon.c Anton Blanchard      2007-03-21  500  	local_irq_save(flags);
a71d64b4dc4067 arch/powerpc/xmon/xmon.c Anton Blanchard      2014-08-05  501  	hard_irq_disable();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  502  
99c63ba21d2ea9 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  503  	locked_down = xmon_is_locked_down();
99c63ba21d2ea9 arch/powerpc/xmon/xmon.c Christopher M. Riedl 2019-09-07  504  
aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  505  	if (!fromipi) {
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  506  		tracing_enabled = tracing_is_on();
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  507  		tracing_off();
aaf06665f7ea3e arch/powerpc/xmon/xmon.c Naveen N. Rao        2019-06-27  508  	}
ed49f7fd6438dc arch/powerpc/xmon/xmon.c Breno Leitao         2017-08-02  509  
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  510  	bp = in_breakpoint_table(regs->nip, &offset);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  511  	if (bp != NULL) {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  512  		regs->nip = bp->address + offset;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  513  		atomic_dec(&bp->ref_count);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  514  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  515  
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  516  	remove_cpu_bpts();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds       2005-04-16  517  

:::::: The code at line 489 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
