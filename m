Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A22628F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3JUgof6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697229277; x=1728765277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W941hfpZ08c0Wo5yA3x4ZpJvzvi61XunU2nxAKotw0E=;
  b=Q3JUgof6b8dBeUcN9xMZVofJ+IGOJ0BA2hAso/I5USwLYlbPEDhtjUnE
   AUtBpeH7SQ2aNnzzSvII7Dq7oPiTbIxpq1mgr2QbyAzZ9+R68qcPn6BgA
   hSryWOuIPRDB6I3RUgHyRSmNTCuq7ek7omCmFSpwICBrRdT71ZJs6r5oE
   bDDpWGwuhsTssmlH255jew7dV60N2VPrM7A2D9ZWxD8z1jz8AwjyyP6U5
   +zqHs/BijcJfVA8qVu/CPkxgZXdQXLrcXh2kYUx4XdhaUriAYBqnxPnqD
   bl4OBp1tY7ErMv6GUgUKK04U3JdUfcS0baSubgzg9PwpPMfjJoE5SgJ5E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364622745"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364622745"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 13:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825188227"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825188227"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 13:34:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrOrh-0005MJ-06;
	Fri, 13 Oct 2023 20:34:33 +0000
Date: Sat, 14 Oct 2023 04:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2959/15768]
 drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for
 'imx_gpcv2_raise_softirq'
Message-ID: <202310140426.UmsXbKKR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 24467b72b33a0463acff6ee96c4ce75ef0009356 [2959/15768] LF-2438 drivers: irqchip: irq-imx-gpcv2: Remove the smp_cross_call reference
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140426.UmsXbKKR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140426.UmsXbKKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140426.UmsXbKKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for 'imx_gpcv2_raise_softirq' [-Wmissing-prototypes]
      91 | void imx_gpcv2_raise_softirq(const struct cpumask *mask,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-imx-gpcv2.c:224:5: warning: no previous prototype for 'imx8mq_gpcv2_irq_set_affinity' [-Wmissing-prototypes]
     224 | int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]


vim +/imx_gpcv2_raise_softirq +91 drivers/irqchip/irq-imx-gpcv2.c

    89	
    90	#ifdef CONFIG_SMP
  > 91	void imx_gpcv2_raise_softirq(const struct cpumask *mask,
    92						  unsigned int irq)
    93	{
    94		struct arm_smccc_res res;
    95	
    96		if (!err11171)
    97			return;
    98	
    99		/* now call into EL3 and take care of the wakeup */
   100		arm_smccc_smc(FSL_SIP_GPC, FSL_SIP_CONFIG_GPC_CORE_WAKE,
   101				*cpumask_bits(mask), 0, 0, 0, 0, 0, &res);
   102	}
   103	#endif
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
