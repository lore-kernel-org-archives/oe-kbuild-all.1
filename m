Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151512919
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694266524; x=1725802524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVu3tiDU0An9oMd1+32Ja4qf+AJtSRM+YdWvQXV2EF8=;
  b=T536r2T8iz+XiuRJt4cs7weZPYua2gssBhGR20EmlqOaAkBmn6tGymj3
   JgJVzIg0A4uUGYEAcAur4VzjmygYOy0FTywFQfmrBTlmxKvhJMVKRyvT/
   ExzBkZS0CK8k2X4f+Rpy/EijwvQdABCaFMcwzyuiOQUtoNwJrK3Q920HF
   gqp1HJIPQk8u1J2zRaGe3FEVjKZ2TeU9smEFs3l7UpPN3F26QheXCs6yh
   ttZ3qF4OmNSPCWi7AQPW7cqN1BPcCuHMtr8XayGgRjPF1HPuckA1Die5t
   FxC/yTxsaqcRTqyIurMu1RdFbPtE4PoBp9c9j46EL98Gb3PyhnZD50TuO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464190329"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="464190329"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 06:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073618274"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="1073618274"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2023 06:35:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qey7M-0003Y2-0D;
	Sat, 09 Sep 2023 13:35:20 +0000
Date: Sat, 9 Sep 2023 21:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.4 3/13] arch/mips/include/asm/page.h:156:39:
 error: initializer element is not constant
Message-ID: <202309092136.QgGAmIub-lkp@intel.com>
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
commit: dd4c108ee0b2ef49e5bdb599d491fd029ddca09e [3/13] mm/execmem, arch: convert simple overrides of module_alloc to execmem
config: mips-bigsur_defconfig (https://download.01.org/0day-ci/archive/20230909/202309092136.QgGAmIub-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309092136.QgGAmIub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309092136.QgGAmIub-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/module.c:40:34: error: 'MODULES_VADDR' undeclared here (not in a function)
      40 |                         .start = MODULES_VADDR,
         |                                  ^~~~~~~~~~~~~
   arch/mips/kernel/module.c:41:32: error: 'MODULES_END' undeclared here (not in a function); did you mean 'MODULE_END'?
      41 |                         .end = MODULES_END,
         |                                ^~~~~~~~~~~
         |                                MODULE_END
   In file included from arch/mips/include/asm/io.h:29,
                    from include/linux/io.h:13,
                    from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from include/linux/moduleloader.h:6,
                    from arch/mips/kernel/module.c:12:
>> arch/mips/include/asm/page.h:156:39: error: initializer element is not constant
     156 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                       ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
         |                         ^~~~~~~~
   arch/mips/kernel/module.c:42:35: note: in expansion of macro 'PAGE_KERNEL'
      42 |                         .pgprot = PAGE_KERNEL,
         |                                   ^~~~~~~~~~~
   arch/mips/include/asm/page.h:156:39: note: (near initialization for '(anonymous).pgprot')
     156 | #define __pgprot(x)     ((pgprot_t) { (x) } )
         |                                       ^
   arch/mips/include/asm/pgtable.h:30:25: note: in expansion of macro '__pgprot'
      30 | #define PAGE_KERNEL     __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
         |                         ^~~~~~~~
   arch/mips/kernel/module.c:42:35: note: in expansion of macro 'PAGE_KERNEL'
      42 |                         .pgprot = PAGE_KERNEL,
         |                                   ^~~~~~~~~~~


vim +156 arch/mips/include/asm/page.h

c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  150  
c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  151  /*
c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  152   * Manipulate page protection bits
c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  153   */
c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  154  typedef struct { unsigned long pgprot; } pgprot_t;
c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle   2005-02-10  155  #define pgprot_val(x)	((x).pgprot)
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16 @156  #define __pgprot(x)	((pgprot_t) { (x) } )
b3a428b4b18d49 arch/mips/include/asm/page.h Hassan Naveed  2018-10-29  157  #define pte_pgprot(x)	__pgprot(pte_val(x) & ~_PFN_MASK)
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  158  

:::::: The code at line 156 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
