Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B4233D80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731100883; cv=none; b=UnyMUCRkqxG14fQSMFG3pe/knaqMdq6v8kjAJMMs9YK/tQ6d2g59t04bJgeMweapKR9zEjyd+DhvcLj2HhdyJvWXA7BPaxiYs+X9aeytpdpCC2ix9PxcmU6iFrr1cR+QxpZuGJ9nB7iiSZHg8JzjJReM3sUYGCz2S4Z3LHzJtM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731100883; c=relaxed/simple;
	bh=gSdUIAYEfD92nLO0b45WNyYFDmY8BW/l7+TLBLc7NDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1H+DN8tCm/J4G5UCVIh4OxVDo7Q33rSb7LHtCstMSkCIGkZkdTjxIZ1NKuLP4tu9IKhXio+bY08/VzfvNxSpSoaQ/rZwy8/SCbU/lqPB3/0cYUjcIeUyvzXBIsqBd8wVOKzM/xpDz7kSuZKe/U8W4O25spul2aPDQsT2r7peCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/vd4gAO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/vd4gAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731100882; x=1762636882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSdUIAYEfD92nLO0b45WNyYFDmY8BW/l7+TLBLc7NDA=;
  b=O/vd4gAOAop7ndh7pFl4isRp9zQtvlvJxOoD8h5cniHTnDujiHLR5dni
   iQ6ZBugu257MeiwVaeAgxBw5AWmjAfLTiJ8s9RS2cvkwsRHZHZGaFxhQd
   u551Bq+h9pUOdQOA5IrTpIwmZvvwtx2u+SKFCFN4taIq2JrXdVSOKthfe
   r8DPAGbOb6+SsNu7et+LcCi2Rpv4/hHF4qKUvyFvlCgENxVofk+BQ0VHl
   xKQlK/d/N0GAmJIBXf/AuaLlFKmRo2UQkEab6zzbxomAsI8AWQJ6DW68S
   5P99Tj1d9LjqeG91KIOKn+EzjtgO1Vfj1C4+nr451CYtzlZkpWP2dgF+A
   Q==;
X-CSE-ConnectionGUID: 6PMvaLhwR5icYd2irKFguw==
X-CSE-MsgGUID: LhPvIP16SIWnvPtuM+7psA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41562539"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41562539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 13:21:21 -0800
X-CSE-ConnectionGUID: xfnWF9QBSN+btBC1Gd/C7A==
X-CSE-MsgGUID: 5fvmw/W7QwWFQRVhsrlv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="90590199"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2024 13:21:20 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9WPt-000ro6-2r;
	Fri, 08 Nov 2024 21:21:17 +0000
Date: Sat, 9 Nov 2024 05:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1436/1436]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:120:37: warning:
 unused variable 'nbl_hwmon_chip_info'
Message-ID: <202411090543.aX5v0JHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9586f809caca17d909e778ce0c1e7c479e094166
commit: 432279e0c75d8281a75ace15d6039cb895a5aa86 [1436/1436] Net: nebula_matrix: fix ci build err
config: x86_64-randconfig-004-20241108 (https://download.01.org/0day-ci/archive/20241109/202411090543.aX5v0JHn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090543.aX5v0JHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090543.aX5v0JHn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:7:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c:120:37: warning: unused variable 'nbl_hwmon_chip_info' [-Wunused-const-variable]
     120 | static const struct hwmon_chip_info nbl_hwmon_chip_info = {
         |                                     ^~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +/nbl_hwmon_chip_info +120 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_hwmon.c

bad535d287c9c1 Bennie Yan 2024-09-24  119  
bad535d287c9c1 Bennie Yan 2024-09-24 @120  static const struct hwmon_chip_info nbl_hwmon_chip_info = {
bad535d287c9c1 Bennie Yan 2024-09-24  121  	.ops = &nbl_hwmon_ops,
bad535d287c9c1 Bennie Yan 2024-09-24  122  	.info = nbl_hwmon_info,
bad535d287c9c1 Bennie Yan 2024-09-24  123  };
bad535d287c9c1 Bennie Yan 2024-09-24  124  

:::::: The code at line 120 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
