Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE6728689F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202055; cv=none; b=HEcgSyTeDvTzEQDHaq+aCghcLhIMNxR7Jq54oTNAJGG7FbiXscG22S4xXuoPOfWZEPLV44leKt1xjmFrwxAHCCwZwTA7+Is1hdBXlh6jJJklNynwWXlICtwtj1WEnF9jRYbwMAcZXMBIxB/0pOhvAobyMsVV6Qofq6uz4vPo2y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202055; c=relaxed/simple;
	bh=HqtPzNLrM2kGb/zAFaJpyOkisLlu3nfgsEgxif7zh0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVbWY/d84i/b8PqVChwS1/dlObJRTsB1gTRJH02KyLnJI1qqCdn9x/Kg0eYGYwodPO4qEPeEWSqH9LURi5+4r27ABNdXRGMIIxqUqQklTxTSvI3DT65X7NmQwsQwfGkE81PI1hQsgTigrvF7wPjwEkazl8By7E1lbX850/SyTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W52qoY27; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W52qoY27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749202054; x=1780738054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HqtPzNLrM2kGb/zAFaJpyOkisLlu3nfgsEgxif7zh0Q=;
  b=W52qoY278JTwIWrrF0pMnTsQW7B74/Q/I2spU+mbAHEFL/Eu4M37uGzY
   0+/nYJVumuSk+8YGpSea+pI/H2z1TiE2fvDQr06NOJUZdCrtXA2xCRPLT
   ZBt/IZ/RK9iPAZGynxgsiypV1NwI6leCgvvjYdZmYwDERdcJ+Wymdaqva
   DElR2oCdkw56AgZp+cwmF5g1PsFNswXaoh5O+mjqLSzq8Ypi+2oTDJbI4
   N8iEJ1bfmNw4PehE87Dic5303ue0wrpDYelNpSX97182WMZs0o9QH5SoS
   lJjffEFtixOU5cC2987HWn9loKa1v/td0qZXeV3HZQs/iTkoFO1NMe+HU
   w==;
X-CSE-ConnectionGUID: 96mzu1KsTmejDwwCayt9vQ==
X-CSE-MsgGUID: 6+ZEVYk0SKOiFBbIdaXsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62394189"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="62394189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 02:27:33 -0700
X-CSE-ConnectionGUID: HUzRTE6OQVy7ZTgI6s/CYA==
X-CSE-MsgGUID: V2HQKyj+SZ2LCM599CheDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146369199"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2025 02:27:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNTMH-0004tD-15;
	Fri, 06 Jun 2025 09:27:29 +0000
Date: Fri, 6 Jun 2025 17:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1659/1659] mm/memory_hotplug.c:971:13:
 warning: 'rollback_node_hotadd' defined but not used
Message-ID: <202506061755.yar1Fr9d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   89f3a2595f2e3f14f976811d203bd8f55ff4eada
commit: 2f5f99f3efc5d34c37f9918c50808a4cfe36c211 [1659/1659] mm: handle uninitialized numa nodes gracefully
config: x86_64-buildonly-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061755.yar1Fr9d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061755.yar1Fr9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061755.yar1Fr9d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.c: In function '__remove_section':
   mm/memory_hotplug.c:481:23: warning: variable 'start_pfn' set but not used [-Wunused-but-set-variable]
     481 |         unsigned long start_pfn;
         |                       ^~~~~~~~~
   mm/memory_hotplug.c: In function 'hotadd_init_pgdat':
   mm/memory_hotplug.c:926:23: warning: unused variable 'start_pfn' [-Wunused-variable]
     926 |         unsigned long start_pfn = PFN_DOWN(start);
         |                       ^~~~~~~~~
   mm/memory_hotplug.c: At top level:
>> mm/memory_hotplug.c:971:13: warning: 'rollback_node_hotadd' defined but not used [-Wunused-function]
     971 | static void rollback_node_hotadd(int nid)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/rollback_node_hotadd +971 mm/memory_hotplug.c

9af3c2dea3a3ae Yasunori Goto  2006-06-27  970  
b9ff036082cd17 Oscar Salvador 2018-08-17 @971  static void rollback_node_hotadd(int nid)
9af3c2dea3a3ae Yasunori Goto  2006-06-27  972  {
b9ff036082cd17 Oscar Salvador 2018-08-17  973  	pg_data_t *pgdat = NODE_DATA(nid);
b9ff036082cd17 Oscar Salvador 2018-08-17  974  
9af3c2dea3a3ae Yasunori Goto  2006-06-27  975  	arch_refresh_nodedata(nid, NULL);
5830169f47269f Reza Arbab     2016-08-11  976  	free_percpu(pgdat->per_cpu_nodestats);
9af3c2dea3a3ae Yasunori Goto  2006-06-27  977  	arch_free_nodedata(pgdat);
9af3c2dea3a3ae Yasunori Goto  2006-06-27  978  	return;
9af3c2dea3a3ae Yasunori Goto  2006-06-27  979  }
9af3c2dea3a3ae Yasunori Goto  2006-06-27  980  

:::::: The code at line 971 was first introduced by commit
:::::: b9ff036082cd1793a59b35c4432644fe44620664 mm/memory_hotplug.c: make add_memory_resource use __try_online_node

:::::: TO: Oscar Salvador <osalvador@suse.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
