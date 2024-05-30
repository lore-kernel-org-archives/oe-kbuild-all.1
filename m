Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998D4595D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717094185; cv=none; b=WsrUO/bFbMlTNm0pySyPLoBOS7+aNApDU9e9wQfaqeb3GC6pOuh11GynWOKtGkNtralIAp9ZM7xF/rjo4z/6KXbW6ob0gIeRPXhFr+YNc8D5EzKsoJDszTizX2TdhZeEwo+i8sR2ssKQFVLn9UNsEUTh+DQIW0RN3M8PzypiRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717094185; c=relaxed/simple;
	bh=VrFKwEz6XuCFAB/kb9ycu0d45KIyTjE3Zqhq83gi5fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNcHTNkFgNhaYt+OdhcK9XApmoGfQOG8N9HVJVpH6bzylhc+iwW70y7NKGAVeu4eEJm8IH+VeCxIAHboLvwgvDN+K0JLEPp+vOQE04jQDZnPI46NADK/f6Vy0G6HQRrvLFQOT1yR54a+NWrU7Sc832C4HaERMbgafwGR9CFAYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDYwB8FH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDYwB8FH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717094183; x=1748630183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrFKwEz6XuCFAB/kb9ycu0d45KIyTjE3Zqhq83gi5fA=;
  b=KDYwB8FHWd/owukBiPsveLWSPjHmNQPSbpGayVB/eTWQNXmgbeciotVO
   iCQE/o/ZfHDVspSxGot5MvSUITTDIPaenhr6wJhxfEFZ3ZI/8TJ2a3MQW
   b0/t2PIgEhf9AJNz2Mh/7vC7PWkURKe4CFmrkx5bPhy15eW0htJc+J8VN
   a5CpKYCJsEwiHTDfA4OU6JTCJ1/OnvXPuAOcWBeVERG+EEHMUQE3g+SRl
   PWfjecgx72wqPAFxfhP2EjmSsVhq1IiSqvWGsdEMEvwzbTHbhFGw/2Ppt
   /Po+u8G/NCGnzXH5zARYV5WEewvABSTBZrm6HBdPvuQhgVeA9T8aY7lWf
   A==;
X-CSE-ConnectionGUID: dVa2rbxBQCaezTdgLATVrA==
X-CSE-MsgGUID: SQ/xIcNTTOm36+4AfGJIgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25007765"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="25007765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 11:36:22 -0700
X-CSE-ConnectionGUID: 33i9Icc5T2CZVK1/jtxwBw==
X-CSE-MsgGUID: +y91nRDwTEK8vDoPkKxIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="35998585"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 May 2024 11:36:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCkdO-000Fqf-0A;
	Thu, 30 May 2024 18:36:18 +0000
Date: Fri, 31 May 2024 02:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, weiwei1 <weiwei1@ramaxel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7420/9794]
 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:54:32: error: no
 member named 'physfn' in 'struct pci_dev'
Message-ID: <202405310216.KzJKJ6DX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   147f67b8431ec3c45060ee19e8458bec4354b6b8
commit: 1ff5e78839ab1038757ebfd00f0a26ae53e64bda [7420/9794] improve 3SNIC 910/920/930 NIC driver
config: x86_64-randconfig-015-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310216.KzJKJ6DX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310216.KzJKJ6DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310216.KzJKJ6DX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:54:32: error: no member named 'physfn' in 'struct pci_dev'
      54 |         dev = pdev->is_virtfn ? pdev->physfn : pdev;
         |                                 ~~~~  ^
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:85:31: warning: shift count >= width of type [-Wshift-count-overflow]
      85 |         ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
         |                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:96:42: warning: shift count >= width of type [-Wshift-count-overflow]
      96 |         ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:277:5: warning: no previous prototype for function 'sss_attach_uld_driver' [-Wmissing-prototypes]
     277 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:320:39: error: no member named 'physfn' in 'struct pci_dev'
     320 |         dev = (pdev->is_virtfn != 0) ? pdev->physfn : pdev;
         |                                        ~~~~  ^
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:5: warning: no previous prototype for function 'sss_pci_probe' [-Wmissing-prototypes]
     549 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     549 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         | ^
         | static 
   4 warnings and 2 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_adapter_mgmt.c:234:30: error: no member named 'physfn' in 'struct pci_dev'
     234 |                 pf_pdev = adapter->pcidev->physfn;
         |                           ~~~~~~~~~~~~~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +54 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c

