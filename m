Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20621ACE6C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089977; cv=none; b=vB5MCllvbZnG594NcvEV04I8tktQ5k+mPYPwbpXmBgoHYkJE34WK65ECMd7y861rhXzY7FBmk5A5W1VmsGHeM8BAAh7OMzPRjjMNQCJ4raupVnXa56SD8Dvc89vtCjfj9+eBiMrFgYUyfXq9hkDPtmTubZV5dejrNagcT8bWy8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089977; c=relaxed/simple;
	bh=yb01w624J4Byf944X8qPSfEF9ar1b2dPb6MGA74ABHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMOXAdVJf/f7GbGA4JtjkY5WQitCkDAZ3H37hbuOVVF7JugQKAIpTgR44Nc1LiODVwYI4bD9irArMf1T6me6rcvkiO7vP3T9xSgBMDsqjnAOOIySxTbqum6jqM1zBYTSwJ1AJ7oQYNz54FpMV4LEE5YmEqC5wUvfJTJ+BeN8q8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3p0eCnG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3p0eCnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089976; x=1751625976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yb01w624J4Byf944X8qPSfEF9ar1b2dPb6MGA74ABHQ=;
  b=C3p0eCnGJEzlfGmbDmsoOHFVqiTSUpC2n/WBFHiTgbkQEuQ7O3g//zMU
   jWn3kyCKXRoXlSQ31hZIysoZjSF+Db1P5Tm06dp1pUP5NfHZMr6fe4JCx
   /t2Jlg9+TdVVV2qCxxHqGXCyL1Gbt8mWuK1jaQI/kUsTOiwwy/aoEGn5O
   s1wbPO4cV1kFwn070cINNhb6UB32/UASqdulR8xu/CXohKV03QfgQU0Ti
   ph8i10Y1JkjuImMWk32t+OKu2xnOCBaerFiOnmRy8ue+HAWx2v5yGr3J0
   Y60Cl8o3DHpncL7cd2N2EM95JMFaifSaAHuPt7eon+tCVPEqHJg/Mc5bC
   Q==;
X-CSE-ConnectionGUID: Tovj7v2OQuiPRphWerBvTA==
X-CSE-MsgGUID: IUyQcYsaQxSYHAcjSzP4Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17085852"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17085852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:46:15 -0700
X-CSE-ConnectionGUID: 4B4nrXvSTiOlMTXiVXpasg==
X-CSE-MsgGUID: ePQFzQYLRcS7GI6NcgKX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51740360"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 03:46:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJyd-000QtK-2P;
	Thu, 04 Jul 2024 10:46:11 +0000
Date: Thu, 4 Jul 2024 18:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/53]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:37: warning: "VA_BITS" redefined
Message-ID: <202407041854.qownApOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 23dbb9b1e1ec4cc15b44eeb954b5045ed86daf78 [37/53] add COMPILE_TEST
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240704/202407041854.qownApOL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041854.qownApOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041854.qownApOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:32:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:41: error: field 'mmu_notifier' has incomplete type
     755 |         struct mmu_notifier             mmu_notifier;
         |                                         ^~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:37: warning: "VA_BITS" redefined
      37 | #define VA_BITS 39
         | 
   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:12:
   arch/loongarch/include/asm/pgtable.h:45: note: this is the location of the previous definition
      45 | #define VA_BITS         (PGDIR_SHIFT + (PAGE_SHIFT - 3))
         | 


vim +/VA_BITS +37 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

    31	
  > 32	#include "arm-smmu-v3.h"
    33	#include "../../dma-iommu.h"
    34	
    35	#ifndef __aarch64__
    36	#define wfe()
  > 37	#define VA_BITS 39
    38	#define cpus_have_cap(x) false
    39	#endif
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
