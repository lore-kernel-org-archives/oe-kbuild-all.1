Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A01F93D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696275406; x=1727811406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG3Qgp6tLakGMIH3QJ3yWGpL0yk0xxAMWJ+QvjVu9Xs=;
  b=isaqUa+XxSpf2dPRXRgQtFwfeMgBgmXb/PML3sAHrMqdzGTLV8e2HMHu
   zAdIzprGVBqTEqS/GGAzf2JcKbz+rKHsWnzUlbdA2jB1xwVKR0zyDUG/E
   C3yH/lfyBMfRomplIrjO7bsPzdpn4SMS18NUHVrLrlyOY1OoUItKC+s0u
   UCkd54PpFP6GP0vGRKwsTfQ2QQRlIao2/Qbc0MQAnmMM7gC0k1jRPSXAL
   oVLIZGVBMeGYKwKnKTg+jbFBNeZdCeguqUsdFKwDN7Vg/sjS6NORklTEs
   e8rScNWyKqUYuXuMrlyYraeaPX+vjLSwmr7A4InL+gG/5FN8B3D7PrGKD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="386592936"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="386592936"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816413565"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816413565"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 12:36:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOig-0006J7-35;
	Mon, 02 Oct 2023 19:36:42 +0000
Date: Tue, 3 Oct 2023 03:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4]
 drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202310030329.a8QP4ka5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   52824b718cd06f98f41359a2a8d874d3d07c6f62
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-063-20231003 (https://download.01.org/0day-ci/archive/20231003/202310030329.a8QP4ka5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030329.a8QP4ka5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030329.a8QP4ka5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +59 drivers/android/android_debug_symbols.c

    50	
    51	/*
    52	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    53	 */
    54	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    55	#ifdef CONFIG_ARM64
    56		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    57	#endif
    58	#ifdef CONFIG_X86
  > 59		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    60	#endif
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
