Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC115BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cO8Or62t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697615905; x=1729151905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I28ZCiP/AH3FMECMcM1LrL/f4cSgXXOYKwxWPLCefq4=;
  b=cO8Or62t75U+XYyyWFoD7ur9Sfd9u6Qw3Y7wCMPByY1rpvbgaZRdkXYZ
   HVWuIXeQzOlQHTgMkeK8UFXoie2Y4IM7e/dRTRhF9ILG7sQvt6Vxg0rky
   7pES1rDnTZ3c+3wtDd7u2wwyrVaH5jP7WTODWSo2m/YEdOod+07ZiiaP5
   vOLvaHeiNFkkax7Vr/6zfPJlBR0NJ3LcEs/b/DMy3iLpbncZ19s1J9Tmy
   KOTDQiGbASOzaq3PIQe5Kx+5JPPlVpIrBdR3h8K3SvKJF5IKLh5k/Vu9C
   ilq88G200ALp6offUcDRnf1mVZMwV1FTsdSCHD6IVUgw7zPjbDxUUna+a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384843669"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="384843669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756467971"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="756467971"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Oct 2023 00:58:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt1Rd-00005g-0Y;
	Wed, 18 Oct 2023 07:58:21 +0000
Date: Wed, 18 Oct 2023 15:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/5] mm: percpu: fix variable type of cpu
Message-ID: <202310181554.HybMih8u-lkp@intel.com>
References: <20231012024842.99703-3-rongwei.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024842.99703-3-rongwei.wang@linux.alibaba.com>

Hi Rongwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus tip/x86/mm linus/master v6.6-rc6]
[cannot apply to akpm-mm/mm-everything next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-percpu-fix-variable-type-of-cpu/20231017-102250
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-3-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 2/5] mm: percpu: fix variable type of cpu
config: loongarch-randconfig-001-20231018 (https://download.01.org/0day-ci/archive/20231018/202310181554.HybMih8u-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181554.HybMih8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181554.HybMih8u-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/numa.c: In function 'setup_per_cpu_areas':
>> arch/loongarch/kernel/numa.c:93:64: error: passing argument 5 of 'pcpu_embed_first_chunk' from incompatible pointer type [-Werror=incompatible-pointer-types]
      93 |                                             pcpu_cpu_distance, pcpu_cpu_to_node);
         |                                                                ^~~~~~~~~~~~~~~~
         |                                                                |
         |                                                                int (*)(int)
   In file included from include/linux/prandom.h:13,
                    from include/linux/random.h:153,
                    from include/linux/nodemask.h:97,
                    from include/linux/mmzone.h:18,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/numa.c:10:
   include/linux/percpu.h:116:58: note: expected 'int (*)(unsigned int)' but argument is of type 'int (*)(int)'
     116 |                                 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
>> arch/loongarch/kernel/numa.c:99:67: error: passing argument 2 of 'pcpu_page_first_chunk' from incompatible pointer type [-Werror=incompatible-pointer-types]
      99 |                 rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, pcpu_cpu_to_node);
         |                                                                   ^~~~~~~~~~~~~~~~
         |                                                                   |
         |                                                                   int (*)(int)
   include/linux/percpu.h:121:58: note: expected 'int (*)(unsigned int)' but argument is of type 'int (*)(int)'
     121 |                                 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pcpu_embed_first_chunk +93 arch/loongarch/kernel/numa.c

d4b6f1562a3c32 Huacai Chen 2022-05-31   72  
d4b6f1562a3c32 Huacai Chen 2022-05-31   73  void __init setup_per_cpu_areas(void)
d4b6f1562a3c32 Huacai Chen 2022-05-31   74  {
d4b6f1562a3c32 Huacai Chen 2022-05-31   75  	unsigned long delta;
d4b6f1562a3c32 Huacai Chen 2022-05-31   76  	unsigned int cpu;
d4b6f1562a3c32 Huacai Chen 2022-05-31   77  	int rc = -EINVAL;
d4b6f1562a3c32 Huacai Chen 2022-05-31   78  
d4b6f1562a3c32 Huacai Chen 2022-05-31   79  	if (pcpu_chosen_fc == PCPU_FC_AUTO) {
d4b6f1562a3c32 Huacai Chen 2022-05-31   80  		if (nr_node_ids >= 8)
d4b6f1562a3c32 Huacai Chen 2022-05-31   81  			pcpu_chosen_fc = PCPU_FC_PAGE;
d4b6f1562a3c32 Huacai Chen 2022-05-31   82  		else
d4b6f1562a3c32 Huacai Chen 2022-05-31   83  			pcpu_chosen_fc = PCPU_FC_EMBED;
d4b6f1562a3c32 Huacai Chen 2022-05-31   84  	}
d4b6f1562a3c32 Huacai Chen 2022-05-31   85  
d4b6f1562a3c32 Huacai Chen 2022-05-31   86  	/*
d4b6f1562a3c32 Huacai Chen 2022-05-31   87  	 * Always reserve area for module percpu variables.  That's
d4b6f1562a3c32 Huacai Chen 2022-05-31   88  	 * what the legacy allocator did.
d4b6f1562a3c32 Huacai Chen 2022-05-31   89  	 */
d4b6f1562a3c32 Huacai Chen 2022-05-31   90  	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
d4b6f1562a3c32 Huacai Chen 2022-05-31   91  		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
d4b6f1562a3c32 Huacai Chen 2022-05-31   92  					    PERCPU_DYNAMIC_RESERVE, PMD_SIZE,
d4b6f1562a3c32 Huacai Chen 2022-05-31  @93  					    pcpu_cpu_distance, pcpu_cpu_to_node);
d4b6f1562a3c32 Huacai Chen 2022-05-31   94  		if (rc < 0)
d4b6f1562a3c32 Huacai Chen 2022-05-31   95  			pr_warn("%s allocator failed (%d), falling back to page size\n",
d4b6f1562a3c32 Huacai Chen 2022-05-31   96  				pcpu_fc_names[pcpu_chosen_fc], rc);
d4b6f1562a3c32 Huacai Chen 2022-05-31   97  	}
d4b6f1562a3c32 Huacai Chen 2022-05-31   98  	if (rc < 0)
d4b6f1562a3c32 Huacai Chen 2022-05-31  @99  		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, pcpu_cpu_to_node);
d4b6f1562a3c32 Huacai Chen 2022-05-31  100  	if (rc < 0)
d4b6f1562a3c32 Huacai Chen 2022-05-31  101  		panic("cannot initialize percpu area (err=%d)", rc);
d4b6f1562a3c32 Huacai Chen 2022-05-31  102  
d4b6f1562a3c32 Huacai Chen 2022-05-31  103  	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
d4b6f1562a3c32 Huacai Chen 2022-05-31  104  	for_each_possible_cpu(cpu)
d4b6f1562a3c32 Huacai Chen 2022-05-31  105  		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
d4b6f1562a3c32 Huacai Chen 2022-05-31  106  }
d4b6f1562a3c32 Huacai Chen 2022-05-31  107  #endif
d4b6f1562a3c32 Huacai Chen 2022-05-31  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
