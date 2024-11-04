Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FED1CBA01
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748999; cv=none; b=XqogQGYyxmJH2ctdSNu8xDpFL1lU3+zieEkxhTmUexQg3AXBjcMOAHhK8GubB0LR4AzMgBJ60uxZXZchdZxuqWzATWhepJcigiJaTUf8sIFVSY0Jf+AP6tgxdCMzAIJSdRRryhYWG2j/mMRkplYsUdxu9gs7XFG08fBlGEeX4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748999; c=relaxed/simple;
	bh=qw/dPvFglYR+t/CiWf0hBzVI3pjBJs+/ULXi1UON1cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+anRs/KitI8BSycRFjW7a4T1T74/4B+5uWpo2R2U9y2YHUgXlrlBymsFk0cK2w7Ac+Z7I2pvnmpYcbwXYmsQcQwv1Ffmt6xagnCSQ3JWq1YBTcCfqSZefFCZ9zNBxsuEGQjhcYuVUXSHIKTgN4tmifnlk9esBb0KmnQlSzBlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZYRV3Zk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZYRV3Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730748997; x=1762284997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qw/dPvFglYR+t/CiWf0hBzVI3pjBJs+/ULXi1UON1cA=;
  b=nZYRV3ZkpGBR9IOGQ3YULJqOLZq6w/5SMRD7f1KdlSS/Uz2w7K0YuSI0
   AcGPCRSlg7mPU9IpxU0k7LxOtzhM6+UKny8p12tdq5DMf881v+WiTmxPK
   36NWj/JGJVL8qFYetGVRojiPL7iGXr4GP+5GcN7lx2QNfducGwS/gA/BP
   X01nl/Q8jgn4Tl4PX17pTV/oyCk1Gdo17KRpGT5zDpuiMAB1ESc5sUZHC
   fnwh6dqm7Ude+1uCQFPPfpamSWQyhA3MLJUktpezMBjis0J05ID4I6KoU
   ifIeYSaPV+o84Hf8UxsWzvltZ1w1Z2TwDs0QL/Gq/34a7ONaZhoGgqW7m
   g==;
X-CSE-ConnectionGUID: 7ltJ/VPQRiuU1eLnlus8rA==
X-CSE-MsgGUID: 105/6xPIRpCwI7f/se9C2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30578524"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="30578524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:36:35 -0800
X-CSE-ConnectionGUID: iZIf5WMPR+qVcD9Xv/WCcw==
X-CSE-MsgGUID: vefUnrZ6Qy6tP0Plv9wS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="121229489"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2024 11:36:33 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t82sI-000lDB-32;
	Mon, 04 Nov 2024 19:36:30 +0000
Date: Tue, 5 Nov 2024 03:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 16076/16090]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1806:25: error:
 use of undeclared identifier 'PCI_IOV_RESOURCES'
