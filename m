Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8D1ADF7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692660583; x=1724196583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2iIqr0YL6L2uPTkQS2SW+/1NPESJCje4MuYIhOORRw=;
  b=F9paFKmE+pi9h/zydjbW7wkZ+w8Uw7GQy8cRKitcELXWYqmCuWAOAjog
   0KM6tIncjMtuuDOR3spGD/oIDoUP1vB8ssdXSZApf7ZMiDkpYSOvBcp1x
   QodsW6Wr6EevCbFyT/jARi7FfCXAQWBcvvpMxj0jP7Yx7Bq0w6OMEQuN2
   kk8xT/w/dO4Zq/Y6rO+/fh/AR6Sm2raE08+ft1TPvuwxLXl4V6P2EmqIJ
   ksPJr++1S1mATO0EoVMkaQ9PZqasTOhLKrvMqS2OE9C4X2VoBVt/RAUIh
   38wVUv23eNFvPjotXvsGpUfMueD6qytbfTZs1AkNgmppZmdUFO4MMq/Ak
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404727908"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404727908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765547691"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="765547691"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 16:29:36 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEL1-00013W-2e;
	Mon, 21 Aug 2023 23:29:35 +0000
Date: Tue, 22 Aug 2023 07:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 9/109] arch/powerpc/include/asm/paca.h:155:30:
 error: field 'tcd' has incomplete type
Message-ID: <202308220708.nRf5AUAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d
commit: 3a24ea0df83e32355d897a18bbd82e05986dcdc3 [9/109] powerpc/kuap: Use ASM feature fixups instead of static branches
config: powerpc64-randconfig-r036-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220708.nRf5AUAe-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220708.nRf5AUAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220708.nRf5AUAe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/percpu.h:20,
                    from arch/powerpc/include/asm/mmu.h:148,
                    from arch/powerpc/include/asm/nohash/kup-booke.h:6,
                    from arch/powerpc/include/asm/kup.h:24,
                    from arch/powerpc/mm/nohash/kup.c:11:
>> arch/powerpc/include/asm/paca.h:155:30: error: field 'tcd' has incomplete type
     155 |         struct tlb_core_data tcd;
         |                              ^~~
   arch/powerpc/include/asm/paca.h:291:36: error: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     291 | extern void copy_mm_to_paca(struct mm_struct *mm);
         |                                    ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +/tcd +155 arch/powerpc/include/asm/paca.h

91c60b5b820962 Benjamin Herrenschmidt 2009-06-02  131  
e0d68273d70695 Christophe Leroy       2022-09-19  132  #ifdef CONFIG_PPC_BOOK3E_64
016f8cf0d87bb2 Kevin Hao              2015-03-10  133  	u64 exgen[8] __aligned(0x40);
f67f4ef5fcdfde Scott Wood             2011-06-22  134  	/* Keep pgd in the same cacheline as the start of extlb */
016f8cf0d87bb2 Kevin Hao              2015-03-10  135  	pgd_t *pgd __aligned(0x40); /* Current PGD */
f67f4ef5fcdfde Scott Wood             2011-06-22  136  	pgd_t *kernel_pgd;		/* Kernel PGD */
28efc35fe68dac Scott Wood             2013-10-11  137  
28efc35fe68dac Scott Wood             2013-10-11  138  	/* Shared by all threads of a core -- points to tcd of first thread */
28efc35fe68dac Scott Wood             2013-10-11  139  	struct tlb_core_data *tcd_ptr;
28efc35fe68dac Scott Wood             2013-10-11  140  
609af38f8fc0f1 Scott Wood             2014-03-10  141  	/*
609af38f8fc0f1 Scott Wood             2014-03-10  142  	 * We can have up to 3 levels of reentrancy in the TLB miss handler,
609af38f8fc0f1 Scott Wood             2014-03-10  143  	 * in each of four exception levels (normal, crit, mcheck, debug).
609af38f8fc0f1 Scott Wood             2014-03-10  144  	 */
609af38f8fc0f1 Scott Wood             2014-03-10  145  	u64 extlb[12][EX_TLB_SIZE / sizeof(u64)];
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  146  	u64 exmc[8];		/* used for machine checks */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  147  	u64 excrit[8];		/* used for crit interrupts */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  148  	u64 exdbg[8];		/* used for debug interrupts */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  149  
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  150  	/* Kernel stack pointers for use by special exceptions */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  151  	void *mc_kstack;
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  152  	void *crit_kstack;
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  153  	void *dbg_kstack;
28efc35fe68dac Scott Wood             2013-10-11  154  
28efc35fe68dac Scott Wood             2013-10-11 @155  	struct tlb_core_data tcd;
e0d68273d70695 Christophe Leroy       2022-09-19  156  #endif /* CONFIG_PPC_BOOK3E_64 */
dce6670aaa7efe Benjamin Herrenschmidt 2009-07-23  157  

:::::: The code at line 155 was first introduced by commit
:::::: 28efc35fe68dacbddc4b12c2fa8f2df1593a4ad3 powerpc/e6500: TLB miss handler with hardware tablewalk support

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Scott Wood <scottwood@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
