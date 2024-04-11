Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D714A9F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712863767; cv=none; b=pFGJl8cf5kvtcUF+RAd30S49v8Biyh7SSPBL8rnw/I6lQyBTLpXH59JJbtL8asilj8TP5zXiPY2l4gRjRuvcacsalk94sdHytBp22pXEkj0KOd7GLEPeKrcNbHYgW6tWypYZhJAHUuHGr1DOQCOltSf2KcfSqV4G2fUkSGZyuUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712863767; c=relaxed/simple;
	bh=hjJaBZuF6l73K3Hlbm/wyA1NBaZqojp0pznDH38rHgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhJR32H6FlYjQ6U+KumoCDxFAtThRkaPGqRxxTfz2mC/pIWnrk2OdHk6hXPa+bXCLvIkxxL85WObDx0XRatVzlCXqJ03vp2U6V1xYKvEP5Izj9c6Njs8Rtr9mpNn5gBMAXVCgd0BwV4Sp/rYGrXJfeOljHX8FG5urlMNiMsomz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccA72W9t; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccA72W9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712863766; x=1744399766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjJaBZuF6l73K3Hlbm/wyA1NBaZqojp0pznDH38rHgA=;
  b=ccA72W9tle3GGyW0aFU5IkKYzVOkPt8yeAE4JwK6G3j/xLj78oAUEEGM
   Zag2UqN8AAlZZbV63abChd9SO+69ESVHZqKylVKMQ7JogBeyoW/c1d3ei
   Kp+JLonDDrCZyqsR52akQ1N4AukWS2ECNBMA/n3JmtlhaXtSO9YRHVuzd
   LRcuxQHmuQcYMtXCh1W+elassSgzVF8fTSBKjHTpjK4WTOwEFj7S/PPWJ
   LR1GtbVmtelP0tA8ddO7nLVxzWVQKRSVqG2rZNYTFW6HjcK+Oo9Jc/3sh
   /Wck/wKc0uKVb2kv/mpuk0UeoszOt56hfzcB/LkjQ3AYVBOyvHxabjToy
   Q==;
X-CSE-ConnectionGUID: ANg/jTtCSOWvcwBmAnraaA==
X-CSE-MsgGUID: x42n+BFbTTWc5rc31GamZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19452250"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19452250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 12:29:26 -0700
X-CSE-ConnectionGUID: XLdN1l/IRyy8FI7DAtpRUg==
X-CSE-MsgGUID: 9llaWrpBSLmOmfST/u30BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25649002"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2024 12:29:24 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv06r-0008vh-31;
	Thu, 11 Apr 2024 19:29:21 +0000
Date: Fri, 12 Apr 2024 03:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2437/7374] mm/dynamic_pool.c:118:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202404120329.pEWUfaZU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: 8822f3476adadcf84c7cb3db0d1a0a39a6fdc398 [2437/7374] mm/dynamic_pool: introduce per-memcg memory pool
config: arm64-randconfig-r132-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120329.pEWUfaZU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240412/202404120329.pEWUfaZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120329.pEWUfaZU-lkp@intel.com/

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
