Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426D30F53A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765523437; cv=none; b=ZgViCpNDfZUw/BrHN/BaT/dfLS/rjZ/XXYXH8yDPiMQSUtVXBiMwWbqDLH2IL0X5BKk/OiIoGwZwg6vP+wRaJeL7VTbNk8TSrOKlJxQm4olBxyuinC0rKVDl+xwILRNT3WZXPkflMeRNDszeUJofspvMBUqaA5CfFWr/WDnMgaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765523437; c=relaxed/simple;
	bh=snXm8G3bKFO2HG4AlauldH071sPSX7LNLl6HdJZwQ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFlSqguQouqY+nt928pBJaXwv0KY5LcWIjOA7YK+0RW5guCtfn/33JR1yX/W9rug8FpUI0DZID3y339bikq3vS7oVsJAGkvwydzozsrAlG7teJFzvsB9Td5dwjIodzOp93jwMIXh1ccktkHh9App3NWcJhEKTAo0sKaAPiKaVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5sP7zBK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5sP7zBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765523434; x=1797059434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snXm8G3bKFO2HG4AlauldH071sPSX7LNLl6HdJZwQ4A=;
  b=X5sP7zBKRp1pkJ2kIMDXf23rMcBn56s+PAV5sFg/9fferW2JPX/zz45A
   Yd7g4R8fzdcQ1kQeJQv4irZGcJZzp/70YG6lwgsGfKiEKCPy9gYUF/819
   bKH2yeFt6YdUkQFZW4r1MHgHuBqaii66Wrmc+QaFL5s9NzMAw4slLkOxX
   A4JyDU8wQUTvFxQpxjw/LEcwHk5hIVbyjN12s5S/5vmheXfj34a5CPu3d
   Cese7LusEMFuMQXJPAZdzgKlF24AWn+fPXxUYZMzkq2+KiSqEfJLUvHy4
   ni8Hf844RhPSgI2qp708Rqqv2MzZ9E53aHntg+2M7dBfZ6O+HLDeegwhr
   g==;
X-CSE-ConnectionGUID: TSmOv0OzRouYTBkMlkRkAg==
X-CSE-MsgGUID: VfTeU9VbQQWiazbt96wrUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67395474"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67395474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 23:10:34 -0800
X-CSE-ConnectionGUID: C7cjUCLkRuKWq/iT9R9ReQ==
X-CSE-MsgGUID: z38F0hH8Rb2PdYrEqloTnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196099446"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 23:10:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTxIN-000000005hx-083e;
	Fri, 12 Dec 2025 07:10:31 +0000
Date: Fri, 12 Dec 2025 15:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3540/3540]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c:63:24: warning:
 variable 'queue_mgt' set but not used
Message-ID: <202512121402.K1KWDJc7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [3540/3540] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-103-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121402.K1KWDJc7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121402.K1KWDJc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121402.K1KWDJc7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
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
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c:63:24: warning: variable 'queue_mgt' set but not used [-Wunused-but-set-variable]
      63 |         struct nbl_queue_mgt *queue_mgt;
         |                               ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c:83:22: warning: variable 'vsi_mgt' set but not used [-Wunused-but-set-variable]
      83 |         struct nbl_vsi_mgt *vsi_mgt;
         |                             ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c:84:22: warning: variable 'phy_ops' set but not used [-Wunused-but-set-variable]
      84 |         struct nbl_phy_ops *phy_ops;
         |                             ^
   8 warnings generated.


vim +/queue_mgt +63 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_vsi.c

bad535d287c9c1 Bennie Yan 2024-09-24  59  
bad535d287c9c1 Bennie Yan 2024-09-24  60  static int nbl_res_vsi_init_chip_module(void *priv)
bad535d287c9c1 Bennie Yan 2024-09-24  61  {
bad535d287c9c1 Bennie Yan 2024-09-24  62  	struct nbl_resource_mgt *res_mgt = (struct nbl_resource_mgt *)priv;
bad535d287c9c1 Bennie Yan 2024-09-24 @63  	struct nbl_queue_mgt *queue_mgt;
bad535d287c9c1 Bennie Yan 2024-09-24  64  	struct nbl_phy_ops *phy_ops;
bad535d287c9c1 Bennie Yan 2024-09-24  65  	int ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  66  
bad535d287c9c1 Bennie Yan 2024-09-24  67  	if (!res_mgt)
bad535d287c9c1 Bennie Yan 2024-09-24  68  		return -EINVAL;
bad535d287c9c1 Bennie Yan 2024-09-24  69  
bad535d287c9c1 Bennie Yan 2024-09-24  70  	queue_mgt = NBL_RES_MGT_TO_QUEUE_MGT(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  71  	phy_ops = NBL_RES_MGT_TO_PHY_OPS(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  72  
bad535d287c9c1 Bennie Yan 2024-09-24  73  	ret = phy_ops->init_chip_module(NBL_RES_MGT_TO_PHY_PRIV(res_mgt),
bad535d287c9c1 Bennie Yan 2024-09-24  74  					res_mgt->resource_info->board_info.eth_speed,
bad535d287c9c1 Bennie Yan 2024-09-24  75  					res_mgt->resource_info->board_info.eth_num);
bad535d287c9c1 Bennie Yan 2024-09-24  76  
bad535d287c9c1 Bennie Yan 2024-09-24  77  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  78  }
bad535d287c9c1 Bennie Yan 2024-09-24  79  

:::::: The code at line 63 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