6864d14bb90f03 weiwei1 2024-04-09  34  
6864d14bb90f03 weiwei1 2024-04-09  35  #define SSS_CHECK_EVENT_INFO(event) \
6864d14bb90f03 weiwei1 2024-04-09  36  			((event)->service == SSS_EVENT_SRV_COMM && \
6864d14bb90f03 weiwei1 2024-04-09  37  			(event)->type == SSS_EVENT_FAULT)
6864d14bb90f03 weiwei1 2024-04-09  38  
6864d14bb90f03 weiwei1 2024-04-09  39  #define SSS_CHECK_FAULT_EVENT_INFO(hwdev, fault_event) \
6864d14bb90f03 weiwei1 2024-04-09  40  			((fault_event)->fault_level == SSS_FAULT_LEVEL_SERIOUS_FLR && \
6864d14bb90f03 weiwei1 2024-04-09  41  			(fault_event)->info.chip.func_id < sss_get_max_pf_num(hwdev))
6864d14bb90f03 weiwei1 2024-04-09  42  
6864d14bb90f03 weiwei1 2024-04-09  43  #define SSS_GET_CFG_REG_BAR(pdev) (SSS_IS_VF_DEV(pdev) ? \
6864d14bb90f03 weiwei1 2024-04-09  44  			SSS_VF_PCI_CFG_REG_BAR : SSS_PF_PCI_CFG_REG_BAR)
6864d14bb90f03 weiwei1 2024-04-09  45  
6864d14bb90f03 weiwei1 2024-04-09  46  static bool sss_get_vf_load_state(struct pci_dev *pdev)
6864d14bb90f03 weiwei1 2024-04-09  47  {
6864d14bb90f03 weiwei1 2024-04-09  48  	struct sss_pci_adapter *adapter = NULL;
6864d14bb90f03 weiwei1 2024-04-09  49  	struct pci_dev *dev = NULL;
6864d14bb90f03 weiwei1 2024-04-09  50  
6864d14bb90f03 weiwei1 2024-04-09  51  	if (pci_is_root_bus(pdev->bus))
6864d14bb90f03 weiwei1 2024-04-09  52  		return false;
6864d14bb90f03 weiwei1 2024-04-09  53  
6864d14bb90f03 weiwei1 2024-04-09 @54  	dev = pdev->is_virtfn ? pdev->physfn : pdev;
6864d14bb90f03 weiwei1 2024-04-09  55  	adapter = pci_get_drvdata(dev);
6864d14bb90f03 weiwei1 2024-04-09  56  
6864d14bb90f03 weiwei1 2024-04-09  57  	if (!adapter) {
6864d14bb90f03 weiwei1 2024-04-09  58  		sdk_err(&pdev->dev, "Invalid adapter, is null.\n");
6864d14bb90f03 weiwei1 2024-04-09  59  		return false;
6864d14bb90f03 weiwei1 2024-04-09  60  	}
6864d14bb90f03 weiwei1 2024-04-09  61  
6864d14bb90f03 weiwei1 2024-04-09  62  	return true;
6864d14bb90f03 weiwei1 2024-04-09  63  }
6864d14bb90f03 weiwei1 2024-04-09  64  

:::::: The code at line 54 was first introduced by commit
:::::: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e support 3SNIC 910/920/930 NIC

:::::: TO: weiwei1 <weiwei1@ramaxel.com>
:::::: CC: weiwei1 <weiwei1@ramaxel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