Message-ID: <202411050357.1eY1gMA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [16076/16090] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-011-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050357.1eY1gMA4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050357.1eY1gMA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050357.1eY1gMA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:12:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:404:6: warning: no previous prototype for function 'nbl_dev_free_abnormal_irq' [-Wmissing-prototypes]
     404 | void nbl_dev_free_abnormal_irq(struct nbl_dev_mgt *dev_mgt)
         |      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:404:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     404 | void nbl_dev_free_abnormal_irq(struct nbl_dev_mgt *dev_mgt)
         | ^
         | static 
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1706:6: warning: no previous prototype for function 'nbl_dev_set_eth_mac_addr' [-Wmissing-prototypes]
    1706 | void nbl_dev_set_eth_mac_addr(struct nbl_dev_mgt *dev_mgt, struct net_device *netdev)
         |      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1706 | void nbl_dev_set_eth_mac_addr(struct nbl_dev_mgt *dev_mgt, struct net_device *netdev)
         | ^
         | static 
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1806:25: error: use of undeclared identifier 'PCI_IOV_RESOURCES'
    1806 |                 res = &pdev->resource[PCI_IOV_RESOURCES];
         |                                       ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1828:6: warning: no previous prototype for function 'nbl_dev_unregister_net' [-Wmissing-prototypes]
    1828 | void nbl_dev_unregister_net(struct nbl_adapter *adapter)
         |      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1828 | void nbl_dev_unregister_net(struct nbl_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2409:21: warning: variable 'netdev' set but not used [-Wunused-but-set-variable]
    2409 |         struct net_device *netdev;
         |                            ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2746:26: warning: variable 'net_priv' set but not used [-Wunused-but-set-variable]
    2746 |         struct nbl_netdev_priv *net_priv;
         |                                 ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2926:6: warning: no previous prototype for function 'nbl_dev_stop_common_dev' [-Wmissing-prototypes]
    2926 | void nbl_dev_stop_common_dev(struct nbl_adapter *adapter)
         |      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2926:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2926 | void nbl_dev_stop_common_dev(struct nbl_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2956:6: warning: no previous prototype for function 'nbl_dev_suspend_common_dev' [-Wmissing-prototypes]
    2956 | void nbl_dev_suspend_common_dev(struct nbl_adapter *adapter)
         |      ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2956:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2956 | void nbl_dev_suspend_common_dev(struct nbl_adapter *adapter)
         | ^
         | static 
   8 warnings and 1 error generated.


vim +/PCI_IOV_RESOURCES +1806 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

bad535d287c9c1 Bennie Yan 2024-09-24  1770  
bad535d287c9c1 Bennie Yan 2024-09-24  1771  static int nbl_dev_register_net(struct nbl_dev_mgt *dev_mgt,
bad535d287c9c1 Bennie Yan 2024-09-24  1772  				struct nbl_register_net_result *register_result)
bad535d287c9c1 Bennie Yan 2024-09-24  1773  {
bad535d287c9c1 Bennie Yan 2024-09-24  1774  	struct nbl_service_ops *serv_ops = NBL_DEV_MGT_TO_SERV_OPS(dev_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  1775  	struct pci_dev *pdev = NBL_COMMON_TO_PDEV(NBL_DEV_MGT_TO_COMMON(dev_mgt));
bad535d287c9c1 Bennie Yan 2024-09-24  1776  	struct resource *res;
bad535d287c9c1 Bennie Yan 2024-09-24  1777  	u16 pf_bdf;
bad535d287c9c1 Bennie Yan 2024-09-24  1778  	u64 pf_bar_start;
bad535d287c9c1 Bennie Yan 2024-09-24  1779  	u64 vf_bar_start, vf_bar_size;
bad535d287c9c1 Bennie Yan 2024-09-24  1780  	u16 total_vfs, offset, stride;
bad535d287c9c1 Bennie Yan 2024-09-24  1781  	int pos;
bad535d287c9c1 Bennie Yan 2024-09-24  1782  	u32 val;
bad535d287c9c1 Bennie Yan 2024-09-24  1783  	struct nbl_register_net_param register_param = {0};
bad535d287c9c1 Bennie Yan 2024-09-24  1784  	int ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  1785  
bad535d287c9c1 Bennie Yan 2024-09-24  1786  	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &val);
bad535d287c9c1 Bennie Yan 2024-09-24  1787  	pf_bar_start = (u64)(val & PCI_BASE_ADDRESS_MEM_MASK);
bad535d287c9c1 Bennie Yan 2024-09-24  1788  	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0 + 4, &val);
bad535d287c9c1 Bennie Yan 2024-09-24  1789  	pf_bar_start |= ((u64)val << 32);
bad535d287c9c1 Bennie Yan 2024-09-24  1790  
bad535d287c9c1 Bennie Yan 2024-09-24  1791  	register_param.pf_bar_start = pf_bar_start;
bad535d287c9c1 Bennie Yan 2024-09-24  1792  
bad535d287c9c1 Bennie Yan 2024-09-24  1793  	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
bad535d287c9c1 Bennie Yan 2024-09-24  1794  	if (pos) {
bad535d287c9c1 Bennie Yan 2024-09-24  1795  		pf_bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
bad535d287c9c1 Bennie Yan 2024-09-24  1796  
bad535d287c9c1 Bennie Yan 2024-09-24  1797  		pci_read_config_word(pdev, pos + PCI_SRIOV_VF_OFFSET, &offset);
bad535d287c9c1 Bennie Yan 2024-09-24  1798  		pci_read_config_word(pdev, pos + PCI_SRIOV_VF_STRIDE, &stride);
bad535d287c9c1 Bennie Yan 2024-09-24  1799  		pci_read_config_word(pdev, pos + PCI_SRIOV_TOTAL_VF, &total_vfs);
bad535d287c9c1 Bennie Yan 2024-09-24  1800  
bad535d287c9c1 Bennie Yan 2024-09-24  1801  		pci_read_config_dword(pdev, pos + PCI_SRIOV_BAR, &val);
bad535d287c9c1 Bennie Yan 2024-09-24  1802  		vf_bar_start = (u64)(val & PCI_BASE_ADDRESS_MEM_MASK);
bad535d287c9c1 Bennie Yan 2024-09-24  1803  		pci_read_config_dword(pdev, pos + PCI_SRIOV_BAR + 4, &val);
bad535d287c9c1 Bennie Yan 2024-09-24  1804  		vf_bar_start |= ((u64)val << 32);
bad535d287c9c1 Bennie Yan 2024-09-24  1805  
bad535d287c9c1 Bennie Yan 2024-09-24 @1806  		res = &pdev->resource[PCI_IOV_RESOURCES];
bad535d287c9c1 Bennie Yan 2024-09-24  1807  		vf_bar_size = resource_size(res);
bad535d287c9c1 Bennie Yan 2024-09-24  1808  
bad535d287c9c1 Bennie Yan 2024-09-24  1809  		if (total_vfs) {
bad535d287c9c1 Bennie Yan 2024-09-24  1810  			register_param.pf_bdf = pf_bdf;
bad535d287c9c1 Bennie Yan 2024-09-24  1811  			register_param.vf_bar_start = vf_bar_start;
bad535d287c9c1 Bennie Yan 2024-09-24  1812  			register_param.vf_bar_size = vf_bar_size;
bad535d287c9c1 Bennie Yan 2024-09-24  1813  			register_param.total_vfs = total_vfs;
bad535d287c9c1 Bennie Yan 2024-09-24  1814  			register_param.offset = offset;
bad535d287c9c1 Bennie Yan 2024-09-24  1815  			register_param.stride = stride;
bad535d287c9c1 Bennie Yan 2024-09-24  1816  		}
bad535d287c9c1 Bennie Yan 2024-09-24  1817  	}
bad535d287c9c1 Bennie Yan 2024-09-24  1818  
bad535d287c9c1 Bennie Yan 2024-09-24  1819  	ret = serv_ops->register_net(NBL_DEV_MGT_TO_SERV_PRIV(dev_mgt),
bad535d287c9c1 Bennie Yan 2024-09-24  1820  				     &register_param, register_result);
bad535d287c9c1 Bennie Yan 2024-09-24  1821  
bad535d287c9c1 Bennie Yan 2024-09-24  1822  	if (!register_result->tx_queue_num || !register_result->rx_queue_num)
bad535d287c9c1 Bennie Yan 2024-09-24  1823  		return -EIO;
bad535d287c9c1 Bennie Yan 2024-09-24  1824  
bad535d287c9c1 Bennie Yan 2024-09-24  1825  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  1826  }
bad535d287c9c1 Bennie Yan 2024-09-24  1827  

:::::: The code at line 1806 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
