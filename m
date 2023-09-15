Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962BE2591
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694760392; x=1726296392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTKf/YXMIiQ7VJy96NA8HvBvq65gejnD0Vum9h8O5mY=;
  b=Kkmjx9mtFxyVLT+SutvVfsdD7Xeujr8IbIZXRHzlBH2Z/EOJKmypMb+6
   qTgqrPY6Jr4v9cdWor7TQaDCDJNfWzkf/CWDvXmy01/WTznTzw51zh3CA
   pBWaxvliuZwKKiPTftBNskKeSluVe7lm+EMWM/m94+YNCK2+ABHUyBhPy
   086MMQSAwRR7nYneqbgedVnVzAu1A0J8q43opDWgTTCbR2DvJwC+WdJ/J
   s4oXcnyHlX8rOaBnYHS1RFpuuH4CfrxdXjkv5owOJ+Lrn/zl/gXQG7SR7
   9XEeNj6UMvzdqGpdexVRla/hX2qGiaUMaWO7mJBtHYiAxKK00mFuQaCXA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465541498"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="465541498"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 23:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918547836"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="918547836"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 23:46:30 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh2ay-0002aj-18;
	Fri, 15 Sep 2023 06:46:28 +0000
Date: Fri, 15 Sep 2023 14:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 9/36] aarch64-linux-ld:
 arch/arm64/kernel/cpufeature.o:undefined reference to `cpu_enable_fpsimd'
Message-ID: <202309151416.T2eo4FrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   f18c17118a776a4fe1509f9f8ef624245725008f
commit: e043f25122190a7ef642a88e408661d3d0d6062c [9/36] arm64: use a positive cpucap for FP/SIMD
config: arm64-randconfig-001-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151416.T2eo4FrF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151416.T2eo4FrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151416.T2eo4FrF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: arch/arm64/kernel/cpufeature.o:(.rodata+0x550): undefined reference to `cpu_enable_fpsimd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
