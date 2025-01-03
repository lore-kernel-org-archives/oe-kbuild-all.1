Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164D1C54A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735891953; cv=none; b=Z2Mlzh7+ZR1QCz3BORTrM1nWJFOPIDPdjZAbHlpCBOiGdhnK+bLmid/y5NVoM+Vaa9UMO+xybGJ25i9yEIovX6O8RbLhBlFRtXYMSRS4GJBpKmLLERAlITDczfQzDEmT7uXPqOBW3SrrDuq08OnxnJXlBULTk70W/8rFVW374Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735891953; c=relaxed/simple;
	bh=HPzLISR1NUeRXNPBpDknm66R8Y4Kk3Zy4I2QOwbANVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqJtjykYE3lZbtG7ySDlouK/PZHFUmmI9Iv/MHDqd98FkrjdFVi2Y2atYt+WtdCJjHYmjnk5cooYMqmhnbF991Pj+Xs7KnivIJX2DFTvUIFe+WA4GXAI1SlNWNK2GOlWrxCHnfEWwyLygcWHvHe0fEw/6HXwnvz1+CmpGTznBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOK+XDF2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOK+XDF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735891951; x=1767427951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPzLISR1NUeRXNPBpDknm66R8Y4Kk3Zy4I2QOwbANVE=;
  b=YOK+XDF2d9VGEvUxImZ7PZPQzfCiI0W/zx5FEU+1gaUq+CJ6Tl+YA9Ho
   bW/FCiDQC8/atA+U9W8geO1419MpMinizv3iVVKTyH1ys5/x/ggnTwViO
   PTL/8J3eDKTfVmFPL33vgKWOMM/GQhO30V1tJMsIdsfd3ztwTeKKsfFvK
   mQ5eg6dhVzZQAbB32HJxyvqNkWgNX9vBklAU8klHt0QR+99LV51Oq1Fje
   1YyOCj+eNic7aj/Mq11pEJ+/CO6su3D6oeXP07T7bhEfAFtCyzYkaRWKC
   w2wrocIYb2ymkIcn6xo82eEVekluLPDykE63+oaACCcA1M+LXlM/RroOS
   g==;
X-CSE-ConnectionGUID: Wv4QxlbLR7SCUgew02OSIA==
X-CSE-MsgGUID: wlkmPPvvQZmmxwRaQ+l9vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35384472"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35384472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 00:12:31 -0800
X-CSE-ConnectionGUID: 0eeSDsaBSJ+7N3dazrvfNw==
X-CSE-MsgGUID: 7cVa9JD9RCuGJ8K9D6O5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102217918"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2025 00:12:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTcnD-0009RP-2Q;
	Fri, 03 Jan 2025 08:12:27 +0000
Date: Fri, 3 Jan 2025 16:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] mm/dynamic_pool.c:118:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202501031628.68zVpLqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   92381e91108f99289464dbb6fbe45ffc4d6d037b
commit: 8822f3476adadcf84c7cb3db0d1a0a39a6fdc398 [1682/1682] mm/dynamic_pool: introduce per-memcg memory pool
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250103/202501031628.68zVpLqr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031628.68zVpLqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031628.68zVpLqr-lkp@intel.com/

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
