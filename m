Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCF2367B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765427797; cv=none; b=VX5M9cCOU28ke2dfbDWSAVsRKJHFz8HCA44u+0IhZYh5/qYlv5quXE9Ny28uBbvra9HmIxSigjoPgCkRDZmN+FbUBa+DZVFzIIppO6HTxswWXhWsO/Bfgfu7KaFEdcS//hK8VYGnixuxDoZHxU54TIUESA14gdgerZWMFEowXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765427797; c=relaxed/simple;
	bh=+dylaD9h/2tvfLoiqnIRM3WGRH6tM3JLFnjZ9Yifwzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t/KclI5mRxVTIKpXcPlUa4+2UMMssFw7NG0Dp308RF1TRVt9jDMYzmcXMdU1gCdhO5J36g+RTdw2ZHCm1+ezVacwminso3KCjW1wfZ4asrv84m93pE5/RsD/wMuLTTiXo8wpER6/XW427sIQIRXXDYIUNsejKQvTYD5ixK58Z90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESQJUVX7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESQJUVX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765427796; x=1796963796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dylaD9h/2tvfLoiqnIRM3WGRH6tM3JLFnjZ9Yifwzk=;
  b=ESQJUVX7VoAoO270h6dde6/fNmju9ssElKUXs6OgT1LJHKvvEsIu/oqd
   ZoXQhdX3r1WP6avrAAZscGQk4GVsGCDyKw2jW/Pzac014dnzalaq8jldh
   wJURrZy+Lrm15h4h4UwdmppSlD9JnjIQFojpQuYKWM0yOJ2xfKW1zGuMt
   j6ByQLBJhYH0tTeY+dWdtunEmVxWhPy6KkyisikL5empGDL/Tis5hNWMl
   k2niKuuZx1XLfnYC2gpS/Hto3VXeIsKGRsUPYODKlb/+F0xsmNddmA3n+
   J+ha1nCwdkJ1oWr/RBHpQexkKU2E+85ZrXLHk0BP7ouOMWQURnh8MzgxS
   w==;
X-CSE-ConnectionGUID: QRCWBM5yQTCjbWl2dgCW1g==
X-CSE-MsgGUID: znoKxE3FQLOHiatz2aNg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78518726"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78518726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:36:35 -0800
X-CSE-ConnectionGUID: 7CjP9qNqQj6i2k19VrMHUQ==
X-CSE-MsgGUID: slH79qMHQ7WnwqlSisRtwA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 20:36:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYPn-0000000049g-1Kse;
	Thu, 11 Dec 2025 04:36:31 +0000
Date: Thu, 11 Dec 2025 12:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: kernel/cgroup/dmem.c:466:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512111220.cuUZGIQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: b168ed458ddecc176f3b9a1f4bcd83d7a4541c14 kernel/cgroup: Add "dmem" memory accounting cgroup
date:   11 months ago
config: i386-randconfig-062-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111220.cuUZGIQi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111220.cuUZGIQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111220.cuUZGIQi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/dmem.c:466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head [noderef] __rcu *
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head *
>> kernel/cgroup/dmem.c:466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head [noderef] __rcu *
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head *

vim +466 kernel/cgroup/dmem.c

   447	
   448	/**
   449	 * dmem_cgroup_unregister_region() - Unregister a previously registered region.
   450	 * @region: The region to unregister.
   451	 *
   452	 * This function undoes dmem_cgroup_register_region.
   453	 */
   454	void dmem_cgroup_unregister_region(struct dmem_cgroup_region *region)
   455	{
   456		struct list_head *entry;
   457	
   458		if (!region)
   459			return;
   460	
   461		spin_lock(&dmemcg_lock);
   462	
   463		/* Remove from global region list */
   464		list_del_rcu(&region->region_node);
   465	
 > 466		list_for_each_rcu(entry, &region->pools) {
   467			struct dmem_cgroup_pool_state *pool =
   468				container_of(entry, typeof(*pool), region_node);
   469	
   470			list_del_rcu(&pool->css_node);
   471		}
   472	
   473		/*
   474		 * Ensure any RCU based lookups fail. Additionally,
   475		 * no new pools should be added to the dead region
   476		 * by get_cg_pool_unlocked.
   477		 */
   478		region->unregistered = true;
   479		spin_unlock(&dmemcg_lock);
   480	
   481		kref_put(&region->ref, dmemcg_free_region);
   482	}
   483	EXPORT_SYMBOL_GPL(dmem_cgroup_unregister_region);
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
