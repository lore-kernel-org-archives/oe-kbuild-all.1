Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384337F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 00:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689986336; x=1721522336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iuUWAWRHkntn4IIZjcD5mTm0HhrMGd1QaOk51IZNCkM=;
  b=EopPl7a6rEI0xwzwv/PQoOr1K5ZLGbKNAM2Y+LmBKjqNntO7pVdq6/kH
   nVKo5a7Q/lrj6KSua4/5Zb6a2g8fX1ej0StjaYig2p0btp2pEyJ/LoXXH
   SBCjdjwtT7EFn8iC7gJGriVpPSaybtRPlPx1UGV//tOfFdMw3GIXRfSWO
   hufM3wcVg5fKbWxB1WUsTzFE7V9+njcdIz5zc+CjuCGZZ2OiOVu+jOsCW
   REoVkJ4v2wQDWLL6NPW5S5LMf88TCLIXgqPZIL/KeWbt2hTWCq3y2c9Vd
   63sPNwypDIfiK/btSpW1VhUHBRO9wiA9DFi+5UIGRWDQj15I/Qj6VpHKo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="370749683"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="370749683"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 17:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898864853"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="898864853"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 17:38:52 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN0dd-0007np-2I;
	Sat, 22 Jul 2023 00:38:30 +0000
Date: Sat, 22 Jul 2023 08:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 5/42]
 arch/riscv/kernel/setup.c:271:13: warning: no previous prototype for
 'combo_spin_lock_init'
Message-ID: <202307220823.01PrZ0dx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: f1f72f77c9e8cc273bfb44cb928f5787abe50cd8 [5/42] riscv: Add combo spinlock support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307220823.01PrZ0dx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220823.01PrZ0dx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220823.01PrZ0dx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/setup.c:271:13: warning: no previous prototype for 'combo_spin_lock_init' [-Wmissing-prototypes]
     271 | void __init combo_spin_lock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/combo_spin_lock_init +271 arch/riscv/kernel/setup.c

   270	
 > 271	void __init combo_spin_lock_init(void)
   272	{
   273		asm_volatile_goto(ALTERNATIVE(
   274			"j %l[l_dis]",
   275			"nop",
   276			THEAD_VENDOR_ID,
   277			ERRATA_THEAD_QSPINLOCK,
   278			CONFIG_ERRATA_THEAD_QSPINLOCK)
   279			: : : : l_dis);
   280		return;
   281	l_dis:
   282		static_branch_disable(&qspinlock_key);
   283	}
   284	#else
   285	void __init combo_spin_lock_init(void)
   286	{
   287		return;
   288	}
   289	#endif
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
