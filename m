Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57C14287
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727624438; cv=none; b=XakeeiY0oyG2W8IjKYqYX0223g06qnWAFJdzKvCm1xZqGr+0y9JIxqq3koV4vfh/y/yTisNdbJZTvb+5pBVCU9Oik6jV2qIYbRasblES1wyUZEqf/Yctb1oEdMIEswEersFYbSsqImU4ko5oggF82h2ZBJ7Y0JuXRCs5XQvZrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727624438; c=relaxed/simple;
	bh=NXF2MiD/L0QX/+n6Mn8vHBxijR3HAqLPwAFRSRqS+i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOBq2zCDNmIqzxTsVb2naDzo1NGhEJr9v3epH2KExyZ0wDzv+oG7AML9L020nrXt+CzYX5ZPDlNFHdMuGr34wcKRmW27xebHJRtbIcdQSYMuRjn7yaSRbYmhf+1iAS28u4o1y76nyAy/hK5lx1i10qtoMwuh9TJGIujT5FYaRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaAldp4s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaAldp4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727624436; x=1759160436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXF2MiD/L0QX/+n6Mn8vHBxijR3HAqLPwAFRSRqS+i0=;
  b=SaAldp4sLb062bf+r1uYkFwd5JnzovHg9/MhIz9g9G30dmlIbhPQzASA
   Fx/7/eY2Pl2B2lYnXeq2Fe7jrcsOQfoihXqpi3UiBylQBr9gOaw9aIoL9
   i57Lppf7aGl/Q+r2IrYqB/4c8gUJF9HpJylzwlM5rq6TH7RCZ7r+FTuQQ
   /2muNi0rh6pUeKp8c0XpINxugSolgiXWI95/bdabijCUc5SSolFoVGol+
   zMEntimFx/5dZk7bLgvaARfvf7WuR1hF0pIDNM72caXciaJs0WdxEOTJ+
   vdLqmMwBHXCDFiPnQl73vWVcCenrJbgNvjSgCUhhWjENGDiTUVeplgxy9
   g==;
X-CSE-ConnectionGUID: UYyx8ZccSXG/CbD+IFUcUA==
X-CSE-MsgGUID: ufP+CLfmRq2dmQwxaAZAIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37387152"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37387152"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:40:35 -0700
X-CSE-ConnectionGUID: cRj37CEjQL2KRSSSGGEcMw==
X-CSE-MsgGUID: jVCJFJHfQRGI/Z9z599/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73451051"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2024 08:40:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suw2B-000OOn-1v;
	Sun, 29 Sep 2024 15:40:31 +0000
Date: Sun, 29 Sep 2024 23:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16446/23805]
 include/linux/kernel.h:871:9: error: first argument to
 '__builtin_choose_expr' not a constant
Message-ID: <202409292359.ZkCbEvo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   983693eea268270a0270335c61b8ed2188ca0017
commit: 3e8f9682bfad48236b3a76f113cbd5270102e745 [16446/23805] iommu/arm-smmu-v3: Increase maximum size of queues
config: arm64-randconfig-001-20240929 (https://download.01.org/0day-ci/archive/20240929/202409292359.ZkCbEvo9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292359.ZkCbEvo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292359.ZkCbEvo9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from drivers/iommu/arm-smmu-v3.c:23:
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_device_hw_probe':
   drivers/iommu/arm-smmu-v3.c:211:55: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function); did you mean 'CONFIG_CMDLINE'?
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


vim +/__builtin_choose_expr +871 include/linux/kernel.h

3c8ba0d61d04ce Kees Cook      2018-03-30  864  
e9092d0d979611 Linus Torvalds 2018-04-09  865  #define __cmp_once(x, y, unique_x, unique_y, op) ({	\
e9092d0d979611 Linus Torvalds 2018-04-09  866  		typeof(x) unique_x = (x);		\
e9092d0d979611 Linus Torvalds 2018-04-09  867  		typeof(y) unique_y = (y);		\
e9092d0d979611 Linus Torvalds 2018-04-09  868  		__cmp(unique_x, unique_y, op); })
3c8ba0d61d04ce Kees Cook      2018-03-30  869  
3c8ba0d61d04ce Kees Cook      2018-03-30  870  #define __careful_cmp(x, y, op) \
3c8ba0d61d04ce Kees Cook      2018-03-30 @871  	__builtin_choose_expr(__safe_cmp(x, y), \
e9092d0d979611 Linus Torvalds 2018-04-09  872  		__cmp(x, y, op), \
e9092d0d979611 Linus Torvalds 2018-04-09  873  		__cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
e8c97af0c1f23d Randy Dunlap   2017-10-13  874  

:::::: The code at line 871 was first introduced by commit
:::::: 3c8ba0d61d04ced9f8d9ff93977995a9e4e96e91 kernel.h: Retain constant expression output for max()/min()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
