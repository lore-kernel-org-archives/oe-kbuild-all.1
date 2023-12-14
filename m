Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6F41233
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLSncXVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702555665; x=1734091665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a5l6AyeZg5uA2PXcmvELUL5lCX1KzgHNYFWNUx48pIY=;
  b=OLSncXVv4d/wwYHIJ6VpGfc09WDItIK24nc3FbRTnq7EjUnYxt75rAMl
   ArTPvgSSQw0DBi+XQz7UgPsJOV4vJvZSkGps7osM3H8EnSIeLdcG5+rwj
   njSwG4yUtmRoyRHzSeuOUbCqI9D5/BEgRtJwh4GXA9i+pXzNr2/HOM2m4
   fP3EaNmaf2QQtf0xxPs1ZmTfjjKc8lf22DLw6YqvxzGW549a23tjUkWHG
   Gv+H5wVgQXXeZ30r9nTNQLPyVgPhbjIcd8NZuI7MR7sGJMF3U0sJO3irI
   f42aPE+eXx0Z6dURBTWJ/56kJzkaue2kaL6B1b/CWnMpt1TQyE5pP1Fws
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="374617404"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="374617404"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 04:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774350337"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="774350337"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Dec 2023 04:07:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDkV8-000M1t-1J;
	Thu, 14 Dec 2023 12:07:38 +0000
Date: Thu, 14 Dec 2023 20:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/kernel/smp-cps.c:165:37: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202312142008.8HExX4uH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: fea8826d5fdc4ff5c93e883a738597129614039c MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
date:   10 months ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231214/202312142008.8HExX4uH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142008.8HExX4uH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142008.8HExX4uH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/kernel/smp-cps.c:165:37: sparse: sparse: cast removes address space '__iomem' of expression
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:131:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@

vim +/__iomem +165 arch/mips/kernel/smp-cps.c

   118	
   119	static void __init cps_prepare_cpus(unsigned int max_cpus)
   120	{
   121		unsigned ncores, core_vpes, c, cca;
   122		bool cca_unsuitable, cores_limited;
   123		u32 *entry_code;
   124	
   125		mips_mt_set_cpuoptions();
   126	
   127		/* Detect whether the CCA is unsuited to multi-core SMP */
   128		cca = read_c0_config() & CONF_CM_CMASK;
   129		switch (cca) {
   130		case 0x4: /* CWBE */
   131		case 0x5: /* CWB */
   132			/* The CCA is coherent, multi-core is fine */
   133			cca_unsuitable = false;
   134			break;
   135	
   136		default:
   137			/* CCA is not coherent, multi-core is not usable */
   138			cca_unsuitable = true;
   139		}
   140	
   141		/* Warn the user if the CCA prevents multi-core */
   142		cores_limited = false;
   143		if (cca_unsuitable || cpu_has_dc_aliases) {
   144			for_each_present_cpu(c) {
   145				if (cpus_are_siblings(smp_processor_id(), c))
   146					continue;
   147	
   148				set_cpu_present(c, false);
   149				cores_limited = true;
   150			}
   151		}
   152		if (cores_limited)
   153			pr_warn("Using only one core due to %s%s%s\n",
   154				cca_unsuitable ? "unsuitable CCA" : "",
   155				(cca_unsuitable && cpu_has_dc_aliases) ? " & " : "",
   156				cpu_has_dc_aliases ? "dcache aliasing" : "");
   157	
   158		/*
   159		 * Patch the start of mips_cps_core_entry to provide:
   160		 *
   161		 * s0 = kseg0 CCA
   162		 */
   163		entry_code = (u32 *)&mips_cps_core_entry;
   164		uasm_i_addiu(&entry_code, 16, 0, cca);
 > 165		UASM_i_LA(&entry_code, 17, (long)mips_gcr_base);
   166		BUG_ON((void *)entry_code > (void *)&mips_cps_core_entry_patch_end);
   167		blast_dcache_range((unsigned long)&mips_cps_core_entry,
   168				   (unsigned long)entry_code);
   169		bc_wback_inv((unsigned long)&mips_cps_core_entry,
   170			     (void *)entry_code - (void *)&mips_cps_core_entry);
   171		__sync();
   172	
   173		/* Allocate core boot configuration structs */
   174		ncores = mips_cps_numcores(0);
   175		mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
   176						GFP_KERNEL);
   177		if (!mips_cps_core_bootcfg) {
   178			pr_err("Failed to allocate boot config for %u cores\n", ncores);
   179			goto err_out;
   180		}
   181	
   182		/* Allocate VPE boot configuration structs */
   183		for (c = 0; c < ncores; c++) {
   184			core_vpes = core_vpe_count(0, c);
   185			mips_cps_core_bootcfg[c].vpe_config = kcalloc(core_vpes,
   186					sizeof(*mips_cps_core_bootcfg[c].vpe_config),
   187					GFP_KERNEL);
   188			if (!mips_cps_core_bootcfg[c].vpe_config) {
   189				pr_err("Failed to allocate %u VPE boot configs\n",
   190				       core_vpes);
   191				goto err_out;
   192			}
   193		}
   194	
   195		/* Mark this CPU as booted */
   196		atomic_set(&mips_cps_core_bootcfg[cpu_core(&current_cpu_data)].vpe_mask,
   197			   1 << cpu_vpe_id(&current_cpu_data));
   198	
   199		return;
   200	err_out:
   201		/* Clean up allocations */
   202		if (mips_cps_core_bootcfg) {
   203			for (c = 0; c < ncores; c++)
   204				kfree(mips_cps_core_bootcfg[c].vpe_config);
   205			kfree(mips_cps_core_bootcfg);
   206			mips_cps_core_bootcfg = NULL;
   207		}
   208	
   209		/* Effectively disable SMP by declaring CPUs not present */
   210		for_each_possible_cpu(c) {
   211			if (c == 0)
   212				continue;
   213			set_cpu_present(c, false);
   214		}
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
