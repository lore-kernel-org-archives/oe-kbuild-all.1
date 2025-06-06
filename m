Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689021DE3C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226810; cv=none; b=cuL6YtsvUoJDqCQGeMh6xDW8p3uJQenLs+lEjFAUeNJU7hT7SKyVWXFr1roONeMdm8sjNxFtXiX8Eqzz0lobTsrWMOg0btnGmo0oi/IUJ2xT+z+6P5S9mbQR5gtyh/GwbzC6sgu1n7AygJUenJ46+4KIEjITs90xCEqTpMwjJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226810; c=relaxed/simple;
	bh=nJb/hkSlsUvkwv+XGmEa48MDQAJj17JHWRYvnbFRlSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnps5XtVoUvrlB/C8LpM33M8w1FZzpDQr++6+/A1IP6F4nblBTdkF6OkrFg7njBYzLq5iqJaUYYQ6QRk63yJf30IZgLJhDdSzVCGEcwMyKjypejBAh1SmTHKlQOL9N80iKqEINseuu9i+5k8Zd2EWmYFuS6sMas13aXTAjj8P30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMARXr9o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMARXr9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749226808; x=1780762808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJb/hkSlsUvkwv+XGmEa48MDQAJj17JHWRYvnbFRlSA=;
  b=QMARXr9oG+K+tW6IqUOs8+HUXmqCZwsCV+J12Y0yKlvYNH4AqNkuMnEZ
   DktHNBLNmdDjkQfMPFsdAy4wAe9CPuFfSFT1kjDBg3MQJRY1gLbDy63Tx
   xvctYdxfdTywbux8Wtx3/XRyg7e5w9BnJwCmlmfR93PzfWX+nBiTklBAH
   +WQezEpHJxuavBXrqjEsF9O8Wdp38m3tSDoMMB4Y3EMZ9ldEQDvmmsHYl
   SD4DA94YBMrM/IsAumvIwUF0WP42MppuZQk/YHyprvwqkMoOGcLvZSkRW
   2KRXhGr2elgwxyesNnoCxaVUtoh0kEuLSOSD7QzdGbjucXKvTioSWq7UM
   Q==;
X-CSE-ConnectionGUID: 00+ihqMLSNu4ft08nllUMA==
X-CSE-MsgGUID: GJ4GCCEiQkadxfbpKvhneQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68937772"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="68937772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 09:20:07 -0700
X-CSE-ConnectionGUID: nlHL2VHfQR+zIa4BbAnmPg==
X-CSE-MsgGUID: Ohh8K4VnQgqGua8F7za82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="151125474"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2025 09:20:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNZnW-00057R-21;
	Fri, 06 Jun 2025 16:20:02 +0000
Date: Sat, 7 Jun 2025 00:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: [akpm-mm:mm-new 61/87] drivers/cxl/core/region.c:2437:22: error:
 invalid use of undefined type 'struct node_notify'
Message-ID: <202506070030.otNokpsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oscar,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   b9f05ab60cb240a64e898221de50a037553840c7
commit: 7bd79eaa2076cde601d828532a09ea50e20a976f [61/87] drivers,cxl: use node-notifier instead of memory-notifier
config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070030.otNokpsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070030.otNokpsc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/region.c: In function 'cxl_region_perf_attrs_callback':
>> drivers/cxl/core/region.c:2437:22: error: invalid use of undefined type 'struct node_notify'
    2437 |         int nid = mnb->nid;
         |                      ^~
   drivers/cxl/core/region.c:2440:46: error: 'NODE_ADDED_FIRST_MEMORY' undeclared (first use in this function)
    2440 |         if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/region.c:2440:46: note: each undeclared identifier is reported only once for each function it appears in
   drivers/cxl/core/region.c: In function 'shutdown_notifiers':
   drivers/cxl/core/region.c:3487:9: error: implicit declaration of function 'unregister_node_notifier'; did you mean 'unregister_module_notifier'? [-Wimplicit-function-declaration]
    3487 |         unregister_node_notifier(&cxlr->node_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         unregister_module_notifier
   drivers/cxl/core/region.c: In function 'cxl_region_probe':
   drivers/cxl/core/region.c:3528:9: error: implicit declaration of function 'register_node_notifier'; did you mean 'register_module_notifier'? [-Wimplicit-function-declaration]
    3528 |         register_node_notifier(&cxlr->node_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         register_module_notifier


vim +2437 drivers/cxl/core/region.c

  2430	
  2431	static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
  2432						  unsigned long action, void *arg)
  2433	{
  2434		struct cxl_region *cxlr = container_of(nb, struct cxl_region,
  2435						       node_notifier);
  2436		struct node_notify *mnb = arg;
> 2437		int nid = mnb->nid;
  2438		int region_nid;
  2439	
  2440		if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)
  2441			return NOTIFY_DONE;
  2442	
  2443		/*
  2444		 * No need to hold cxl_region_rwsem; region parameters are stable
  2445		 * within the cxl_region driver.
  2446		 */
  2447		region_nid = phys_to_target_node(cxlr->params.res->start);
  2448		if (nid != region_nid)
  2449			return NOTIFY_DONE;
  2450	
  2451		if (!cxl_region_update_coordinates(cxlr, nid))
  2452			return NOTIFY_DONE;
  2453	
  2454		return NOTIFY_OK;
  2455	}
  2456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
