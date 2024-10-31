Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97FB79CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 01:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730336808; cv=none; b=gpuZ2XBtUof1aEt+dwcZPd9SLDWOr8H3RXBz/sarAFnx1tLYNPIAJ4BrkAtrukRkf0PWLyqoIlaaRs+WhNC9NBSaqgEPNE30GMQ+Qv9liY8LyJEFa8MYSqkc0E6+niMA3OSw4csJ3NKmeBArJQdlOKjR5b52j4Dor0du7RkFaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730336808; c=relaxed/simple;
	bh=aEQxORNhhCvfPW6FDWPgtvPhRQcbna+2Uw31WaYQ/wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0R96QniPAeRByHOO6NobvnOXpWqdPjQQff4RWzgoFhoFtzv4FMxrPlgtyleBPP5ymfLu9BScy0gj5gmiyNLR96OZuqhc7nZb0HPAPRiT8rdYxrVOPHRICOjdgH0w05GuO0A1itGTsu+if4yKTBFqPMTD/V8j9EcgTDkXVytUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m77oZRqi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m77oZRqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730336806; x=1761872806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aEQxORNhhCvfPW6FDWPgtvPhRQcbna+2Uw31WaYQ/wg=;
  b=m77oZRqih1ZSejsVCFx7MfcnvJoaxq53+kGz7HFVYfRUKwdkJBBcGhNz
   A7oihtj/7bapsV8YGFrvgtSUSrod3WZ9e4I3wSjmD3pE3qpGeV+LzQEmi
   kPYkAhHNc5zmZs5B4kMj35CmZ5YU5gntJzfG7pkEfyXYE7/LHQwKguTqY
   pJkYlKkwBC5ySamNT0etgTmSrnxMQiV5gXmvcTYSOVICFrNglT6aFlwE5
   h2v9cH8fBIEhl+rDmKK0W/GOnITOR8D/9/ZBEblPD4XKdAOru/9cnBdyF
   aFu0oONnSk4/UihU16j6GSzfHSqMwRy+7N4TyZUA5FJyHDu5wlx5x05uu
   g==;
X-CSE-ConnectionGUID: ARXWVssRSOm+nO+R1nRiTg==
X-CSE-MsgGUID: N8JLkfGaTnOAS12aDBb+Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47539715"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="47539715"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 18:06:45 -0700
X-CSE-ConnectionGUID: WLiWgX+3TrWrY/jspYXGIQ==
X-CSE-MsgGUID: +JtfXMexQiOG9Oy4tBi9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82600159"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2024 18:06:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Je6-000fU8-07;
	Thu, 31 Oct 2024 01:06:42 +0000
Date: Thu, 31 Oct 2024 09:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19706/30000]
 arch/x86/events/zhaoxin/uncore.c:1722:28: warning: 'cluster_id' is used
 uninitialized
Message-ID: <202410310930.1QiUdusW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4233328af33d2f8cbb5c5ab5f8e60ba36d4d60d3
commit: 2bb7fd043b4123c569fbbde1f18e98d7565a4997 [19706/30000] x86/perf: Update PMU support for more Zhaoxin CPU
config: x86_64-randconfig-015-20241031 (https://download.01.org/0day-ci/archive/20241031/202410310930.1QiUdusW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310930.1QiUdusW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310930.1QiUdusW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/zhaoxin/uncore.c: In function 'uncore_change_context.constprop':
>> arch/x86/events/zhaoxin/uncore.c:1722:28: warning: 'cluster_id' is used uninitialized [-Wuninitialized]
    1722 |         int i, package_id, cluster_id, subnode_id;
         |                            ^~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:1722:40: warning: 'subnode_id' is used uninitialized [-Wuninitialized]
    1722 |         int i, package_id, cluster_id, subnode_id;
         |                                        ^~~~~~~~~~


vim +/cluster_id +1722 arch/x86/events/zhaoxin/uncore.c

  1716	
  1717	static void uncore_change_type_ctx(struct zhaoxin_uncore_type *type, int old_cpu,
  1718					int new_cpu)
  1719	{
  1720		struct zhaoxin_uncore_pmu *pmu = type->pmus;
  1721		struct zhaoxin_uncore_box *box;
> 1722		int i, package_id, cluster_id, subnode_id;
  1723	
  1724		package_id = zx_topology_package_id(old_cpu < 0 ? new_cpu : old_cpu);
  1725		if (boot_cpu_data.x86_model == ZHAOXIN_FAM7_YONGFENG) {
  1726			cluster_id = zx_topology_cluster_id(old_cpu < 0 ? new_cpu : old_cpu);
  1727			subnode_id = zx_topology_subnode_id(old_cpu < 0 ? new_cpu : old_cpu);
  1728		}
  1729	
  1730		for (i = 0; i < type->num_boxes; i++, pmu++) {
  1731			if (boot_cpu_data.x86_model == ZHAOXIN_FAM7_YONGFENG) {
  1732				if (!strcmp(type->name, "llc")) {
  1733					box = pmu->boxes[cluster_id];
  1734					if (!box)
  1735						continue;
  1736				} else {
  1737					box = pmu->boxes[subnode_id];
  1738					if (!box)
  1739						continue;
  1740				}
  1741			} else {
  1742				box = pmu->boxes[package_id];
  1743				if (!box)
  1744					continue;
  1745			}
  1746	
  1747			if (old_cpu < 0) {
  1748				WARN_ON_ONCE(box->cpu != -1);
  1749				box->cpu = new_cpu;
  1750				continue;
  1751			}
  1752			WARN_ON_ONCE(box->cpu != old_cpu);
  1753			box->cpu = -1;
  1754			if (new_cpu < 0)
  1755				continue;
  1756	
  1757			uncore_pmu_cancel_hrtimer(box);
  1758			perf_pmu_migrate_context(&pmu->pmu, old_cpu, new_cpu);
  1759			box->cpu = new_cpu;
  1760		}
  1761	}
  1762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
