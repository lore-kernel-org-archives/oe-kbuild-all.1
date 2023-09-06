Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356310954
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694030942; x=1725566942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6bg2vKrtIYy/wM5AiL8zxUzdaQzosw69kCWxamPp/4=;
  b=NnToZN/FFPUJPxIyGVvpHmLHTvoJ/IPbOZzJ3PJlX9Ebsf4fOeILdBeF
   KeQOpnUO68Kep96Rlt2469sNAfHd5ZksgVNuGn1kLUyy7FtdXAsbi6GW0
   eOod7u0r+GCN+a20093dRZzIfHzig4IL3QWvCvvowKTG2arhXjryyJyuj
   MQN9pMe7gLiyV3csp/2zj3MIOjdhEftJMkpfMeMD+LN68mIprGf2CyJTq
   Y6S0JqWPbGyxwS2CPO6+IuncJxyHkw7YWl1+KocZku7iOiuAxtS73ro9o
   s4R6bSBsunElp5LL3tqUkfRVCxqdAiwbAB5RJdueowDbDHbwj+Ue9IX0/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463547341"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="463547341"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856600048"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856600048"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 13:09:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdype-0000Yj-1A;
	Wed, 06 Sep 2023 20:08:58 +0000
Date: Thu, 7 Sep 2023 04:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] powerpc: Make crashing cpu to be discovered first in
 kdump kernel.
Message-ID: <202309070340.bUAU00E4-lkp@intel.com>
References: <169402313576.1071869.18233618318394691773.stgit@jupiter>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169402313576.1071869.18233618318394691773.stgit@jupiter>

Hi Mahesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.5 next-20230906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahesh-Salgaonkar/powerpc-Make-crashing-cpu-to-be-discovered-first-in-kdump-kernel/20230907-020116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/169402313576.1071869.18233618318394691773.stgit%40jupiter
patch subject: [RFC PATCH] powerpc: Make crashing cpu to be discovered first in kdump kernel.
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230907/202309070340.bUAU00E4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070340.bUAU00E4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070340.bUAU00E4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/prom.c: In function 'early_init_dt_scan_cpus':
>> arch/powerpc/kernel/prom.c:360:28: error: lvalue required as left operand of assignment
     360 |                 nr_cpu_ids = _ALIGN_UP(nr_cpu_ids, nthreads);
         |                            ^


vim +360 arch/powerpc/kernel/prom.c

   327	
   328	static int __init early_init_dt_scan_cpus(unsigned long node,
   329						  const char *uname, int depth,
   330						  void *data)
   331	{
   332		const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
   333		const __be32 *prop;
   334		const __be32 *intserv;
   335		int i, nthreads;
   336		int len;
   337		int found = -1;
   338		int found_thread = 0;
   339	
   340		/* We are scanning "cpu" nodes only */
   341		if (type == NULL || strcmp(type, "cpu") != 0)
   342			return 0;
   343	
   344		if (IS_ENABLED(CONFIG_PPC64))
   345			boot_cpu_node_count++;
   346	
   347		/* Get physical cpuid */
   348		intserv = of_get_flat_dt_prop(node, "ibm,ppc-interrupt-server#s", &len);
   349		if (!intserv)
   350			intserv = of_get_flat_dt_prop(node, "reg", &len);
   351	
   352		nthreads = len / sizeof(int);
   353	
   354		/*
   355		 * Align nr_cpu_ids to correct SMT value. This will help us to allocate
   356		 * pacas correctly to accomodate boot_cpu != 0 scenario e.g. in kdump
   357		 * kernel the boot cpu can be any cpu between 0 through nthreads.
   358		 */
   359		if (nr_cpu_ids % nthreads) {
 > 360			nr_cpu_ids = _ALIGN_UP(nr_cpu_ids, nthreads);
   361			pr_info("Aligned nr_cpus to SMT=%d, nr_cpu_ids = %d\n", nthreads, nr_cpu_ids);
   362		}
   363	
   364		/*
   365		 * Now see if any of these threads match our boot cpu.
   366		 * NOTE: This must match the parsing done in smp_setup_cpu_maps.
   367		 */
   368		for (i = 0; i < nthreads; i++) {
   369			if (be32_to_cpu(intserv[i]) ==
   370				fdt_boot_cpuid_phys(initial_boot_params)) {
   371				found = boot_cpu_count;
   372				found_thread = i;
   373			}
   374	#ifdef CONFIG_SMP
   375			/* logical cpu id is always 0 on UP kernels */
   376			boot_cpu_count++;
   377	#endif
   378		}
   379	
   380		/* Not the boot CPU */
   381		if (found < 0)
   382			return 0;
   383	
   384		DBG("boot cpu: logical %d physical %d\n", found,
   385		    be32_to_cpu(intserv[found_thread]));
   386		boot_cpuid = found;
   387	
   388		if (IS_ENABLED(CONFIG_PPC64))
   389			boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
   390	
   391		/*
   392		 * PAPR defines "logical" PVR values for cpus that
   393		 * meet various levels of the architecture:
   394		 * 0x0f000001	Architecture version 2.04
   395		 * 0x0f000002	Architecture version 2.05
   396		 * If the cpu-version property in the cpu node contains
   397		 * such a value, we call identify_cpu again with the
   398		 * logical PVR value in order to use the cpu feature
   399		 * bits appropriate for the architecture level.
   400		 *
   401		 * A POWER6 partition in "POWER6 architected" mode
   402		 * uses the 0x0f000002 PVR value; in POWER5+ mode
   403		 * it uses 0x0f000001.
   404		 *
   405		 * If we're using device tree CPU feature discovery then we don't
   406		 * support the cpu-version property, and it's the responsibility of the
   407		 * firmware/hypervisor to provide the correct feature set for the
   408		 * architecture level via the ibm,powerpc-cpu-features binding.
   409		 */
   410		if (!dt_cpu_ftrs_in_use()) {
   411			prop = of_get_flat_dt_prop(node, "cpu-version", NULL);
   412			if (prop && (be32_to_cpup(prop) & 0xff000000) == 0x0f000000) {
   413				identify_cpu(0, be32_to_cpup(prop));
   414				seq_buf_printf(&ppc_hw_desc, "0x%04x ", be32_to_cpup(prop));
   415			}
   416	
   417			check_cpu_feature_properties(node);
   418			check_cpu_features(node, "ibm,pa-features", ibm_pa_features,
   419					   ARRAY_SIZE(ibm_pa_features));
   420			check_cpu_features(node, "ibm,pi-features", ibm_pi_features,
   421					   ARRAY_SIZE(ibm_pi_features));
   422		}
   423	
   424		identical_pvr_fixup(node);
   425		init_mmu_slb_size(node);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
