Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB91DA23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724373612; cv=none; b=oXqu/C2uyQ+XS9AhrAafI/vW3aQLT9LZqbZ5Uu5S2L/ng4TosLqJ01pO6U7m/LCFB/9f2Z156gr6/AIGX6ErFP7gapN5hL5l5ol8Ih0MOkBu3BGrolxqgXiiz2oDDOuzpa49xjADwfLqAod2+T1Mm3AR8qAReqgogD/QInIAvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724373612; c=relaxed/simple;
	bh=xF0irMEpU8yB96Ns2d8bV3o3BpWNuvH1VcGyNm1FeUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB0/8s48GHRX+AG/Au2EhNsb6T90rI1Ix846GmWeuxHkPNPGKze2PaeXTzJGYsZiHM/ZhbRZ/DNytqJ4hqtKav3BYyHL990wFf+w2X2IYVFCL3V5anENM6YS1nKyuGImQL62AqDbaUmPu0saH1aghGliV8B6Gl5INvYpi/erkFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbnsKjRa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbnsKjRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724373611; x=1755909611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xF0irMEpU8yB96Ns2d8bV3o3BpWNuvH1VcGyNm1FeUM=;
  b=BbnsKjRafi8hUbpORtC++ikKad17YRttZa6aqAvkAct9Ld23bEiP19hg
   RoeP6OGD0liEVSLLYbwMhVK8aA7ce+UX1aa4M6oLMviX2mlot7fqRvBIT
   /dUhNepFCfeVHAellXex4v+QiuEXIczatwtRSbmOtJ3iLpOLyxacQ+Gzh
   nHf1I45Ksgr3wvkwIiWW2els9i1SGwsvOY8sDV2/vgXEsiuxSMHYWKy4r
   Ph9gTtiPd8OasbFrhwFVErRwa0dmbb5P9t6jJEq7M0RfP0QpJvLSejJ31
   qJO9ToBrSb4lHDTWwvRCK3YiIs6YUwpTNtRAMEtb+pEMoxy6XdFmao8Mn
   Q==;
X-CSE-ConnectionGUID: 5ccafG1HTTuyO+AvQ25+AQ==
X-CSE-MsgGUID: QLHwOYt7QzCJ++zi5A9OOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22791844"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="22791844"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 17:40:10 -0700
X-CSE-ConnectionGUID: 9nxY7R2xTzOXxhImGTSkOQ==
X-CSE-MsgGUID: HF5cgmZ5TJyzDYk4K93dJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66322620"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2024 17:40:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shILW-000DKc-2i;
	Fri, 23 Aug 2024 00:40:06 +0000
Date: Fri, 23 Aug 2024 08:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13455/13476]
 arch/arm64/kernel/virtcca_cvm_tsi.c:57:30: warning: variable 'ver' is
 uninitialized when used here
Message-ID: <202408230839.S2haccDx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   eccf28eefc9db7799534bd84bb958f3ecf978e2d
commit: 721f4ea899ff2ab4e3283767cf125dc5952c1d15 [13455/13476] cvm_tsi: add support virtcca attestation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408230839.S2haccDx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230839.S2haccDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230839.S2haccDx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/virtcca_cvm_tsi.c:3:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/virtcca_cvm_tsi.c:57:30: warning: variable 'ver' is uninitialized when used here [-Wuninitialized]
      57 |                         TSI_ABI_VERSION_GET_MAJOR(ver),
         |                                                   ^~~
   include/linux/printk.h:508:37: note: expanded from macro 'pr_warn'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/arm64/include/asm/virtcca_cvm_smc.h:16:47: note: expanded from macro 'TSI_ABI_VERSION_GET_MAJOR'
      16 | #define TSI_ABI_VERSION_GET_MAJOR(_version) ((_version) >> 16)
         |                                               ^~~~~~~~
   arch/arm64/kernel/virtcca_cvm_tsi.c:39:19: note: initialize the variable 'ver' to silence this warning
      39 |         unsigned long ver;
         |                          ^
         |                           = 0
   6 warnings generated.


vim +/ver +57 arch/arm64/kernel/virtcca_cvm_tsi.c

    36	
    37	static int __init tmm_tsi_init(void)
    38	{
    39		unsigned long ver;
    40		int ret;
    41	
    42		if (!is_virtcca_cvm_world())
    43			return -EIO;
    44	
    45		ret = misc_register(&ioctl_dev);
    46		if (ret) {
    47			pr_err("tmm_tsi: misc device register failed (%d)!\n", ret);
    48			return ret;
    49		}
    50	
    51		/* Allocate a large memory */
    52		token.buf = kzalloc(GRANULE_SIZE * MAX_TOKEN_GRANULE_COUNT, GFP_KERNEL);
    53		if (!token.buf)
    54			return -ENOMEM;
    55	
    56		pr_warn("tmm_tsi: module loaded (version %lu.%lu).\n",
  > 57				TSI_ABI_VERSION_GET_MAJOR(ver),
    58				TSI_ABI_VERSION_GET_MINOR(ver));
    59	
    60		return 0;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
