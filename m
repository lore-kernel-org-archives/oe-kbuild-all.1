Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B36579F5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIob4V42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701404123; x=1732940123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f87WH8hJeO/keg+ZRyFTx3BDc3ZppYraVrDg4jbD/v0=;
  b=OIob4V42VR2MOthn9+Y8AbVzcG3Juy27kESiRDy47PjEx0Hj+I2dcsvH
   /XUMO2QWMR6i4tT/Bxqqx+c4XHSJKyNsdpCXbQyOsOml6MqAotE7tjpRv
   Xp+hr01kw2zW6R72wwLo/PzCmHIbdyBj1qetppVDKpy2X6tlezS9WYDbF
   cOejvanuld94AT+4F3qLqiWmE3jBLmO0HJE6EUFPylWi/0oeDHhdFCGXU
   dk2pbJnWpgm1d8nu12NmQ5ZUfeVXnjzS5UB97AXfOurYDvhew4Ivx7lXj
   e3iik1EkpLZr1uTbwW8XdU16K9Hv1UDk3OYIWCjBBJ5fBfddX2kTk1ghC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6710762"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="6710762"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 20:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745855681"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="745855681"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2023 20:15:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8uvu-000375-1L;
	Fri, 01 Dec 2023 04:15:18 +0000
Date: Fri, 1 Dec 2023 12:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 2568/30000]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202312011240.AMTuu65o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   c3ded0bd0c8081dd5da97302c8adeb6612642980
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [2568/30000] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231201/202312011240.AMTuu65o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312011240.AMTuu65o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312011240.AMTuu65o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
