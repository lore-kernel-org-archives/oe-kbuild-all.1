Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082DC7496
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694292050; x=1725828050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBT4WzhBpw/HtlMsdP4bT38MyxGdXpAk0CZfPNZQ0Vk=;
  b=nX063NIPx5q2KACe1NOP4WG5YHvY2RBMBhG37QDLpuAlNTbrBAyqC+rg
   m2Lbbsu+H+U7KBV6MtypdlcOHXsDg60utzzzHzN1bkjAxWBaq6yBpUyzA
   4mdWdOSbqfOqcPtIax0243re0JZoB2vTBZgakbq/KiLSt8RK35po8w6oG
   XihrwkjNYP5y/ENwPK2BKBLf1+N592JTOGoZpDwJWX2z4vgns6/5KXOv5
   lE4QV19fCCMKL5H0sZdfSsloEBGpLk3EMV35ShvoaHbWX0HEBWoDAbGEO
   1BW+4q8CWyeZRFrM9YSv7LwnswYZ3Hw6opJLjUkrLB58Uq4hHmBqrvH53
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441861268"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441861268"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 13:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736324195"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="736324195"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 13:40:48 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf4l3-0003uv-2g;
	Sat, 09 Sep 2023 20:40:45 +0000
Date: Sun, 10 Sep 2023 04:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.4 10/13] arch/mips/mm/init.c:578:32: error:
 'MODULES_END' undeclared here (not in a function); did you mean
 'MODULE_END'?
Message-ID: <202309100402.7cTZX41o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.4
head:   508766bb924d535d2b80ffe50eb60eae25c0c02e
commit: 5aa685724b6621283dedc62ec2e5d1a1b985f567 [10/13] arch: make execmem setup available regardless of CONFIG_MODULES
config: mips-bigsur_defconfig (https://download.01.org/0day-ci/archive/20230910/202309100402.7cTZX41o-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100402.7cTZX41o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100402.7cTZX41o-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/mm/init.c:61:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
      61 | void setup_zero_pages(void)
         |      ^~~~~~~~~~~~~~~~
>> arch/mips/mm/init.c:578:32: error: 'MODULES_END' undeclared here (not in a function); did you mean 'MODULE_END'?
     578 |                         .end = MODULES_END,
         |                                ^~~~~~~~~~~
         |                                MODULE_END
   In file included from arch/mips/include/asm/io.h:29,
                    from include/linux/io.h:13,
                    from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/mips/mm/init.c:15:
   arch/mips/include/asm/page.h:156:39: error: initializer element is not constant
     156 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                       ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
         |                         ^~~~~~~~
   arch/mips/mm/init.c:579:35: note: in expansion of macro 'PAGE_KERNEL'
     579 |                         .pgprot = PAGE_KERNEL,
         |                                   ^~~~~~~~~~~
   arch/mips/include/asm/page.h:156:39: note: (near initialization for '(anonymous).pgprot')
     156 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                       ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
         |                         ^~~~~~~~
   arch/mips/mm/init.c:579:35: note: in expansion of macro 'PAGE_KERNEL'
     579 |                         .pgprot = PAGE_KERNEL,
         |                                   ^~~~~~~~~~~


vim +578 arch/mips/mm/init.c

   572	
   573	#if defined(CONFIG_EXECMEM) && defined(MODULE_START)
   574	static struct execmem_params execmem_params __ro_after_init = {
   575		.ranges = {
   576			[EXECMEM_DEFAULT] = {
   577				.start = MODULE_START,
 > 578				.end = MODULES_END,
   579				.pgprot = PAGE_KERNEL,
   580				.alignment = 1,
   581			},
   582		},
   583	};
   584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
