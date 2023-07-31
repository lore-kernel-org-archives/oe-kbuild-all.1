Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C21DDD9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690832940; x=1722368940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pq/kyvYB7ZFiOY2GuvCvjXGKopjWNOprVEuGMLdZDsk=;
  b=ERMR2k90h2ZY5QgiZVZAX7EWs4OrTX3GFfOAdCcK14eenTI13C6LwPc6
   FldFC53eqpojTq0YLCzWSgbEGBNuqUHYtoeLLojIexwZKiyVG1JqI1cr9
   TeHeabwhEMKsTuEkTuOGxskGWTbEvF+3PVNtunGzgitHNtz0Dm89E4nCX
   c7Mx2eqvO6wV5CAh54CkMufrrWT15ER1xX+puPvGoLnRTAACnPtnjVv3o
   CfFD/O3D9VLl9tf9FNp3Hfuzl5DxvYQwaQoHKRhyS5Q3IM5E0L4u6/nfR
   Wt2Q1EuWR/f16ZKdjsaUo2j+17bsnzlSGm8ul23RXGE33ImpJnQ5u+uMw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349410603"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="349410603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818504829"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="818504829"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2023 12:48:58 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYsz-0005KH-1p;
	Mon, 31 Jul 2023 19:48:57 +0000
Date: Tue, 1 Aug 2023 03:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 1/3] include/linux/cfi.h:27: multiple
 definition of `is_cfi_strap';
 arch/arm64/kernel/traps.o:include/linux/cfi.h:27: first defined here
Message-ID: <202308010348.dcpazRl3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   4f9f74c73972973d748a5f6dfa7269877af08d69
commit: cb359d95f4863f4d34f3745765c9bce6447824c1 [1/3] x86/kprobes: Prohibit probing on compiler generated CFI checking code
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230801/202308010348.dcpazRl3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010348.dcpazRl3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010348.dcpazRl3-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: kernel/module/main.o: in function `is_cfi_strap':
>> include/linux/cfi.h:27: multiple definition of `is_cfi_strap'; arch/arm64/kernel/traps.o:include/linux/cfi.h:27: first defined here


vim +27 include/linux/cfi.h

    23	
    24	#ifdef CONFIG_ARCH_USES_CFI_TRAPS
    25	bool is_cfi_trap(unsigned long addr);
    26	#else
  > 27	bool is_cfi_strap(unsigned long addr) { return false; }
    28	#endif
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
