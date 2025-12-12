Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4B21B87C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578642; cv=none; b=akD4gJnkcdhEWqxnV59cC0TsjKF2FiLSJ5d/EixOc10htiO2xqAiRWnwszX35mD+vZmzUte2AJ412iqybLdxcR0SRiJm6nFKB/tgjAn1tdFIUbGixw6vHQHgu7aJhogD6R/kcN+VC0s9jRmwntVKZK4EPVpYydXsy69/id1oBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578642; c=relaxed/simple;
	bh=b6G5M4dmQxczJGjBd+NQzalp+LVjY/zjZ6FjcgJbfds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsF1tBzII8M3YntKFa61TxjbZq81AgLaYZ8vUKDa2CMKup6Z7IY13BTQdlCrG6nPj6qj3OBTHtgfkAkeDkYB92ytDi5j3jqrVCsTjW/pzEXp58hNotWv1hCFOWsATlv+pJcvPUjobSt1CF3gFLpj9skn8TpQVo+VjCRLkXftqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAQ64bTA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAQ64bTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765578638; x=1797114638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6G5M4dmQxczJGjBd+NQzalp+LVjY/zjZ6FjcgJbfds=;
  b=eAQ64bTAurmw90wrMgl3F5FsE+Mglai+B8XWMGdDm7aU9GioT+I07a6h
   jlz1VKF+igMrAS1dQeYwEDdyn8j8ieFeWjWnbhxgy/ky4FXE+tMHUKP8u
   yeZfuzyYwZziyviilHgeW/LNALK4yo5SWqx/dBV6RKwR64NSLLV0Nk+3Z
   gfPaOyfBxovO+jswJbdek5MztRTJ/qdBavkuF+M5qlEubJ2Sbc/IlX1TK
   o202HvdwJ9Mhja1GazbCRMNJdD+J+OXss65M+S7tisorKzBXIksnDUvD7
   fd936r/Yple+RmdRfu5C5QvBR3E+zjMGyi7jHXQi/uRl3rI/fC4/pgJDW
   w==;
X-CSE-ConnectionGUID: EFVWun/sRHuAD8mJVpD2Fg==
X-CSE-MsgGUID: kdxr5WD1R4i9QxKiWSzdbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71446015"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71446015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:30:36 -0800
X-CSE-ConnectionGUID: v7fL/k+tRp6BXGcmVIxb0Q==
X-CSE-MsgGUID: j7bELQfWSgGNCKWiTTIEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201613946"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 14:30:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBei-000000006hd-02BV;
	Fri, 12 Dec 2025 22:30:32 +0000
Date: Sat, 13 Dec 2025 06:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>,
	Ben Cheatham <benjamin.cheatham@amd.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: drivers/cxl/core/region.c:753:36: warning: format specifies type
 'unsigned long long' but the argument has type 'resource_size_t' (aka
 'unsigned int')
Message-ID: <202512130601.qHhuGV9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d6602e25819dea2c239972e98e09ba5db4aebd22 cxl/region: Add support to indicate region has extended linear cache
date:   6 weeks ago
config: i386-randconfig-r123-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130601.qHhuGV9q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130601.qHhuGV9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130601.qHhuGV9q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:753:36: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     753 |         return sysfs_emit(buf, "%#llx\n", p->cache_size);
         |                                 ~~~~~     ^~~~~~~~~~~~~
         |                                 %#x
   1 warning generated.


vim +753 drivers/cxl/core/region.c

   741	
   742	static ssize_t extended_linear_cache_size_show(struct device *dev,
   743						       struct device_attribute *attr,
   744						       char *buf)
   745	{
   746		struct cxl_region *cxlr = to_cxl_region(dev);
   747		struct cxl_region_params *p = &cxlr->params;
   748		ssize_t rc;
   749	
   750		ACQUIRE(rwsem_read_intr, rwsem)(&cxl_rwsem.region);
   751		if ((rc = ACQUIRE_ERR(rwsem_read_intr, &rwsem)))
   752			return rc;
 > 753		return sysfs_emit(buf, "%#llx\n", p->cache_size);
   754	}
   755	static DEVICE_ATTR_RO(extended_linear_cache_size);
   756	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
