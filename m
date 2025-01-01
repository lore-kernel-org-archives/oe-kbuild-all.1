Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AAAC2E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735707249; cv=none; b=PPd8j4hhoRZlqVpTR4tMFXxrX0ucFaQEDNbruh8cDZlcRD7Ws3M244vDlYrLduAuEKCNfNMJM4H5MKI3wK3BFCUT5TQVpuchTTIEuiIUeb+uP8UpFILm4/Dw4Z06VXsckAYPiPE5f+yHbt6qPMPAYRefFpGyzkoUQCbtIFzoISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735707249; c=relaxed/simple;
	bh=zIqkm+YC7dGeaWAWZbgUWaE53M8w7GoCz9o6vnuwHOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZkyDbACp1pnfykDtLnkrOoIwmWWTWY4YRnLHkvSyd2GVKn8IllJW6AyRtATWimu1MfuVT6XSMzT4rj90cc+QhYZTlSS37C9wVA8EGoHWHfAWykoXFZr9a1pPpX1HloNcK3fWXHkViNQ78zcWEBS3464UmhMyGJfTn/PB5kKuFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn4nmLOy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn4nmLOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735707247; x=1767243247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIqkm+YC7dGeaWAWZbgUWaE53M8w7GoCz9o6vnuwHOU=;
  b=Dn4nmLOyoyaJ37XPHG7ApknI6CTjMTMVnM3WDpsJSvQIleekaKfXaVhT
   O1SBcWokwWohXtSGjZLZ1DvBtXxycwzUTF50oQ54OchIrXiKCwcnwzJzI
   K3i6hdlG9idZv2nFvcDRa2SguGPrGH9wAuHfl/3qpmOB0DySnPbYIsRIB
   18ioy8HEp9NEdjrKOvRrqA7/aY5K2HD8CckU6Uq71kjdeY1tfAFiZt5Hy
   5Sg6Ph/FS5jaBK2QofOazR3l6FqTUMpXKVrJA5r75S7Bh9c4uTsRLYLGH
   lRFDYmXxTtqunbdJJrOTyf/3f3oTP/Gusx0Xs193k4Jm+eD+BrTgHtH08
   Q==;
X-CSE-ConnectionGUID: 6KsN4uNhRUuyNBUX3lHLZQ==
X-CSE-MsgGUID: qYK18aWwS+GdRGXqq6gRmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46556463"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46556463"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 20:54:05 -0800
X-CSE-ConnectionGUID: H1MO+xPKT2iUZwsqjH64/Q==
X-CSE-MsgGUID: sJlHSkDnS6uKsHj64g8SUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101015757"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2024 20:54:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSqk5-0007dH-1G;
	Wed, 01 Jan 2025 04:54:01 +0000
Date: Wed, 1 Jan 2025 12:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] mm/dynamic_pool.c:118:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202501011211.fyQq3kNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1e531b8351b843cd4a160764c0f67e4c9805234d
commit: 8822f3476adadcf84c7cb3db0d1a0a39a6fdc398 [1682/1682] mm/dynamic_pool: introduce per-memcg memory pool
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011211.fyQq3kNY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011211.fyQq3kNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011211.fyQq3kNY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/dynamic_pool.c:118:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cgroup_subsys_state *css @@     got struct cgroup_subsys_state [noderef] __rcu * @@
   mm/dynamic_pool.c:118:55: sparse:     expected struct cgroup_subsys_state *css
   mm/dynamic_pool.c:118:55: sparse:     got struct cgroup_subsys_state [noderef] __rcu *

vim +118 mm/dynamic_pool.c

   115	
   116	int dynamic_pool_destroy(struct cgroup *cgrp, bool *clear_css_online)
   117	{
 > 118		struct cgroup_subsys_state *css = cgrp->subsys[memory_cgrp_id];
   119		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
   120		struct dynamic_pool *dpool;
   121		int ret = 0;
   122	
   123		if (!dpool_enabled || !memcg)
   124			return 0;
   125	
   126		mutex_lock(&dpool_mutex);
   127		dpool = dpool_get_from_memcg(memcg);
   128		if (!dpool)
   129			goto unlock;
   130	
   131		if (dpool->memcg != memcg) {
   132			memcg->dpool = NULL;
   133			goto put;
   134		}
   135	
   136		/* A offline dpool is not allowed for allocation */
   137		dpool->online = false;
   138	
   139		memcg->dpool = NULL;
   140	
   141		/* Release the initial reference count */
   142		dpool_put(dpool);
   143	
   144		/*
   145		 * Since dpool is destroyed and the memcg will be freed then,
   146		 * clear CSS_ONLINE immediately to prevent race with create.
   147		 */
   148		if (cgrp->self.flags & CSS_ONLINE) {
   149			cgrp->self.flags &= ~CSS_ONLINE;
   150			*clear_css_online = true;
   151		}
   152	
   153	put:
   154		dpool_put(dpool);
   155	unlock:
   156		mutex_unlock(&dpool_mutex);
   157	
   158		return ret;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
