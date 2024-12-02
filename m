Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F851DE89C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733179173; cv=none; b=Q9A/T6dsT1IChoK10paREzoej03qp893kbo6LV1Eg2o/OsFshA+rQZ6oROUoWFEtcpZXRR4qBXWPSpvJJ5CZLhmdJgUmJePGr9kT2fMeJNDpjli0q1h24drPp5v5ZTdasTal/4hzCecDTAjRTfc5nfjvTvtlZRBXYhHh6fVfhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733179173; c=relaxed/simple;
	bh=JIG0gZ0Rf6yIdqnqBiflP8FcFO1H09OYWZkWV9xQh1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sWhJ1sMlhGjTNKVjvf2xTsV+YjwAozIS7rsznJMIlNF3FRX+8w6Wo1VEF+gdA94PCu8a8yBQxP/DikVu2TCPAM5m54bNVS0z9zsOcTmqhTuBbh5oofa/pJkE5ioaVS6nBRhBUbvDON43WWSLhvxG6BlJI9VqMbAi+AcNa5yC/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORSRfmW9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORSRfmW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733179172; x=1764715172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIG0gZ0Rf6yIdqnqBiflP8FcFO1H09OYWZkWV9xQh1E=;
  b=ORSRfmW9onbO5T9ZDInHHtAHlGRcddy4Xn2Gx1rD7ceHaCy+Dju9GklB
   LaD0PchMuk3f4nNNLuTj92OQITbdv45FCG8UxAtR4pD8Iqg0+QxSfTd7A
   if6+uGz4QA0f7k099YbnD3qR85jEMLM6dVLZSelwz//jywHLBtJ6E1NoK
   Ec2s7radRvmYwmtwRHk0XDVqJJghTzHf3McBJ7Z6yc5YvnTagTh+vU2A3
   rAxKC6Oyv/0ZmwlQzf2AFE/gNcsj5QNAYnNOVH8P4P9JnbYHCNzlKonqO
   g9KuEf96q6EEUcHWiD6YmhhGXKCTLF7IsapeDFhNoE0cROJVIbIPvf2PD
   A==;
X-CSE-ConnectionGUID: dYcfevwlRdOHO9hrWFAh0Q==
X-CSE-MsgGUID: CyPBPAnhQUW4mX5EkC478A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36225460"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="36225460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 14:39:29 -0800
X-CSE-ConnectionGUID: ng1D/ZkhSlCq6Crm5owRTA==
X-CSE-MsgGUID: ks9E0a3TR6a24865wxfpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="124173280"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2024 14:39:28 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIF4g-0002yf-0T;
	Mon, 02 Dec 2024 22:39:26 +0000
Date: Tue, 3 Dec 2024 06:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wanrenyong <wanry@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c:167:35: error: no member
 named 'physfn' in 'struct pci_dev'
Message-ID: <202412030645.2p5xOIF3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: d48b7d951d22f7f97d68ae7b580769827683d404 [2516/2516] drivers: initial support for xsc drivers from Yunsilicon Technology
config: x86_64-randconfig-r063-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030645.2p5xOIF3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030645.2p5xOIF3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030645.2p5xOIF3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c:7:
   In file included from include/linux/pci.h:1499:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c:8:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:24:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/driver.h:21:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:598:46: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
     598 |         } else if (func_id >= XSC_PCIE1_PF0_FUNC_ID &&
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     599 |                 func_id <= XSC_PCIE1_PF_FUNC_ID_END) {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c:12:
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.h:15:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c:167:35: error: no member named 'physfn' in 'struct pci_dev'
     167 |                 pf_xdev = pci_get_drvdata(pdev->physfn);
         |                                           ~~~~  ^
   8 warnings and 1 error generated.


vim +167 drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c

   159	
   160	int xsc_sriov_attach(struct xsc_core_device *dev)
   161	{
   162		struct pci_dev *pdev = dev->pdev;
   163		struct xsc_core_device *pf_xdev;
   164		struct xsc_core_sriov *sriov;
   165	
   166		if (!xsc_core_is_pf(dev)) {
 > 167			pf_xdev = pci_get_drvdata(pdev->physfn);
   168			sriov = &pf_xdev->priv.sriov;
   169	
   170			sriov->vfs[dev->vf_id].vf = dev->vf_id;
   171			sriov->vfs[dev->vf_id].dev = dev;
   172			return 0;
   173		}
   174	
   175		if (!dev->priv.sriov.num_vfs)
   176			return 0;
   177	
   178		/* If sriov VFs exist in PCI level, enable them in device level */
   179		return xsc_device_enable_sriov(dev, pci_num_vf(dev->pdev));
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
