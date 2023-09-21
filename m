Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA549CA74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695324480; x=1726860480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=shAPycxG2fwnrrfUZmorIEJIlq/mRB7wdivH5nYo/Ww=;
  b=KZeJSorJwYmfkTuBPBASltVedBb2qV847amJKzj0Z54QN6SQa7VQPX/U
   gD9Xl42uQUEEN5fbJFe2bj/I9r6mukqcP17xTO6DlJyyAMTiktNUtbc74
   nslbscss6foIFIctbRs9weIOuMOIYrgZ6RbRvtbLJ7COKEim591ig2W2k
   /WIWB6uzVE8fSysqSrtJOCmwHohlJ4GvaRurLV4zfcn3OAbiHPW4zXFPM
   6bQuRoz1YkVkzg5r1LqB3/l9SHmdQiIYOp6WX2G0Zya0YGy1Ytn5cuBH5
   BCt2Z/0pslFg+npd0WOC0Yua88+RYbiLV7NHjFn62wCLXtyg3RfJZ6KCD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="466943301"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="466943301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 12:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="750516842"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="750516842"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2023 12:27:57 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjPL9-0000IB-2L;
	Thu, 21 Sep 2023 19:27:55 +0000
Date: Fri, 22 Sep 2023 03:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>
Subject: arch/microblaze/kernel/entry.S:945: Error: unknown opcode "suspend"
Message-ID: <202309220342.si10sBaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5cbe7c00aa0f7a81ec40c007f81a3e9c84581e3
commit: 88707ebe77e23e856981e597f322cabbf6415662 microblaze: Add custom break vector handler for mb manager
date:   12 months ago
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230922/202309220342.si10sBaE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220342.si10sBaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220342.si10sBaE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/microblaze/kernel/entry.S: Assembler messages:
>> arch/microblaze/kernel/entry.S:945: Error: unknown opcode "suspend"


vim +/suspend +945 arch/microblaze/kernel/entry.S

   825	
   826		/* restore all the tlb's */
   827		addik	r3, r0, TOPHYS(tlb_skip)
   828		addik	r6, r0, PT_TLBL0
   829		addik	r7, r0, PT_TLBH0
   830	restore_tlb:
   831		add	r6, r6, r1
   832		add	r7, r7, r1
   833		lwi	r2, r6, 0
   834		mts 	rtlblo, r2
   835		lwi	r2, r7, 0
   836		mts	rtlbhi, r2
   837		addik	r6, r6, 4
   838		addik	r7, r7, 4
   839		bgtid	r3, restore_tlb
   840		addik	r3, r3, -1
   841	
   842		lwi  	r5, r0, TOPHYS(xmb_manager_dev)
   843		lwi	r8, r0, TOPHYS(xmb_manager_reset_callback)
   844		set_vms
   845		/* return from reset need -8 to adjust for rtsd r15, 8 */
   846		addik   r15, r0, ret_from_reset - 8
   847		rtbd	r8, 0
   848		nop
   849	
   850	ret_from_reset:
   851		set_bip /* Ints masked for state restore */
   852		VM_OFF
   853		/* MS: Restore all regs */
   854		RESTORE_REGS
   855		lwi	r14, r1, PT_R14
   856		lwi	r16, r1, PT_PC
   857		addik	r1, r1, PT_SIZE + 36
   858		rtbd	r16, 0
   859		nop
   860	
   861	/*
   862	 * Break handler for MB Manager. Enter to _xmb_manager_break by
   863	 * injecting fault in one of the TMR Microblaze core.
   864	 * FIXME: This break handler supports getting
   865	 * called from kernel space only.
   866	 */
   867	C_ENTRY(_xmb_manager_break):
   868		/*
   869		 * Reserve memory in the stack for context store/restore
   870		 * (which includes memory for storing tlbs (max two tlbs))
   871		 */
   872		addik	r1, r1, -PT_SIZE - 36
   873		swi	r1, r0, xmb_manager_stackpointer
   874		SAVE_REGS
   875		swi	r14, r1, PT_R14	/* rewrite saved R14 value */
   876		swi	r16, r1, PT_PC; /* PC and r16 are the same */
   877	
   878		lwi	r6, r0, TOPHYS(xmb_manager_baseaddr)
   879		lwi	r7, r0, TOPHYS(xmb_manager_crval)
   880		/*
   881		 * When the break vector gets asserted because of error injection,
   882		 * the break signal must be blocked before exiting from the
   883		 * break handler, below code configures the tmr manager
   884		 * control register to block break signal.
   885		 */
   886		swi	r7, r6, 0
   887	
   888		/* Save the special purpose registers  */
   889		mfs	r2, rpid
   890		swi	r2, r1, PT_PID
   891	
   892		mfs	r2, rtlbx
   893		swi	r2, r1, PT_TLBI
   894	
   895		mfs	r2, rzpr
   896		swi	r2, r1, PT_ZPR
   897	
   898	#if CONFIG_XILINX_MICROBLAZE0_USE_FPU
   899		mfs	r2, rfsr
   900		swi	r2, r1, PT_FSR
   901	#endif
   902		mfs	r2, rmsr
   903		swi	r2, r1, PT_MSR
   904	
   905		/* Save all the tlb's */
   906		addik	r3, r0, TOPHYS(tlb_skip)
   907		addik	r6, r0, PT_TLBL0
   908		addik	r7, r0, PT_TLBH0
   909	save_tlb:
   910		add	r6, r6, r1
   911		add	r7, r7, r1
   912		mfs	r2, rtlblo
   913		swi	r2, r6, 0
   914		mfs	r2, rtlbhi
   915		swi	r2, r7, 0
   916		addik	r6, r6, 4
   917		addik	r7, r7, 4
   918		bgtid	r3, save_tlb
   919		addik	r3, r3, -1
   920	
   921		lwi  	r5, r0, TOPHYS(xmb_manager_dev)
   922		lwi	r8, r0, TOPHYS(xmb_manager_callback)
   923		/* return from break need -8 to adjust for rtsd r15, 8 */
   924		addik   r15, r0, ret_from_break - 8
   925		rtbd	r8, 0
   926		nop
   927	
   928	ret_from_break:
   929		/* flush the d-cache */
   930		bralid	r15, mb_flush_dcache
   931		nop
   932	
   933		/*
   934		 * To make sure microblaze i-cache is in a proper state
   935		 * invalidate the i-cache.
   936		 */
   937		bralid	r15, mb_invalidate_icache
   938		nop
   939	
   940		set_bip; /* Ints masked for state restore */
   941		VM_OFF;
   942		mbar	1
   943		mbar	2
   944		bri	4
 > 945		suspend
   946		nop
   947	#endif
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
