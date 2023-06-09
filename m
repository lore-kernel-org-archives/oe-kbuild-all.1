Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA415AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 05:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686288082; x=1717824082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TD3CEUBIX4L4Eh+d2bkJYZOZLvdmbaio5nhbcbSp/pc=;
  b=kEczd7DTqaGT7MuDKtw241cbvPielaww8AgsHe95mrwmffsVj9n/HU8z
   pqmEqrWLUGF1dh9lId6e1KqJH35UkFRuOmxDfjcD6esGYeHlfm/PIL7+Z
   +kI2HUACwP3Lq9LhGv2l0n40zzICewgzu1gIWJQfMCy+pM+tue98VrES/
   FrHGORdi9ND46IXszbCIWKsG+ENoSA9J2RdxuWnOG0H77kj8RKTSbzVYN
   e2mY0ToAz4VuWFqMT2d+5F2pO2wvFcBZzcpVMr3bkrtWh5ahY2pdohX3k
   ojvzDMB9j6VNw4Pa+UhMgUszFzCWjI+H2NA6GbMeWuGB1W52pVPK+uNWb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360003624"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="360003624"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 22:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710236061"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="710236061"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 22:21:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7UYp-0008gK-28;
	Fri, 09 Jun 2023 05:21:19 +0000
Date: Fri, 9 Jun 2023 13:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 294/311] arch/mips/mm/tlb-r4k.c:300:16:
 warning: variable 'pmdp' set but not used
Message-ID: <202306091304.cNVIspK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d1d35dbc9e5cdc940d98b2b0e0eadd18fc15142a
commit: 8e6e6d43e65f1aa66f2413c533cc978682a0052a [294/311] mips: update_mmu_cache() can replace __update_tlb()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306091304.cNVIspK0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=8e6e6d43e65f1aa66f2413c533cc978682a0052a
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 8e6e6d43e65f1aa66f2413c533cc978682a0052a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/mm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091304.cNVIspK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/mm/tlb-r4k.c: In function 'update_mmu_cache':
>> arch/mips/mm/tlb-r4k.c:300:16: warning: variable 'pmdp' set but not used [-Wunused-but-set-variable]
     300 |         pmd_t *pmdp;
         |                ^~~~
   arch/mips/mm/tlb-r4k.c: At top level:
   arch/mips/mm/tlb-r4k.c:542:6: warning: no previous prototype for 'tlb_init' [-Wmissing-prototypes]
     542 | void tlb_init(void)
         |      ^~~~~~~~


