Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376C74C04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186202; cv=none; b=t5NTQp6GzlgqggHMWSKcdznliPA9GdNZ0zBkgfEi6e0+BupAb2pBkMO3bY/CxWAT+1GWxdmUe8XArxbS+ED5AiUleCpFMWREPeef4ZtiJWnqpRBAG3cckeE4GJed/cp16Nxm78ovNP7+n0eazZiA67JCCxLNp7XTyQ4noaEtXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186202; c=relaxed/simple;
	bh=eEHooHXx0HB9+XdNC06axVHz7RdXIi6rquqpywlCtL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhWWr2EKnMQ0oRw4Th7Qu3CXP5xT1yvE4DJnNAz57SLJau25s0dpMaxmgu5OIPIMDMfDFRQfyAaCftPOGtc7oS/OlNH+0V2zdEeQlPaCYkG/vEgbn8Ko7YHLVazUPZLnWE7KH9tYiZ2JjgFkl8WEbgbr3o342KnXp4LSVDqBIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWia7hcV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWia7hcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713186198; x=1744722198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEHooHXx0HB9+XdNC06axVHz7RdXIi6rquqpywlCtL0=;
  b=gWia7hcVBDKDo7s4KT379C4I3rnQ4zXP4Mk3EvIEugJGrUpOKhWqp7qc
   I/N6w//dXwwIXV9R3MzF5Wf9zA+O6Mk3tHODFheIPlM4aWHg4czeIPSKx
   j/w8IALUieVqi6BNg5RQ8CQ1Zf2RWzrP/as6rNeILfUSwo1AvIiANAYVO
   n+fRlalanwNf/Fc2gNKKEbAJmUDNXZVqU8jU5A0o4ujx0ro3LCP9rFKv+
   rUIoDwhJzeX/qB+nf2k+rbTUsPmqNSUkuRlrXW5ISVLqtu+J81zQ/lnkn
   XviB8rqexL1jdK2AUx1607NDZvkx1dW89EGglUaCnY01ZiIIpsDBMEfx8
   Q==;
X-CSE-ConnectionGUID: 2cWFVE7bSvamzV1biRBUCA==
X-CSE-MsgGUID: 9HP0OwKqQK61+4RmhlAmbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8432569"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8432569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 06:03:06 -0700
X-CSE-ConnectionGUID: a8H3CBy9TQi5tukQJo2rfQ==
X-CSE-MsgGUID: Slq6Rx66Qbi1uXAEGz6JNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="21964811"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2024 06:03:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwLz9-0004BQ-39;
	Mon, 15 Apr 2024 13:02:59 +0000
Date: Mon, 15 Apr 2024 21:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6268/6466] arch/arm64/include/asm/pci.h:20:27:
 warning: section attribute is specified on redeclared variable
Message-ID: <202404152045.YTd7ZmU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4c1ee7e260d136fea1d11049b198c97b26b45db
commit: 6a5c2354b0fe12efd67accd22c569d68ee3be183 [6268/6466] arm64: Work around Ampere Altra erratum #82288 PCIE_65
config: arm64-randconfig-003-20240415 (https://download.01.org/0day-ci/archive/20240415/202404152045.YTd7ZmU0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404152045.YTd7ZmU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404152045.YTd7ZmU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/adv7180.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2179:
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
   In file included from drivers/media/i2c/adv7180.c:20:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2113:
>> arch/arm64/include/asm/pci.h:20:27: warning: section attribute is specified on redeclared variable [-Wsection]
      20 | extern bool __read_mostly have_altra_erratum_82288;
         |                           ^
   arch/arm64/include/asm/pgtable.h:580:13: note: previous declaration is here
     580 | extern bool have_altra_erratum_82288;
         |             ^
   6 warnings generated.
--
   In file included from drivers/media/i2c/adv7604.c:21:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2179:
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
   In file included from drivers/media/i2c/adv7604.c:34:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2113:
>> arch/arm64/include/asm/pci.h:20:27: warning: section attribute is specified on redeclared variable [-Wsection]
      20 | extern bool __read_mostly have_altra_erratum_82288;
         |                           ^
   arch/arm64/include/asm/pgtable.h:580:13: note: previous declaration is here
     580 | extern bool have_altra_erratum_82288;
         |             ^
   drivers/media/i2c/adv7604.c:429:19: warning: unused function 'cec_write_clr_set' [-Wunused-function]
     429 | static inline int cec_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask,
         |                   ^~~~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from drivers/media/i2c/adv7842.c:23:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2179:
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
   In file included from drivers/media/i2c/adv7842.c:30:
   In file included from include/media/v4l2-device.h:12:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:2113:
>> arch/arm64/include/asm/pci.h:20:27: warning: section attribute is specified on redeclared variable [-Wsection]
      20 | extern bool __read_mostly have_altra_erratum_82288;
         |                           ^
   arch/arm64/include/asm/pgtable.h:580:13: note: previous declaration is here
     580 | extern bool have_altra_erratum_82288;
         |             ^
   drivers/media/i2c/adv7842.c:393:19: warning: unused function 'cec_write_clr_set' [-Wunused-function]
     393 | static inline int cec_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask, u8 val)
         |                   ^~~~~~~~~~~~~~~~~
   7 warnings generated.


vim +20 arch/arm64/include/asm/pci.h

    12	
    13	/*
    14	 * Set to 1 if the kernel should re-assign all PCI bus numbers
    15	 */
    16	#define pcibios_assign_all_busses() \
    17		(pci_has_flag(PCI_REASSIGN_ALL_BUS))
    18	
    19	#ifdef CONFIG_ALTRA_ERRATUM_82288
  > 20	extern bool __read_mostly have_altra_erratum_82288;
    21	#endif
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
