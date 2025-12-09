Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60F254AE1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261999; cv=none; b=Zi220Q2PnIRSl1MHzwCRpktQDZKZ9kzHTPfACzUEs2ndvni/5Bg+QcL/GxvhVAK0OWXfxrx4THTSwYVDbh/f4CfdX8MARqQIJ0qO5aK9BFVv8wi3yIHYyHDxUgPHDiwVkN72+qYoxyGGSZ2t1MJoOIs6Og/hDrgir4jPNJtUYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261999; c=relaxed/simple;
	bh=AvDHbfHoqz4WfDvPgelXed+zZ1ih24khMtcVsEd/nyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FxwQ+CgxYeSU6VvruNnaaw6+y2SYuqb8quKSEPDOx5qq7Bn2a3BJSZRhOCQICeRbRn5IWhTkOkc3/UcqulNCKqQ+esdj/v+8bE1tbQ7f0+3HYn8h7qd5oYPhe6jqm16iKeNrEzLvbD77Wy+XMlxLOn27JiyEaRXRROMRs+DBa3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnSsaO89; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnSsaO89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765261997; x=1796797997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvDHbfHoqz4WfDvPgelXed+zZ1ih24khMtcVsEd/nyA=;
  b=dnSsaO89AUbCRJPSTcBRUNg70VTg9dQvWenL82VfKv3RFcVfjihdP0jm
   fgGE9xNp1kjcYv6gc4fBKCrdnLw679fKkfYxFVpapPyVqNS11O8dLKLfw
   RmvyHJE0Yw6QFtXWQXOmbUkhkYBpxfhlIZsF12xN/bvU+zbG9Xv5mM17g
   kNvMT0BR8SZrh8I4YjniToESmPdWLCE0NGQQ4y9PhUahTa7tMEjZ/K3Eh
   kHTJt1Xwm+sC8vjcub+CjeO3Q87izSK7ju7OYtCeVXwpbmV/3h6o9dW33
   jSejLBCIM9wb/SQ1sg8xNM7WKxPWkho+Cr5xGmdivA+oJ9tbwWfrti/uE
   g==;
X-CSE-ConnectionGUID: tdlvrKtaQ4S8i77/dN28oA==
X-CSE-MsgGUID: uIFMjYu8RE2pVnzOnyrY2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71058759"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="71058759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 22:33:17 -0800
X-CSE-ConnectionGUID: Ifvf7JiVTHGBYr7wxWWRWA==
X-CSE-MsgGUID: LwcXrh2mSJGhzgM5iRHIpg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2025 22:33:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSrHd-000000001PR-2aVn;
	Tue, 09 Dec 2025 06:33:13 +0000
Date: Tue, 9 Dec 2025 14:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/dynamic_pool.c:118:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202512091456.3c7HGfWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0189df7df2ef7f7dbbabf7ff8398e45adf306e24
commit: 8822f3476adadcf84c7cb3db0d1a0a39a6fdc398 [3493/3493] mm/dynamic_pool: introduce per-memcg memory pool
config: x86_64-randconfig-r122-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091456.3c7HGfWF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091456.3c7HGfWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091456.3c7HGfWF-lkp@intel.com/

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
