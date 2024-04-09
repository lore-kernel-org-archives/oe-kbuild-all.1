Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F17605D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712645756; cv=none; b=DuIYDqkKVMckkHWjWpNq75eertsrdRDNH1L048Euh3w/C0LTUksnEyjCQoMDmN4z9QuTEithfvkrIghd09nJhLoUaB+5NK6YHJHABLG6DwXcm8FrjvzVK70S4h3DLUFk0qnM1Q3rhJxne1vdcKvKAofp8saTrJBmMTabm0b6k8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712645756; c=relaxed/simple;
	bh=MDXg0XrDpbNWmRs/gydGl+vhEmdZySLlsJHfKSiwplE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyay43lT12kA51IRgSja6IvuSXXH99t6ceMpmAW5aOcsB8pQLkRToO8Ho+zIhH6lmxLcTg+/q0TBIJJlrlOZP/d6mIkZk9Gf9ydKv24hy4qcqQBbHXIwpqmHSdnchF87DISxXimKyVKYAMdqmjQrzmRt3/4ohytSd1Zk8JvFV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9mKH8Fs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9mKH8Fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712645755; x=1744181755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDXg0XrDpbNWmRs/gydGl+vhEmdZySLlsJHfKSiwplE=;
  b=K9mKH8Fs2eq6DAEPSr8P/G/qNmMfh+S2HyUjTm40N/jryq3VTs3TNTPz
   K2KkimrjeNIihMP5PNXJm4Dki+V/w/c/SayRus5Mi3KzS97xHn5qMaQfi
   tvrpgpFavkM20u3GIX2DYnCDTbA5TKGRxCTWFrclWgY5xmv0BRAVAC6Or
   Vabt3+SePdocyAaifWGU+Lirfwxexw6xdhcLgyarZmODUrzBC07H4Rg/o
   T7ATQaZi2fx8E6Qf5cmT/xFyTqHK7sDpwEO3I/SSn4fN8yfRClejdlmNI
   nydXm22Ye0tOxsBvYsPF6rSXJOdFx8YZBC2OO0H/H4VBiqCfURyDVDDS7
   w==;
X-CSE-ConnectionGUID: lVzlDCxrQG6L5vCNyfVdvw==
X-CSE-MsgGUID: JLnBqnAOSd+98ldUA7mztA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19379775"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="19379775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 23:55:54 -0700
X-CSE-ConnectionGUID: jt+AI4kGTMa+XfulPsunRg==
X-CSE-MsgGUID: z+OuKjm2REOoE691mhiEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="51321550"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2024 23:55:52 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru5OY-0005qW-23;
	Tue, 09 Apr 2024 06:55:50 +0000
Date: Tue, 9 Apr 2024 14:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 9479/30000] mm/dynamic_hugetlb.c:198:55: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202404091402.qUFwznOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   03571c277d6443f7ba8712ac6c9073fa9fa0d3bf
commit: a8a836a36072aacbc4aaf08b8b3c8a654dbc0157 [9479/30000] mm/dynamic_hugetlb: establish the dynamic hugetlb feature framework
config: x86_64-randconfig-r132-20240409 (https://download.01.org/0day-ci/archive/20240409/202404091402.qUFwznOY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091402.qUFwznOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091402.qUFwznOY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/dynamic_hugetlb.c:198:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cgroup_subsys_state *css @@     got struct cgroup_subsys_state [noderef] __rcu * @@
   mm/dynamic_hugetlb.c:198:55: sparse:     expected struct cgroup_subsys_state *css
   mm/dynamic_hugetlb.c:198:55: sparse:     got struct cgroup_subsys_state [noderef] __rcu *

vim +198 mm/dynamic_hugetlb.c

   195	
   196	int hugetlb_pool_destroy(struct cgroup *cgrp)
   197	{
 > 198		struct cgroup_subsys_state *css = cgrp->subsys[memory_cgrp_id];
   199		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
   200		struct dhugetlb_pool *hpool = memcg ? memcg->hpool : NULL;
   201		int ret = 0;
   202	
   203		if (!dhugetlb_enabled)
   204			return 0;
   205	
   206		if (!hpool || hpool->attach_memcg != memcg)
   207			return 0;
   208	
   209		ret = free_hugepage_to_hugetlb(hpool);
   210		memcg->hpool = NULL;
   211	
   212		put_hpool(hpool);
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
