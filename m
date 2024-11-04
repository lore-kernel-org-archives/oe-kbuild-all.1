Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C218622
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730745874; cv=none; b=R3sapopWv1OO7rSa8bYPHKymMX5qDSgCnu7idINUmHoryDub0akz2UrwhpcPAe84iSHd67GOGfv4+9f6xjSWTkPRAPAtZYNBI/0Y2T0kRIXqHBFMlvhjXVpouyCH90Uyed3x68cxjsjhEwKyAFS2m+GIhk2ptAAg+uErt4qm+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730745874; c=relaxed/simple;
	bh=xhR1v6TtbpfDIKvEQH2iMk/TW7/Rr7gCvZHg9V5wD9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deDLO6ZTeWEBb0bz5ewc7pQZGG4m49h6IgJObbFuG8ep7LPcA0gtaa7vtKdY9vnpov/wStvssb54qK68MMmFDiMwexZxQr+CwPjfNEXOJmmWMgcd1rD3RQgqqkvY/vr4jcDwM59YnodjOErwq/sqacdot68toNjHmBtTOnsaPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+LsNBZr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+LsNBZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730745872; x=1762281872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhR1v6TtbpfDIKvEQH2iMk/TW7/Rr7gCvZHg9V5wD9o=;
  b=P+LsNBZrmw62P59Kw1KuJO9hag8ZgYOziulYU+RJPTGX6a1Ngoh0vtgO
   iwMdvPaMn1rDHO8Fes1IEHrkEAetOGw5jXvU90delygwKPU+zr5YU+cOu
   RZRe7abCfdVktHkXDvGRuJ7e+9igsLYMTQoBVTqyM9rHg5654XXJQL8+i
   XiQ+V3woIU3gUFaoLPg0pUSLiNNb984EQYuL2ZU93EJZcIjbwAWXIgReK
   kUzrhaHJhiuK/4sxZDD7E45EMd7ZMedXYzrwXydYDi2S1kptUwXMrkF0r
   YjYXrlEJ+wqCFQSICwPWWqDCKGkuz+3t91eP9Q+2Uak8DEBbUM4vySZMg
   Q==;
X-CSE-ConnectionGUID: Gtj9OfRzRougmSjlCp/dUw==
X-CSE-MsgGUID: V0FdVzQNRVqvf5udgiqXRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30624563"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30624563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:44:32 -0800
X-CSE-ConnectionGUID: nZ9e82IKS8mz+9tpaoPYWA==
X-CSE-MsgGUID: MfO7DmQvRwi8PQ/7IOGiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88887251"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2024 10:44:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t823w-000l8b-0Y;
	Mon, 04 Nov 2024 18:44:28 +0000
Date: Tue, 5 Nov 2024 02:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 16076/16090]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1806:39: error:
 'PCI_IOV_RESOURCES' undeclared; did you mean 'PCI_NUM_RESOURCES'?
Message-ID: <202411050228.sfGyzHzs-lkp@intel.com>
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
config: x86_64-randconfig-002-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050228.sfGyzHzs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050228.sfGyzHzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050228.sfGyzHzs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:404:6: warning: no previous prototype for 'nbl_dev_free_abnormal_irq' [-Wmissing-prototypes]
     404 | void nbl_dev_free_abnormal_irq(struct nbl_dev_mgt *dev_mgt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1706:6: warning: no previous prototype for 'nbl_dev_set_eth_mac_addr' [-Wmissing-prototypes]
    1706 | void nbl_dev_set_eth_mac_addr(struct nbl_dev_mgt *dev_mgt, struct net_device *netdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_register_net':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1806:39: error: 'PCI_IOV_RESOURCES' undeclared (first use in this function); did you mean 'PCI_NUM_RESOURCES'?
    1806 |                 res = &pdev->resource[PCI_IOV_RESOURCES];
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       PCI_NUM_RESOURCES
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1806:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:1828:6: warning: no previous prototype for 'nbl_dev_unregister_net' [-Wmissing-prototypes]
    1828 | void nbl_dev_unregister_net(struct nbl_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_remove_net_dev':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2409:28: warning: variable 'netdev' set but not used [-Wunused-but-set-variable]
    2409 |         struct net_device *netdev;
         |                            ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_stop_net_dev':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2746:33: warning: variable 'net_priv' set but not used [-Wunused-but-set-variable]
    2746 |         struct nbl_netdev_priv *net_priv;
         |                                 ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2926:6: warning: no previous prototype for 'nbl_dev_stop_common_dev' [-Wmissing-prototypes]
    2926 | void nbl_dev_stop_common_dev(struct nbl_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2956:6: warning: no previous prototype for 'nbl_dev_suspend_common_dev' [-Wmissing-prototypes]
    2956 | void nbl_dev_suspend_common_dev(struct nbl_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c: In function 'nbl_phy_disable_rx_err_report':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2850:20: error: 'struct pci_dev' has no member named 'aer_cap'; did you mean 'ats_cap'?
    2850 |         if (!pdev->aer_cap)
         |                    ^~~~~~~
         |                    ats_cap
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2853:42: error: 'struct pci_dev' has no member named 'aer_cap'; did you mean 'ats_cap'?
    2853 |         pci_read_config_byte(pdev, pdev->aer_cap + PCI_ERR_COR_MASK, &mask);
         |                                          ^~~~~~~
         |                                          ats_cap
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:2855:43: error: 'struct pci_dev' has no member named 'aer_cap'; did you mean 'ats_cap'?
    2855 |         pci_write_config_byte(pdev, pdev->aer_cap + PCI_ERR_COR_MASK, mask);
         |                                           ^~~~~~~
         |                                           ats_cap
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c: In function 'nbl_res_adminq_add_cmd_filter_res_write':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:75:48: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      75 |         struct nbl_res_fw_cmd_filter filter = {0};
         |                                                ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:75:48: note: (near initialization for 'filter')
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:75:48: error: invalid initializer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:75:48: note: (near initialization for 'filter.<anonymous>')
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c: In function 'nbl_res_adminq_pt_filter_out':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:1568:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1568 |         int ret = 0;
         |             ^~~
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:37:6: warning: no previous prototype for 'nbl_core_setup_product_ops' [-Wmissing-prototypes]
      37 | void nbl_core_setup_product_ops(struct nbl_adapter *adapter, struct nbl_init_param *param,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c: In function 'nbl_core_remove':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:123:33: warning: variable 'common' set but not used [-Wunused-but-set-variable]
     123 |         struct nbl_common_info *common;
         |                                 ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:429:12: warning: 'nbl_resume' defined but not used [-Wunused-function]
     429 | static int nbl_resume(struct device *dev)
         |            ^~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:421:12: warning: 'nbl_suspend' defined but not used [-Wunused-function]
     421 | static int nbl_suspend(struct device *dev)
         |            ^~~~~~~~~~~


vim +1806 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

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
