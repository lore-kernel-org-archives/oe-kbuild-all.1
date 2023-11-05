Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055563E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFFDsgfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699150894; x=1730686894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CaY3CC0WNk8WL8476Dryz/uiGLAwotyZKHhxIOpGcCE=;
  b=JFFDsgfRGL90O9QEyMJ1OiyT2iRWGkKt1C+Fx04fFbiK29KnNHbEtuGz
   x0WmKxHe4EeafGTJtJa55d45Ii4YAounxYsRk+/Khy2AapimyP1qV0Ead
   zpJQnbUdgCRhVeChmcppjZapKgsUDbO2htRwOKlhXUW5Twh5zge/F1/xa
   ARPY2yONys1TIueX3t43umUyoiT15Lo8/YLce8y3y/XQsOP8qpKbynofb
   ylRLymLmHscOw+RHZY3xcxXj2bK/5kimmGhk1h68ZdT5vTy6RE6wuhBlP
   74+a3ohCjWaIjO4tY1LfGJ2nYKc6OsAJj6dz8bhxQ1VjjRga2/LDxYvmv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379512427"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379512427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 19:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="765630241"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="765630241"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2023 19:21:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzSlX-0004vI-02;
	Sun, 05 Nov 2023 02:21:31 +0000
Date: Sun, 5 Nov 2023 10:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/4]
 drivers/android/android_debug_symbols.c:59:9: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <202311051002.HEybMq0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   7bec8a8180669a95c44a767fa76f2a3dd3c46220
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: x86_64-randconfig-121-20231103 (https://download.01.org/0day-ci/archive/20231105/202311051002.HEybMq0a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051002.HEybMq0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051002.HEybMq0a-lkp@intel.com/

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
