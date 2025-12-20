Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A72F12C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263311; cv=none; b=ArxXiVIH6QDMEjHVWOuIe17KU7Gcmq5lXOQcYR7vMxpaPJ0u80ezchxtPBOMG9oBvcuNycb3dyN0nniyjgQ/2gl7pq2bLW3+Mrz2atoISes3Mjto0RxpIE5lKG+MKIuJa27+0XwX1fSxjT54/NJEw3Zu5VRTn4E0AIXfmXUO4to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263311; c=relaxed/simple;
	bh=ar+j9MpP8xbXCP394gafz3jPAWeeF5NNkvcL4hzvQN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuuC4VtYsnU7X8mgw2y6MBScaqzvsg6n3b2mvxYGFW6FiAOtm2heE1yQE+Hjes1HP4Z4xgUmSOHCfCu4wOxQJOgoI9IwwZOtLJ++fIVpcFHOw89vRyWEyDt6VtvE6dSBZL9Zpdnr5mdU5lYfjYW8xbaMH4VkPAwsB9kXeTGf86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yk9Zy/qv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yk9Zy/qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766263310; x=1797799310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ar+j9MpP8xbXCP394gafz3jPAWeeF5NNkvcL4hzvQN4=;
  b=Yk9Zy/qv85YzGGCK1gJsg7cbHfYQlIL3k9CJ5cVj29pSc3e84o5YgiqM
   YQTrSZf/R3e6pnDDMp2TlXRgTvRWMNgb4mNLXTk4HzU3yV9av46O8YvvW
   qcb4+bYzjrdpfA3fUt23/mqTDT0ggtiilOTXSCMvW1KF42truGrhB+QQv
   u+xhqF1wECHqx73hgs4hmk+2YpgNb557uO3Gs53gFuapedilOrYXoPqDa
   Wlh8SEngfeeVGpID7sSsgZow6Gpi6Ud7noE5zGExeRjQcAwfIbh+FsuhF
   wghodXex07WG6WEoHWjoLUE9U3s17qKV8a1rd9kNfq/ETpfZ3hUeinBZz
   A==;
X-CSE-ConnectionGUID: YdYJ1F0xQeauzrMGmm1uyw==
X-CSE-MsgGUID: C8RyiMciSKW2deCc/Qhaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72045290"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72045290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:41:49 -0800
X-CSE-ConnectionGUID: 53uxeayHRDawLFvQUGCPyA==
X-CSE-MsgGUID: xQM3ueO/RcO8Jrw0PEzBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203296282"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 12:41:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3lp-000000004mW-0w7X;
	Sat, 20 Dec 2025 20:41:45 +0000
Date: Sat, 20 Dec 2025 21:41:08 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Ruilin <liruilin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for PFN_RANGE_ALLOC when selected by OBMM
Message-ID: <202512202153.48eS6EBE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: b2b4a358c0963806835f9a6ff96c2e34d1543216 [1/1] obmm: Add Ownership Based Memory Management framework
config: arm64-kismet-CONFIG_PFN_RANGE_ALLOC-CONFIG_OBMM-0-0 (https://download.01.org/0day-ci/archive/20251220/202512202153.48eS6EBE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512202153.48eS6EBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202153.48eS6EBE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PFN_RANGE_ALLOC when selected by OBMM
   WARNING: unmet direct dependencies detected for PFN_RANGE_ALLOC
     Depends on [n]: MEMORY_HOTPLUG [=n]
     Selected by [y]:
     - OBMM [=y] && UB [=y] && UB_UMMU_CORE [=y] && UB_UBUS [=y] && HISI_SOC_CACHE [=y]
   
   WARNING: unmet direct dependencies detected for ARM_SPE_MEM_SAMPLING
     Depends on [n]: ARM_SPE_PMU [=n]
     Selected by [y]:
     - MEM_SAMPLING [=y] && ARM64 [=y]
   
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - ARM64 [=y]
   
   WARNING: unmet direct dependencies detected for NUMA_REMOTE
     Depends on [n]: NUMA [=y] && ARM64 [=y] && ARM64_4K_PAGES [=y] && SPARSEMEM_VMEMMAP [=y] && ZONE_EXTMEM [=n]
     Selected by [y]:
     - OBMM [=y] && UB [=y] && UB_UMMU_CORE [=y] && UB_UBUS [=y] && HISI_SOC_CACHE [=y]
   
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
