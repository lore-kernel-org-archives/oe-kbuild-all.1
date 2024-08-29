Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4126296
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 02:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724897561; cv=none; b=cN076b9gQFt//0VIFjpxSPgo26xORrOXemPP32tTn0ekIdFrJ8sIZDOoruKt6H3HizpKKrYn8ToHxuNF9nIRPx3S3vJE9DV7uSKBC/ZaRRKf12Kwp87aZMOqZrUMuaaZyn2R2sndts2wq75BQnHQn6UIaoGdYhQYssJPPko5lhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724897561; c=relaxed/simple;
	bh=ojSuFeMnBsstV/roytjLmBT+mJ5iYU++zw2MgNs63pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9iMYs5ohJ3RnIx0gNB90TSE0/ygtpq0/65vgsWfHbdS0A3aL89l2CQOxWofuOXbu0eR22DeXFOqiAXJM2UXZsST8uJQ11Swl+Oxy4eCEoL+RHlO6Md+ldHtJY7Q9BJfuMgEMtLwyLbY6vtRrMKIrcqgSq8yDg3uJfTsI6jssqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZ70vYoS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ70vYoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724897559; x=1756433559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojSuFeMnBsstV/roytjLmBT+mJ5iYU++zw2MgNs63pM=;
  b=mZ70vYoSolnCv0ObtVZXPVOYdBEuncFQyaIvGhCL/5AIWmvx2RJ/jRsI
   e5Ub02Mz5ecltMGLvIj1q3FQSHZBzlUb7aWq4DteTtJhmzQBLRoMqc1dQ
   qdpV0DNds6Bs/nrFFyAitRcXM1ud/VkBByd+OBEtTQed+o4k7nZRExukM
   XejKV6ok55Qm7Nj2YcMbfv7YWw485/mI0+5qmAYmT5WWCXF3YTXD70tuL
   4fKnfzSVsxHyHJaDCCF1o2MormVy9jd/MOJF62qJJrvQ1KtYa/xHyjzhL
   td7x1JV3xNORY6jvsxucH9FrHtrQhdx58u6lzI3pacObo5mlqcZ7NMbiW
   g==;
X-CSE-ConnectionGUID: 2Ln51hSkTs2lUB6yXF0z8w==
X-CSE-MsgGUID: gnf9aQYqRMC9MM6czLFFUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27257042"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="27257042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 19:12:39 -0700
X-CSE-ConnectionGUID: 86q8AcKrTtuiZxJVx50qsQ==
X-CSE-MsgGUID: TaYd0NUfTC6g0YpB9pPchg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="100937804"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2024 19:12:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjUeJ-000LZq-2B;
	Thu, 29 Aug 2024 02:12:35 +0000
Date: Thu, 29 Aug 2024 10:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20743/30000]
 arch/x86/events/zhaoxin/uncore.c:1722:28: warning: 'cluster_id' is used
 uninitialized
Message-ID: <202408291024.7rvSMXcC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b3492b88408a530f644afcd9e80b98cbf9883a82
commit: 2bb7fd043b4123c569fbbde1f18e98d7565a4997 [20743/30000] x86/perf: Update PMU support for more Zhaoxin CPU
config: x86_64-randconfig-074-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291024.7rvSMXcC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291024.7rvSMXcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291024.7rvSMXcC-lkp@intel.com/

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
