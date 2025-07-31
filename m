Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7254F2528FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754002907; cv=none; b=IusGq7H6BWOWLxu1HXpvzHyYMBIAf984JuRpRm4MUtK9OX0BdIY4+uZ2BWeMPBpacUbjofdBzsBXG/OoCINTHwb1YiZYVVz2xT1HK4x35Y8T0H5+VTxcNPPD4YybNnxDaKEo6Uw1hKDPvzvpMfGZLl3pfj8aadqXaJyITmqsPbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754002907; c=relaxed/simple;
	bh=o5XHywhmsMvcQKn6e2AXxgQMp7qlRKeOofohRt9AhZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLNvgSsuA/zGvQcnIGcSVtQ7J5HAErXn0ISCkLmEIMJOhYvElSCRSkHhCu6+fl4HX1dG7v1GFvnv+DxebQcXVSdE5J8T82ZYJo1iY/Jo1fzEIcSXzyfO4cMNKlmOxT6HpCYGzk/z+yC+UFjIhPOX/alqZ6MiGFb9vCUYfExIgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRdbm+wK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRdbm+wK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754002906; x=1785538906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5XHywhmsMvcQKn6e2AXxgQMp7qlRKeOofohRt9AhZY=;
  b=RRdbm+wKi5f46X+0sy0qlK839gsoMj+MYhMAtu32RsbYCdv7JLPiVPru
   ojwde6r3RGFniasHUE+noXMTPkkS1pMef6N9GK0a5KlySmc6VGU+gJ0ON
   MVBp4B4Ujl2wALmfpD6c/8U6u7Xv08ENKWZUFqhhoAs6oDovdP9KHxytc
   N1Lnj4lt97jDHMAZksMov3K1/SsjTpKb0aUsIW0ug567u9v61v77kh6ZP
   CxpxiiUh1r6KmA16SuKHNDVAIYadqrVr5pMXA3GMrEIfRAyzjLEWgFPa/
   rCRTJ8pzn2zQKI9ODwC2qvPqlkMeHcbY+xO8E/OxCYPpS+79VV8KbFJgA
   Q==;
X-CSE-ConnectionGUID: Yc0extIORmmjIZNxsCNOAw==
X-CSE-MsgGUID: JuiBuf36TVOcVS2BON3+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67037751"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67037751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:01:43 -0700
X-CSE-ConnectionGUID: fe958ti6RDihAjxCOpqqMQ==
X-CSE-MsgGUID: GsFwSJGHT7eQ5rQ1Eum1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163100603"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 16:01:42 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcHL-0004BB-2o;
	Thu, 31 Jul 2025 23:01:39 +0000
Date: Fri, 1 Aug 2025 07:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2613/2613] mm/dynamic_pool.c:118:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202508010611.7SCGF7vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e11e2b193b780ecfb0c4f0d0a73a0a28879c20
commit: 8822f3476adadcf84c7cb3db0d1a0a39a6fdc398 [2613/2613] mm/dynamic_pool: introduce per-memcg memory pool
config: x86_64-randconfig-r113-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010611.7SCGF7vt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010611.7SCGF7vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010611.7SCGF7vt-lkp@intel.com/

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