vim +/pmdp +300 arch/mips/mm/tlb-r4k.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  287  
^1da177e4c3f41 Linus Torvalds  2005-04-16  288  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  289   * We will need multiple versions of update_mmu_cache(), one that just
^1da177e4c3f41 Linus Torvalds  2005-04-16  290   * updates the TLB with the new pte(s), and another which also checks
^1da177e4c3f41 Linus Torvalds  2005-04-16  291   * for the R4k "end of page" hardware bug and does the needy.
^1da177e4c3f41 Linus Torvalds  2005-04-16  292   */
8e6e6d43e65f1a Hugh Dickins    2023-06-08  293  void update_mmu_cache(struct vm_area_struct *vma,
8e6e6d43e65f1a Hugh Dickins    2023-06-08  294  		      unsigned long address, pte_t *ptep)
^1da177e4c3f41 Linus Torvalds  2005-04-16  295  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  296  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds  2005-04-16  297  	pgd_t *pgdp;
2bee1b58484f03 Mike Rapoport   2019-11-21  298  	p4d_t *p4dp;
c6e8b587718c48 Ralf Baechle    2005-02-10  299  	pud_t *pudp;
^1da177e4c3f41 Linus Torvalds  2005-04-16 @300  	pmd_t *pmdp;
^1da177e4c3f41 Linus Torvalds  2005-04-16  301  	int idx, pid;
^1da177e4c3f41 Linus Torvalds  2005-04-16  302  
^1da177e4c3f41 Linus Torvalds  2005-04-16  303  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  304  	 * Handle debugger faulting in for debugee.
^1da177e4c3f41 Linus Torvalds  2005-04-16  305  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  306  	if (current->active_mm != vma->vm_mm)
^1da177e4c3f41 Linus Torvalds  2005-04-16  307  		return;
^1da177e4c3f41 Linus Torvalds  2005-04-16  308  
b633648c5ad3cf Ralf Baechle    2014-05-23  309  	local_irq_save(flags);
172546bf601356 Thiemo Seufer   2005-04-02  310  
6a8dff6ab16c90 Markos Chandras 2014-11-17  311  	htw_stop();
^1da177e4c3f41 Linus Torvalds  2005-04-16  312  	address &= (PAGE_MASK << 1);
c8790d657b0a8d Paul Burton     2019-02-02  313  	if (cpu_has_mmid) {
c8790d657b0a8d Paul Burton     2019-02-02  314  		write_c0_entryhi(address);
c8790d657b0a8d Paul Burton     2019-02-02  315  	} else {
c8790d657b0a8d Paul Burton     2019-02-02  316  		pid = read_c0_entryhi() & cpu_asid_mask(&current_cpu_data);
^1da177e4c3f41 Linus Torvalds  2005-04-16  317  		write_c0_entryhi(address | pid);
c8790d657b0a8d Paul Burton     2019-02-02  318  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  319  	pgdp = pgd_offset(vma->vm_mm, address);
^1da177e4c3f41 Linus Torvalds  2005-04-16  320  	mtc0_tlbw_hazard();
^1da177e4c3f41 Linus Torvalds  2005-04-16  321  	tlb_probe();
432bef2a31668a Ralf Baechle    2006-09-08  322  	tlb_probe_hazard();
2bee1b58484f03 Mike Rapoport   2019-11-21  323  	p4dp = p4d_offset(pgdp, address);
2bee1b58484f03 Mike Rapoport   2019-11-21  324  	pudp = pud_offset(p4dp, address);
c6e8b587718c48 Ralf Baechle    2005-02-10  325  	pmdp = pmd_offset(pudp, address);
^1da177e4c3f41 Linus Torvalds  2005-04-16  326  	idx = read_c0_index();
aa1762f49c81a1 David Daney     2012-10-17  327  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
fd062c847a8cea David Daney     2009-05-27  328  	/* this could be a huge page  */
8e6e6d43e65f1a Hugh Dickins    2023-06-08  329  	if (ptep == (pte_t *)pmdp) {
fd062c847a8cea David Daney     2009-05-27  330  		unsigned long lo;
fd062c847a8cea David Daney     2009-05-27  331  		write_c0_pagemask(PM_HUGE_MASK);
6dd9344cfc41bc David Daney     2010-02-10  332  		lo = pte_to_entrylo(pte_val(*ptep));
fd062c847a8cea David Daney     2009-05-27  333  		write_c0_entrylo0(lo);
fd062c847a8cea David Daney     2009-05-27  334  		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
fd062c847a8cea David Daney     2009-05-27  335  
fd062c847a8cea David Daney     2009-05-27  336  		mtc0_tlbw_hazard();
fd062c847a8cea David Daney     2009-05-27  337  		if (idx < 0)
fd062c847a8cea David Daney     2009-05-27  338  			tlb_write_random();
fd062c847a8cea David Daney     2009-05-27  339  		else
fd062c847a8cea David Daney     2009-05-27  340  			tlb_write_indexed();
fb944c9ba3f483 Ralf Baechle    2012-10-17  341  		tlbw_use_hazard();
fd062c847a8cea David Daney     2009-05-27  342  		write_c0_pagemask(PM_DEFAULT_MASK);
fd062c847a8cea David Daney     2009-05-27  343  	} else
fd062c847a8cea David Daney     2009-05-27  344  #endif
fd062c847a8cea David Daney     2009-05-27  345  	{
34adb28d500e64 Ralf Baechle    2014-11-22  346  #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
c5b367835cfc7a Steven J. Hill  2015-02-26  347  #ifdef CONFIG_XPA
c5b367835cfc7a Steven J. Hill  2015-02-26  348  		write_c0_entrylo0(pte_to_entrylo(ptep->pte_high));
4b6f99d307ed6c James Hogan     2016-04-19  349  		if (cpu_has_xpa)
c5b367835cfc7a Steven J. Hill  2015-02-26  350  			writex_c0_entrylo0(ptep->pte_low & _PFNX_MASK);
c5b367835cfc7a Steven J. Hill  2015-02-26  351  		ptep++;
c5b367835cfc7a Steven J. Hill  2015-02-26  352  		write_c0_entrylo1(pte_to_entrylo(ptep->pte_high));
4b6f99d307ed6c James Hogan     2016-04-19  353  		if (cpu_has_xpa)
c5b367835cfc7a Steven J. Hill  2015-02-26  354  			writex_c0_entrylo1(ptep->pte_low & _PFNX_MASK);
c5b367835cfc7a Steven J. Hill  2015-02-26  355  #else
^1da177e4c3f41 Linus Torvalds  2005-04-16  356  		write_c0_entrylo0(ptep->pte_high);
^1da177e4c3f41 Linus Torvalds  2005-04-16  357  		ptep++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  358  		write_c0_entrylo1(ptep->pte_high);
c5b367835cfc7a Steven J. Hill  2015-02-26  359  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  360  #else
6dd9344cfc41bc David Daney     2010-02-10  361  		write_c0_entrylo0(pte_to_entrylo(pte_val(*ptep++)));
6dd9344cfc41bc David Daney     2010-02-10  362  		write_c0_entrylo1(pte_to_entrylo(pte_val(*ptep)));
^1da177e4c3f41 Linus Torvalds  2005-04-16  363  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  364  		mtc0_tlbw_hazard();
^1da177e4c3f41 Linus Torvalds  2005-04-16  365  		if (idx < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  366  			tlb_write_random();
^1da177e4c3f41 Linus Torvalds  2005-04-16  367  		else
^1da177e4c3f41 Linus Torvalds  2005-04-16  368  			tlb_write_indexed();
fd062c847a8cea David Daney     2009-05-27  369  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  370  	tlbw_use_hazard();
6a8dff6ab16c90 Markos Chandras 2014-11-17  371  	htw_start();
06e4814eec988f Huacai Chen     2016-03-03  372  	flush_micro_tlb_vm(vma);
b633648c5ad3cf Ralf Baechle    2014-05-23  373  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  374  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  375  

:::::: The code at line 300 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
