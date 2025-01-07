Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA41E1C22
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736291147; cv=none; b=r+iyD+7MqWKAdI3MhliTs6IpZdF73vJtjblpI4lUfnkYbipbfBPRYSJHQhMb/BDJb5w6FQbxYGL1/tNeB8C0EflO/Dek6tGtjH8Nu6g2rj+F7V1RTGWtiW+DoPCCjeiIYyu8g2r2c+XhKMae8cJFOB+ER9Dyyn0k/IKZDTd0NVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736291147; c=relaxed/simple;
	bh=vqK5vvRBvgJKTqvNPVgFRRD5OiszX59dyUXPiLu2Dsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EN5uKhNKGi8Q2iMH4VYT/Xzyhpzllccc4dT0Y444tPbHkqbAAHX8zl3rp64AVYpCbK5yBsLKUDn78o3sDtF0iYWSmd1JaLoSf0JIDncgGltVMff1fXivIyDbYySveCF+Ox8Gr7UYCluDbqyqXWm58WyYths10OQcmJSOkpaec48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PapQDVq3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PapQDVq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736291147; x=1767827147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqK5vvRBvgJKTqvNPVgFRRD5OiszX59dyUXPiLu2Dsc=;
  b=PapQDVq3UTlC4z5dsG6WoNXOiyt6WMIgs+o7id2gTcgiYuYQKdF2Tcf4
   mOZ3acGxG7SJdVRQX5o8dyE4Ob+KJi9fp0808Wt5F1O9SsieXiHpoiUNE
   e36H3cV8a7SNwRr18DhMTCB1t2TPjtNMUyS5xvlI9eSW5iZlWXkpIQZT3
   Gk96wiBMoHl6rRn6BSQvh2HvT2O4mX/GZCyXL/GjZi2GpQxMXYx7PwCz/
   33n5SW0NZpFd3dEKVCF8xZcn0snnNlN1Yk2H0C8eZ6wgWCxn/EzIHQb77
   SnsI3wZ/x71D/GXdk8ZzprAj5bXa6/as54dhKK0xvY0tbqpINjxXqyTus
   Q==;
X-CSE-ConnectionGUID: Ys012N96QMKv5zUr9qQMXg==
X-CSE-MsgGUID: qxqq/sdnSwObWyBNOfaWgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36519903"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36519903"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 15:05:46 -0800
X-CSE-ConnectionGUID: kior5DytSOiV3fxbom6YWg==
X-CSE-MsgGUID: z8/Hb7y0Sl2RcZQeVinVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103399767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jan 2025 15:05:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVIdq-000FKH-02;
	Tue, 07 Jan 2025 23:05:42 +0000
Date: Wed, 8 Jan 2025 07:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: [mripard:cgroup-dmem-drm 1/4] kernel/cgroup/dmem.c:466:9: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202501080710.dFwsrvsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm
head:   aa4f9d7f77836d5a48daaa99479c2603e9a548ed
commit: b168ed458ddecc176f3b9a1f4bcd83d7a4541c14 [1/4] kernel/cgroup: Add "dmem" memory accounting cgroup
config: m68k-randconfig-r121-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080710.dFwsrvsv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250108/202501080710.dFwsrvsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080710.dFwsrvsv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/dmem.c:466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head [noderef] __rcu *
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head *
>> kernel/cgroup/dmem.c:466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head [noderef] __rcu *
   kernel/cgroup/dmem.c:466:9: sparse:    struct list_head *
   kernel/cgroup/dmem.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
