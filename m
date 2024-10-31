Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01C1A2562
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405760; cv=none; b=WD6HG9FT9bFeHchNN6/9q7vge7uCXk3otVsgVSHL3j4sAWu5Yr/bl0cZSTVe+SkubEa7R3skVwLrLmC9N9c3ClEQ5WREk/OZr3YlUDypw6lpGu7Q1YT35cZ/sQQ0yhvGRKl64Uf4AmuaznXWxPxaf1cE99FwYF6PmFbU3cjm+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405760; c=relaxed/simple;
	bh=g9ZsQKjX1A2pgBeqtAR4O83SRayqFpXULyo7ZOIj3l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6c/AfzpDod/geuRJGtWJ0MZU/Dq0Lhwa+ICT04tLpviKDs6RJZepz+fy8jQhZB+0hM9/9VRZWgM43n0zef/CTj7YNkyjQTzL7J3CFdRiy47MBcWr8pDbHELTuzbwlVBnkEDI9KY/WbdVe2pCrrgJpODdd8LPuEBnyyF9nZJ5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgwIWvBC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgwIWvBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730405755; x=1761941755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g9ZsQKjX1A2pgBeqtAR4O83SRayqFpXULyo7ZOIj3l0=;
  b=IgwIWvBCX2EVM8OXs4NxzMGsYZZEIWMi7izjUJMW52C/68lBqKk0Qsn2
   5RTv4Wb6/XvajzgYo59YJFYXRkGkgtPgnkG8B+W/6/ek7TzU1z+Axh/8t
   Ozy8SBNk52dAuH8OssFaZDvH6MdnB5sSk74CfshYUvGhXuPmQfi1R5f/A
   3ad6gLznK60URp02QQdBObGFyHiztTXG+zR0p9LZO/oKQxs5MQrhAlWEg
   QDjb8hgSp2gZvlR/AS41UoMm+vNO5cl9Iy9MdFXharjdqw5Ikbpl+oo7a
   dU7riTOvR1q5gMHrEgkAC3WmP1X8yI1AWQWDcBQGsSzRZ7rqHh7N+rbkN
   A==;
X-CSE-ConnectionGUID: mP3/dIXxTMKzrnmEjh2FRg==
X-CSE-MsgGUID: VG/7buPaSAOdLF3Z1+aa3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52734403"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52734403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:15:46 -0700
X-CSE-ConnectionGUID: YKvxQo4US1K0M1B+6wFHeg==
X-CSE-MsgGUID: Vo5zqk2TRK2XQpdZLhejBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87512263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2024 13:15:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ba2-000gg4-1I;
	Thu, 31 Oct 2024 20:15:42 +0000
Date: Fri, 1 Nov 2024 04:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 5/5] drivers/cxl/core/mbox.c:1488:22:
 error: implicit declaration of function 'mce_usable_address'
Message-ID: <202411010437.DsgNAP7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   c4724382d8850a1fd8ea8b7777e1ef783c31f480
commit: c4724382d8850a1fd8ea8b7777e1ef783c31f480 [5/5] cxl: Add mce notifier to emit aliased address for extended linear cache
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411010437.DsgNAP7m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010437.DsgNAP7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010437.DsgNAP7m-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/mbox.c: In function 'cxl_handle_mce':
>> drivers/cxl/core/mbox.c:1488:22: error: implicit declaration of function 'mce_usable_address' [-Werror=implicit-function-declaration]
    1488 |         if (!mce || !mce_usable_address(mce))
         |                      ^~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1491:18: error: invalid use of undefined type 'struct mce'
    1491 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                  ^~
>> drivers/cxl/core/mbox.c:1491:27: error: 'MCI_ADDR_PHYSADDR' undeclared (first use in this function)
    1491 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^~~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:1491:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/cxl/core/mbox.c: In function 'cxl_memdev_state_create':
>> drivers/cxl/core/mbox.c:1534:38: error: 'MCE_PRIO_CXL' undeclared (first use in this function)
    1534 |         mds->mce_notifier.priority = MCE_PRIO_CXL;
         |                                      ^~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1535:9: error: implicit declaration of function 'mce_register_decode_chain' [-Werror=implicit-function-declaration]
    1535 |         mce_register_decode_chain(&mds->mce_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mce_usable_address +1488 drivers/cxl/core/mbox.c

  1476	
  1477	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
  1478				  void *data)
  1479	{
  1480		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
  1481							    mce_notifier);
  1482		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
  1483		struct cxl_port *endpoint = cxlmd->endpoint;
  1484		struct mce *mce = (struct mce *)data;
  1485		u64 spa, spa_alias;
  1486		unsigned long pfn;
  1487	
> 1488		if (!mce || !mce_usable_address(mce))
  1489			return NOTIFY_DONE;
  1490	
> 1491		spa = mce->addr & MCI_ADDR_PHYSADDR;
  1492	
  1493		pfn = spa >> PAGE_SHIFT;
  1494		if (!pfn_valid(pfn))
  1495			return NOTIFY_DONE;
  1496	
  1497		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
  1498		if (!spa_alias)
  1499			return NOTIFY_DONE;
  1500	
  1501		pfn = spa_alias >> PAGE_SHIFT;
  1502	
  1503		/*
  1504		 * Take down the aliased memory page. The original memory page flagged
  1505		 * by the MCE will be taken cared of by the standard MCE handler.
  1506		 */
  1507		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
  1508			  spa_alias);
  1509		if (!memory_failure(pfn, 0))
  1510			set_mce_nospec(pfn);
  1511	
  1512		return NOTIFY_OK;
  1513	}
  1514	
  1515	struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
  1516	{
  1517		struct cxl_memdev_state *mds;
  1518	
  1519		mds = devm_kzalloc(dev, sizeof(*mds), GFP_KERNEL);
  1520		if (!mds) {
  1521			dev_err(dev, "No memory available\n");
  1522			return ERR_PTR(-ENOMEM);
  1523		}
  1524	
  1525		mutex_init(&mds->event.log_lock);
  1526		mds->cxlds.dev = dev;
  1527		mds->cxlds.reg_map.host = dev;
  1528		mds->cxlds.reg_map.resource = CXL_RESOURCE_NONE;
  1529		mds->cxlds.type = CXL_DEVTYPE_CLASSMEM;
  1530		mds->ram_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1531		mds->pmem_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1532	
  1533		mds->mce_notifier.notifier_call = cxl_handle_mce;
> 1534		mds->mce_notifier.priority = MCE_PRIO_CXL;
> 1535		mce_register_decode_chain(&mds->mce_notifier);
  1536	
  1537		return mds;
  1538	}
  1539	EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
  1540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
