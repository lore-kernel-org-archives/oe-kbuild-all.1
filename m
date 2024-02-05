Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1752A20DCB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140976; cv=none; b=Lk29hu9pU28acAoxIefP+4YrmztOZdsTbN4qLaqS0Q6qVuxXVy+UFdG5G3LKWaGQ9xGDAhjMo1Zq4Edu1JLfyBehBrWKOKhIYNQMQMe3FAIHUqdhh31TNwLlW2n0K4ktjpe8XdQjB2ySfddzpBpil9HiV3GBsG0q0b2qCD0Ai7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140976; c=relaxed/simple;
	bh=jqtiepyDwH8RIFnkSyLmXdoaadNgikhEhPw0eMyhn+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAkUl9wgWmCOd/ygwtdIKvVJqDrX0Y2MfWxAd0jWmy2SzDvRnVLxHAXNu2KQtg2XL0amHGpzUDGUNwg8fO1t1nmJBED/EwYK6A1R99sGBtHxeQFMFENzWxjW2YL3u7/swFw/rkwUdN/y3tZfA46lBTnhK/lF06jp/Vgjs5FYI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT5t2yY9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT5t2yY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707140974; x=1738676974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqtiepyDwH8RIFnkSyLmXdoaadNgikhEhPw0eMyhn+U=;
  b=TT5t2yY92qw0VqdxYAkIdhmVeYIG+VGWrboVNhQoYZsX8Y9hW9+tn3gy
   qBAe9EvnaX6to9DoBoXIIu2thXiqApPGMRuQeqZ+q+fuY180rhwhX5Uao
   LyuxQVE4qyu6+yt3B3GUVZgYGs0WGUYXFq6Y0c/nc6ioS/m5Rn4DmSwbl
   521Cdc6p7MFx0ZyIkna9OzI7SHnRppOWfZwQIo2jAbOkU6b0y2k7Jg0Fp
   ZKjx41jCRjI0Knjtap7Td3O8rC2RK1wfODCNf318ABD4eEizcdkarKYDR
   I9qVLE2eIIat75GJNZ776eHkQAlN1Yphxarkq1Y18Uz32WKd5DXSZDkF+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="413063"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="413063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="728243"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2024 05:49:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWzLk-0000ZA-0M;
	Mon, 05 Feb 2024 13:49:28 +0000
Date: Mon, 5 Feb 2024 21:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16446/21616]
 drivers/iommu/arm-smmu-v3.c:211:55: error: 'CONFIG_CMA_ALIGNMENT'
 undeclared; did you mean 'CONFIG_CMDLINE'?
