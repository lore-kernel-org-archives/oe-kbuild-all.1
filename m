Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1FB48CC0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb3hLwsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701971388; x=1733507388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26EnMQFK0EjX1WalfP2qKr3jckhiwrU92Aqtcu2ga/A=;
  b=Mb3hLwskXhCnKkQ7kt7J4q+ELiJxbhLt0jnWrElZyc/p04UcNTvR7/7d
   pam7l0f7UR4NZRx2b7oiUK4omgpS8/jjTQ/WWZdvts62oWHRdgyHiVpoY
   Z2HB6Iiwm1W+il+FkG3B2wv2Fv+9d1YMyiRc180r2lNMzyXAtRUe47iAq
   huvYUG2I0HQzog5sGPBQQkvTHTRCiA+YSY8xHAiQHnul4JnaCCXrBVTEj
   9zzNES8vmfZMtOCeExJA6+0PuLjGOZEU99EZ8HgdVXRm6Oj25O/nhDs3N
   3UzU6xyZ8Bm3qgXE7U7vaRPNYOimqZvgS4jaHGqvD8EyJmYk1gTv9lcvN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1149211"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1149211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 09:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895223760"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895223760"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 09:49:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBIVG-000CdR-2u;
	Thu, 07 Dec 2023 17:49:38 +0000
Date: Fri, 8 Dec 2023 01:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/kernel/smp-cps.c:165:37: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202312080113.FNv9u897-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: fea8826d5fdc4ff5c93e883a738597129614039c MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
date:   9 months ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231208/202312080113.FNv9u897-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080113.FNv9u897-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080113.FNv9u897-lkp@intel.com/

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
