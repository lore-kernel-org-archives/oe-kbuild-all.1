Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11E3224
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694884508; x=1726420508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hn2Wh//oxIMqmN2qtpMtij8/YU06CoX5G8fiWa4Z3SI=;
  b=h4hQMKuB3s9iQRcG0dV/mvGsIAI2SxUR3JhaC/2Mh2lxDzaWI5b84z/J
   3v9FVtIrRSI8FIc18ryY1HmYWwfvcOdPCfcv96zQ66ijUjbGeFHExrUai
   4qXjzn/6LpkS9PNaeuJpxy4VJ/E72fNkmlyQokiOC0k1i5J33AL4SlLLj
   fIbzWj9WMpwkhlNFZFNsimeRVjs4DxehXcNBix61ScHYq8gwaUdxH//wA
   h3NLUEW7FwthnZ8fDEUvwyPahN2D+/RwsmlvJVGvbJB4rTPvgvs3whc1L
   +hJodu64E3+NJwE/tG+z7ctl8TyZTu0fVROIMrEH6SXwkPrLL6ztM9Gmv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382168373"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382168373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 10:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835569433"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835569433"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 10:15:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhYsq-0004VT-2o;
	Sat, 16 Sep 2023 17:15:04 +0000
Date: Sun, 17 Sep 2023 01:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 368/377] arch/arm64/kernel/irq.c:47:25:
 error: implicit declaration of function 'scs_alloc'; did you mean
 'sve_alloc'?
Message-ID: <202309170115.I0tlEF0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   3f0a1fb5d8bcd8777a55e6561b8c106786575bfa
commit: 7ba37647a7b452d7bebbfe5656248279cda26f14 [368/377] arm64: scs: use vmapped IRQ and SDEI shadow stacks
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230917/202309170115.I0tlEF0s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170115.I0tlEF0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170115.I0tlEF0s-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/irq.c: In function 'init_irq_scs':
>> arch/arm64/kernel/irq.c:47:25: error: implicit declaration of function 'scs_alloc'; did you mean 'sve_alloc'? [-Werror=implicit-function-declaration]
      47 |                         scs_alloc(cpu_to_node(cpu));
         |                         ^~~~~~~~~
         |                         sve_alloc
   arch/arm64/kernel/irq.c:46:57: warning: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 |                 per_cpu(irq_shadow_call_stack_ptr, cpu) =
         |                                                         ^
   arch/arm64/kernel/irq.c: At top level:
   arch/arm64/kernel/irq.c:74:13: warning: no previous prototype for 'init_IRQ' [-Wmissing-prototypes]
      74 | void __init init_IRQ(void)
         |             ^~~~~~~~
   cc1: some warnings being treated as errors


vim +47 arch/arm64/kernel/irq.c

    37	
    38	static void init_irq_scs(void)
    39	{
    40		int cpu;
    41	
    42		if (!IS_ENABLED(CONFIG_SHADOW_CALL_STACK))
    43			return;
    44	
    45		for_each_possible_cpu(cpu)
    46			per_cpu(irq_shadow_call_stack_ptr, cpu) =
  > 47				scs_alloc(cpu_to_node(cpu));
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