Message-ID: <202402052127.OnYWBMsR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 3e8f9682bfad48236b3a76f113cbd5270102e745 [16446/21616] iommu/arm-smmu-v3: Increase maximum size of queues
config: arm64-randconfig-r131-20240130 (https://download.01.org/0day-ci/archive/20240205/202402052127.OnYWBMsR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402052127.OnYWBMsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402052127.OnYWBMsR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm-smmu-v3.c:879:26: sparse: sparse: cast to restricted __le64
   drivers/iommu/arm-smmu-v3.c:879:24: sparse: sparse: incorrect type in assignment (different base types)
   drivers/iommu/arm-smmu-v3.c:879:24: sparse:     expected restricted __le64 [usertype]
   drivers/iommu/arm-smmu-v3.c:879:24: sparse:     got unsigned long long [usertype]
   drivers/iommu/arm-smmu-v3.c:887:20: sparse: sparse: incorrect type in argument 1 (different base types)
   drivers/iommu/arm-smmu-v3.c:887:20: sparse:     expected restricted __le64 [usertype] *[assigned] dst
   drivers/iommu/arm-smmu-v3.c:887:20: sparse:     got unsigned long long [usertype] *ent
   drivers/iommu/arm-smmu-v3.c:887:25: sparse: sparse: incorrect type in argument 2 (different base types)
   drivers/iommu/arm-smmu-v3.c:887:25: sparse:     expected unsigned long long [usertype] *[assigned] src
   drivers/iommu/arm-smmu-v3.c:887:25: sparse:     got restricted __le64 [usertype] *
   drivers/iommu/arm-smmu-v3.c:983:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/iommu/arm-smmu-v3.c:983:27: sparse: sparse: cast from restricted __le32
   drivers/iommu/arm-smmu-v3.c:1029:20: sparse: sparse: incorrect type in argument 1 (different base types)
   drivers/iommu/arm-smmu-v3.c:1029:20: sparse:     expected restricted __le64 [usertype] *[assigned] dst
   drivers/iommu/arm-smmu-v3.c:1029:20: sparse:     got unsigned long long *
   drivers/iommu/arm-smmu-v3.c:1029:25: sparse: sparse: incorrect type in argument 2 (different base types)
   drivers/iommu/arm-smmu-v3.c:1029:25: sparse:     expected unsigned long long [usertype] *[assigned] src
   drivers/iommu/arm-smmu-v3.c:1029:25: sparse:     got restricted __le64 [usertype] *
   drivers/iommu/arm-smmu-v3.c:1328:53: sparse: sparse: incorrect type in argument 3 (different base types)
   drivers/iommu/arm-smmu-v3.c:1328:53: sparse:     expected restricted __le64 [usertype] *dst
   drivers/iommu/arm-smmu-v3.c:1328:53: sparse:     got unsigned long long [usertype] *strtab
   drivers/iommu/arm-smmu-v3.c:1356:39: sparse: sparse: incorrect type in argument 1 (different base types)
   drivers/iommu/arm-smmu-v3.c:1356:39: sparse:     expected unsigned long long [usertype] *[assigned] strtab
   drivers/iommu/arm-smmu-v3.c:1356:39: sparse:     got restricted __le64 [usertype] *l2ptr
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3558:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3566:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: cast from unknown type
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: undefined identifier 'CONFIG_CMA_ALIGNMENT'
   drivers/iommu/arm-smmu-v3.c:3568:36: sparse: sparse: cast from unknown type
   In file included from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from drivers/iommu/arm-smmu-v3.c:23:
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_device_hw_probe':
>> drivers/iommu/arm-smmu-v3.c:211:55: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function); did you mean 'CONFIG_CMDLINE'?
     211 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:847:36: note: in definition of macro '__typecheck'
     847 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:871:31: note: in expansion of macro '__safe_cmp'
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
   drivers/iommu/arm-smmu-v3.c:278:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     278 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:47: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                               ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:211:55: note: each undeclared identifier is reported only once for each function it appears in
     211 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:847:36: note: in definition of macro '__typecheck'
     847 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:871:31: note: in expansion of macro '__safe_cmp'
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
   drivers/iommu/arm-smmu-v3.c:278:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     278 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:47: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                               ^~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3558:36: note: in expansion of macro 'min_t'
    3558 |         smmu->cmdq.q.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3566:36: note: in expansion of macro 'min_t'
    3566 |         smmu->evtq.q.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
         |                                    ^~~~~
>> include/linux/kernel.h:871:9: error: first argument to '__builtin_choose_expr' not a constant
     871 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:939:33: note: in expansion of macro '__careful_cmp'
     939 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:3568:36: note: in expansion of macro 'min_t'
    3568 |         smmu->priq.q.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
         |                                    ^~~~~


vim +211 drivers/iommu/arm-smmu-v3.c

   200	
   201	#define Q_IDX(q, p)			((p) & ((1 << (q)->max_n_shift) - 1))
   202	#define Q_WRP(q, p)			((p) & (1 << (q)->max_n_shift))
   203	#define Q_OVERFLOW_FLAG			(1 << 31)
   204	#define Q_OVF(q, p)			((p) & Q_OVERFLOW_FLAG)
   205	#define Q_ENT(q, p)			((q)->base +			\
   206						 Q_IDX(q, p) * (q)->ent_dwords)
   207	
   208	#define Q_BASE_RWA			(1UL << 62)
   209	#define Q_BASE_ADDR_MASK		GENMASK_ULL(51, 5)
   210	#define Q_BASE_LOG2SIZE			GENMASK(4, 0)
 > 211	#define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
