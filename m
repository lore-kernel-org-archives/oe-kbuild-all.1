Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05421322A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421517; cv=none; b=V13yNKrU+tbIhaSgNTih1DOre2x/8+4kxboBV2dsEw8HejWXpuPJeT6NS5eosXG/p+V3Qpig6ZEyr81LSLxi1zVwRCvmxYjqPczISC+GoBb9ycwlviar218TbpWtTExI675xaB1P/RRq75K1ykVf1PUg6lbAAkEkMTNv73TLYJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421517; c=relaxed/simple;
	bh=/wrNM0Tyv0DdTATpRzR3gY5FfF3iNGTzRSaq8giNPKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5YBOeDxSpzBAWcQM0YolO3V5IM4Obxm0yTgRcO/G8K0Bb/c5aw6EYVOUfVC0WVT8U52W5H9Y2YsljV/JyEBbI9VYqSQ13Um3+Htpy9Orhej95bhJHUNsN7JM7JvBjGxzh7IYmuB0dOZXvl3zxdinmKPV2vXzhkdoiyUHFFXcLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3/5BSaz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3/5BSaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748421516; x=1779957516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wrNM0Tyv0DdTATpRzR3gY5FfF3iNGTzRSaq8giNPKo=;
  b=C3/5BSazuSI/JIh2DCbQpXQDR/0nBL17Tw9fGpQvVmuae9s4+8SNX2G4
   WyADFJ6QOsSZboK6jP5mTdrGc+L21Gpd2wrI+NrTKMgcKZmI6qBs/kEuw
   ce5jEKSgzcgDnyfWvRooX7BehCIqTRAwTpV7Zt3qJtROATi03Y6CqPIHm
   rJ5Fk/j4v1mze0myAu//sOPgDF4+8lemx6eLOagTnnGhWz4VX18pBHSsU
   sbjDTZOOBD1I/PZJkz57xOB90LjBq2hL6R1jC5W7rYUPdzClbGn7EYGce
   6sUrKVqN0x3CRFlCVsqDito904fJvkkf0uzqo5sKUjrPm2111DgWWfFoy
   A==;
X-CSE-ConnectionGUID: DcKWicczTliSq3R+QB9/sg==
X-CSE-MsgGUID: Qion7rF1Szq2DaCN90QlPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50322882"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50322882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 01:38:36 -0700
X-CSE-ConnectionGUID: LIs9IhkuTSex801aEemHqA==
X-CSE-MsgGUID: F7k86TkzTfCC+/qBCcHYXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143004614"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2025 01:38:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKCIy-000VSC-11;
	Wed, 28 May 2025 08:38:32 +0000
Date: Wed, 28 May 2025 16:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2318/2318]
 drivers/irqchip/irq-gic-v3-its.c:392:15: warning: no previous prototype for
 'gic_data_rdist_get_vlpi_base'
Message-ID: <202505281611.rYwqwDFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9a55d4a78730623072ee5a82518e7c094296b8b6
commit: 8207b85ea72073cc2f75884bfad29b41d805ef24 [2318/2318] kvm: hisi: print error for IPIV
config: arm64-randconfig-001-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281611.rYwqwDFF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281611.rYwqwDFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281611.rYwqwDFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its.c:392:15: warning: no previous prototype for 'gic_data_rdist_get_vlpi_base' [-Wmissing-prototypes]
     392 | void __iomem *gic_data_rdist_get_vlpi_base(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/gic_data_rdist_get_vlpi_base +392 drivers/irqchip/irq-gic-v3-its.c

   390	
   391	#ifdef CONFIG_ARM64_HISI_IPIV
 > 392	void __iomem *gic_data_rdist_get_vlpi_base(void)
   393	{
   394		return gic_data_rdist_vlpi_base();
   395	}
   396	EXPORT_SYMBOL(gic_data_rdist_get_vlpi_base);
   397	#endif
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
