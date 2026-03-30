Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D9391E4C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 04:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774844010; cv=none; b=W+3Dpf8eHP5/eluN7oj8hUtuFgTkzbh7bF+ITcoflpOOBXdhNs14TpweyqrilLqauCLyCm4NqQcivkyjrktLSageQ6MkWlJ51r8fbtt6S2PyQGoh5rsHpcJQBC+i/4yivSu6V4iedzlK4AA/rgaZghulFnPNZBCvaityH1jrs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774844010; c=relaxed/simple;
	bh=T088WL7Y8uTsIFZww4ewfdltfrtPvhGNQ8flufnScyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kyFsh1NwMBvRPFiWTiuWbZ+VbSbEAFipPzqWJwwTwQHAHNDRIF4jRLvHvMXxyc6zl4maGs3gyxvea1nZCXCAkMzUzGnrVNKVih5CNv5sbQHg67aIdgvbdmwfKLOU9W47iSgYOCQRlJxPF6plBuZoK3lPFWJjlJF8izIkigbbYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIpMb1Af; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIpMb1Af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774844008; x=1806380008;
  h=date:from:to:cc:subject:message-id;
  bh=T088WL7Y8uTsIFZww4ewfdltfrtPvhGNQ8flufnScyE=;
  b=TIpMb1AfmqnFTFevOarRfotzvO2pcLxOuHS36VV0z/hBmkSBcFRcwK/b
   s9EhhRxNEu7Dsmjel3klFM01JEdqadWnuWv8j1hHTAleUfr5OyNGJ32AR
   JLRthaDvtzoFmpOg1gXdqXO48lMuKhtYxubA029RgIv3cqmYWLoj2QUPq
   e7jEYcVO4MSuYyE4eB2j8A6k6cTMKUvwqqGteYaMv6N035gmmWAeGFCMk
   m5YZRcdSn7jnZbpSM1ha/keRPzNgHL8q6NqZwQEX7hekyOjCvBOLOsD9P
   rfaZGiiMt2XkbtMWvMKV+kkG/xXcOnVTNbyn2Qvp9M80UqtnxC90/uxrg
   g==;
X-CSE-ConnectionGUID: DX4ohCLDQTi84RTp9VTu7g==
X-CSE-MsgGUID: 6pFA+uRTT8GyeYfW+eZ4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79731632"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79731632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 21:13:26 -0700
X-CSE-ConnectionGUID: RCACbXZkS6ONNqiGn4K39Q==
X-CSE-MsgGUID: gVoWwGgIQlqwoJnI68RlEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225826372"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2026 21:13:26 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w740A-000000000ed-2f0r;
	Mon, 30 Mar 2026 04:13:22 +0000
Date: Mon, 30 Mar 2026 12:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/mm/init.c:73:13: warning: variable 'disable_dma32' set but not
 used
Message-ID: <202603301234.RmPY2TqV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: a1dfc257ae631464fada5881052af7bce8b5533f [4/4] ANDROID: arm64/mm: Add command line option to make ZONE_DMA32 empty
config: arm64-randconfig-004-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301234.RmPY2TqV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301234.RmPY2TqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301234.RmPY2TqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/mm/init.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/init.c:73:13: warning: variable 'disable_dma32' set but not used [-Wunused-but-set-global]
      73 | static bool disable_dma32 __ro_after_init;
         |             ^
   5 warnings generated.


vim +/disable_dma32 +73 arch/arm64/mm/init.c

    68	
    69	/*
    70	 * Provide a run-time mean of disabling ZONE_DMA32 if it is enabled via
    71	 * CONFIG_ZONE_DMA32.
    72	 */
  > 73	static bool disable_dma32 __ro_after_init;
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
