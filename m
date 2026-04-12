Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590B1A9F85
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 05:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775972131; cv=none; b=t07TY5ouLR2W7iigqF/QyYxiFW9xTknHMkNmlbo2JcTgBd84m+Tm9OqAD6izaw0cv0h2pIuZ1X+rvGcBaoNkpRjOWb0tzZJAX83sA1XYtVw0ge1jtXkoAMq0mp77J50w6hWThutm5qb/n5m+UAic+ZWg6pIMRyORjbg1wUQvLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775972131; c=relaxed/simple;
	bh=1io/+u6sLpI9CAxbol7ju6Fnr3MdAaxSFG0jTYxkhgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a7qfJZE4xm4P5HriDB8UF0U9TnPR609+Mv+/ULEm1MVwxjlDrv7k9vDxmr6ZZUrugYXYXXvcF7vgmSoHDSxLv+8kWG3sWuL1WFkTQYZw3UfFjXtuGkXDuEJR+gfLJGS7KHXj3fHk1V98AekkuL9eGiSTvWhH6de4wwi8TAJ4mjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNC1owXx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNC1owXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775972129; x=1807508129;
  h=date:from:to:cc:subject:message-id;
  bh=1io/+u6sLpI9CAxbol7ju6Fnr3MdAaxSFG0jTYxkhgU=;
  b=YNC1owXx5gtNakvrXUvAqDgSqVELJ2TpstgqzK+dR9O3xBNkZ6FUic+H
   zzurwYDc9HlBESj7ABGtnetnU8cSpNA5JiIhEUH2Nd6Bvyea9Wg4jGIW0
   /s9s44OSaGTZ1ChdsOtbEuXvTWUrVxYA/QhOv9iJ4j4LdApc1Yf5TTPck
   Ae2If0rzin7yaRJ2icoPA+vYXqdE3kCKxRrdybIsTVT+9vufvWuCIaHTT
   seeWo2qtkmXPQkKuPDv/aOCCTv32KxaX/afh6Qqqs9IcaRkuWJ1JRKWZA
   t7qtVLOh/tSdB8rlz3qO4oR/KhiHsS39hksieWhfPKs+mWFUFEzqb3J+a
   w==;
X-CSE-ConnectionGUID: X6/W26iuREeYYG6AA/oxrg==
X-CSE-MsgGUID: bQydRsHyQ8eo0ilubJTtBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77119293"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="77119293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 22:35:29 -0700
X-CSE-ConnectionGUID: 43LZ24FYRla/bHcVpdy+cw==
X-CSE-MsgGUID: SILPKLFQR+OKo8SaS+plgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="233871319"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2026 22:35:28 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBnTh-000000001vF-2EbC;
	Sun, 12 Apr 2026 05:35:25 +0000
Date: Sun, 12 Apr 2026 13:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260408-1007 30/32]
 drivers/infiniband/hw/hfi2/affinity.c:124:30: error: invalid initializer
Message-ID: <202604121326.zitO2BGc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dennis,

First bad commit (maybe != root cause):

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260408-1007
head:   0f17c9b31e14b6d196855b053280814296362bd6
commit: 75332d9a3e693af3730e158858eb2de486e7247a [30/32] RDMA/hfi2: Make it build
config: x86_64-randconfig-r112-20260407 (https://download.01.org/0day-ci/archive/20260412/202604121326.zitO2BGc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121326.zitO2BGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121326.zitO2BGc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/hfi2/affinity.c: In function 'init_real_cpu_mask':
>> drivers/infiniband/hw/hfi2/affinity.c:124:30: error: invalid initializer
     124 |         cpumask_var_t cpus = &node_affinity.real_cpu_mask;
         |                              ^
   drivers/infiniband/hw/hfi2/affinity.c: In function 'node_affinity_allocate':
   drivers/infiniband/hw/hfi2/affinity.c:211:15: error: assignment to 'struct hfi2_affinity_node *' from incompatible pointer type 'struct hfi2_affinity_node **' [-Wincompatible-pointer-types]
     211 |         entry = kzalloc_obj(entry, GFP_KERNEL);
         |               ^


vim +124 drivers/infiniband/hw/hfi2/affinity.c

bedc154be9f44e Dennis Dalessandro 2026-02-25  120  
bedc154be9f44e Dennis Dalessandro 2026-02-25  121  /* Initialize non-HT cpu cores mask */
bedc154be9f44e Dennis Dalessandro 2026-02-25  122  void init_real_cpu_mask(void)
bedc154be9f44e Dennis Dalessandro 2026-02-25  123  {
bedc154be9f44e Dennis Dalessandro 2026-02-25 @124  	cpumask_var_t cpus = &node_affinity.real_cpu_mask;
bedc154be9f44e Dennis Dalessandro 2026-02-25  125  
bedc154be9f44e Dennis Dalessandro 2026-02-25  126  	cpumask_clear(cpus);
bedc154be9f44e Dennis Dalessandro 2026-02-25  127  	/* Start with cpu online mask as the real cpu mask */
bedc154be9f44e Dennis Dalessandro 2026-02-25  128  	cpumask_copy(cpus, cpu_online_mask);
bedc154be9f44e Dennis Dalessandro 2026-02-25  129  	clear_ht_siblings(cpus);
bedc154be9f44e Dennis Dalessandro 2026-02-25  130  }
bedc154be9f44e Dennis Dalessandro 2026-02-25  131  

:::::: The code at line 124 was first introduced by commit
:::::: bedc154be9f44e98cd45e91d621b09487a3057dc RDMA/hfi2: Add initialization and firmware support

:::::: TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
:::::: CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
