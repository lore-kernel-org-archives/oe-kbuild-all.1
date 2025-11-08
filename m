Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5E265CD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 03:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762572068; cv=none; b=O04ecifkQMMTiY3UvkIwPn2a2+w/uj8496lRlsbtulvC+C7niGHBlNICa2kEx2IiJzxHtMmN0D2Uf2auuR0TBqvf7bpMX5xNba0i2zf+0n/U26FUsqlceXz/0wIdDSNTeOwszucMgr99P0rzBNA+a4QeU0ZEdcFBEj43Pb+kSjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762572068; c=relaxed/simple;
	bh=B5HRcPGfD1kNeztBaoGAM7I2Az7OqaUTpDmXd3lrV0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHnbIICyUb7+DYE0RZSwttY78AdiESHOwM+mQ5zPI9GCbTrqGPvJp8INAhiLXlYepdNDxFFTZCp587U4rsd43wpllKQum8Bov2FsgS9LGyslsEteM7vKF94PC3TDJhk81ddhjfcjDQGE4tlHWr1egeYnHvcn/f/7un3/qqap5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLyHTbD9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLyHTbD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762572064; x=1794108064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5HRcPGfD1kNeztBaoGAM7I2Az7OqaUTpDmXd3lrV0o=;
  b=BLyHTbD9OSuOd2wiU2k+As3Q/DNYRPoe+ikd8vdgpG54ly12zo8huqsy
   75fRGPgbrMVZWbz6Xnurbr6Ze4nQkJ/q67cIPYmS2YSMehCmr2hhcICXN
   +mwypDXDcz1QCeNRGMeF1S+MYv4+/+tkNgUbOhfc7lLET4/z2w7trWlc7
   0dN3A/NOrwm34V1o0SlbNiQTlv8zC55cUSi7D+rgm70M5iZaInWL8em1c
   tl/avocxNX+B5LR7s4yiXAXgkJAU1J6Kql605MZ4CcU9PC2mc/7nvS0/n
   Utc+xi3ErY1/KWe5K3Uue5WENERcFS63uyG9TpH9FjmsjjFkbYX61nH/9
   A==;
X-CSE-ConnectionGUID: EKUPjn4GSjiXVCgIr0r+kQ==
X-CSE-MsgGUID: yNNHhwSlSsuKP0Gc/csJpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76071650"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="76071650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 19:21:02 -0800
X-CSE-ConnectionGUID: YcA+h6uZSHaVRamaGbYyZg==
X-CSE-MsgGUID: CQ9TR9sBQnSGyc4hC6lygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="225454242"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2025 19:21:02 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHZVb-0000et-1H;
	Sat, 08 Nov 2025 03:20:59 +0000
Date: Sat, 8 Nov 2025 11:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5059:32:
 warning: unused variable 'nbl_update_fw_ops'
Message-ID: <202511081137.LDIGlbs7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: c83cda743e4b3b6d71e36276bf3dc2b35dc64515 [3124/3124] net:nebula-matrix:fix compile err
config: x86_64-randconfig-072-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081137.LDIGlbs7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081137.LDIGlbs7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081137.LDIGlbs7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:10:
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
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:1378:26: warning: variable 'vector' set but not used [-Wunused-but-set-variable]
    1378 |         struct nbl_serv_vector *vector;
         |                                 ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:3025:28: warning: variable 'ring_mgt' set but not used [-Wunused-but-set-variable]
    3025 |         struct nbl_serv_ring_mgt *ring_mgt;
         |                                   ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4002:22: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
    4002 |         struct nbl_adapter *adapter;
         |                             ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4552:36: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    4552 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5736:15: warning: variable 'name' set but not used [-Wunused-but-set-variable]
    5736 |         u8 *strtab, *name, *product_code = NULL;
         |                      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5740:6: warning: variable 'p4_size' set but not used [-Wunused-but-set-variable]
    5740 |         u32 p4_size = 0;
         |             ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5059:32: warning: unused variable 'nbl_update_fw_ops' [-Wunused-const-variable]
    5059 | static const struct pldmfw_ops nbl_update_fw_ops = {
         |                                ^~~~~~~~~~~~~~~~~
   12 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +/nbl_update_fw_ops +5059 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c

468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5058  
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24 @5059  static const struct pldmfw_ops nbl_update_fw_ops = {
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5060  	.match_record = nbl_serv_pldmfw_op_pci_match_record,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5061  	.send_package_data = nbl_serv_send_package_data,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5062  	.send_component_table = nbl_serv_send_component_table,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5063  	.flash_component = nbl_serv_flash_component,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5064  	.finalize_update = nbl_serv_finalize_update,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5065  };
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5066  

:::::: The code at line 5059 was first introduced by commit
:::::: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b net:nebula-matrix:Add S1000 SNIC driver support

:::::: TO: nebula_matrix_driver <open@nebula-matrix.com>
:::::: CC: nebula_matrix_driver <open@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
