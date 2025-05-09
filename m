Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A9231853
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802591; cv=none; b=e7V2qyFytLKgTfkyqLwnJoyNHlTHM59a5OORbe83ngbCGswBGkjPgDmnrIGPwpPhlv0Ei1t5htAIGxz9WyxMNIHycpn4v/CEP/XvA15Lp+8YOBTSU3l78urUOZ/gb85bJLP6Vu7MZi9ZKtBn7VTHxFKjm+G+CVsrN5xQg7q22IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802591; c=relaxed/simple;
	bh=HED4zxlS8gl8mIRj6YBUfLQ+EBLzk9RroOneZ9G5/dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqQUC0B+9rt/wosBqVs2JwAqeaGKosdrqg1ylSb7IGFfelCiBc6PoPf68eH9GYRIbTRh1xNF2SNQY0HvY/ZDMTBakjO5wqD9eQ/dEIOZfwZtGvH0o3r+v/s11GZJJxnvexdT9rGZDQFObEyQaWxQOe7NJzb8pDEmfsmCTCuQDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GM220uyq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GM220uyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746802588; x=1778338588;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HED4zxlS8gl8mIRj6YBUfLQ+EBLzk9RroOneZ9G5/dc=;
  b=GM220uyqwYs/nD2VZD0usvnPnhhnBKMr31iLN6ipaslDQ6VtxV5deZz2
   2WdLt1O6HssbvBZChBP5ZEq5iNO7WTF+a6H0Og+QqrlJmjAWPZRN3ohQV
   8vDbdhNpyCS1F0FZU2F6ZfdufiWb0bR+jbzwiKzIs72Fi6hZPOe2o4Vtw
   mY+kdQwkiunK7Am/ZDe4xHO5zgzwnz2JRYOEZfGhgOgfa4xe/G9ySUFcW
   Pv2RCWkwBDWqoA35S5/KTX+Vorvn+/CLl6O///4h/Zx4GLpGfdkelDGZX
   zVf5Eyga+8Xdx1frvkhy07oBwD9ljEs716bgXBoswIVP+gEB85rEjwlvc
   g==;
X-CSE-ConnectionGUID: YS4yhVFRRhaVG72RJmXsBw==
X-CSE-MsgGUID: PKLKZ4B3TFa6Z/vC73wmiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59977512"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59977512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 07:56:26 -0700
X-CSE-ConnectionGUID: tWeNGuOPSw+zBRBpdhgN0g==
X-CSE-MsgGUID: Nv3D1katQ7yCwo+5QfSB4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="167719632"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 07:56:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDP9C-000CBF-0f;
	Fri, 09 May 2025 14:56:22 +0000
Date: Fri, 9 May 2025 22:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2891/2891]
 drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1211:6: warning: no
 previous prototype for function 'hinic3_need_proc_link_event'
Message-ID: <202505100150.DG1QGwH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2e5032bf08eca1f3b062773540ff27c51788390d
commit: 79871cd2cd720225eb582c9ed49fb4a96a270b3b [2891/2891] net/hinic3: Synchronize new NIC features and bug fixes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250510/202505100150.DG1QGwH3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100150.DG1QGwH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100150.DG1QGwH3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_comm.c:1671:6: warning: no previous prototype for function 'hinic3_is_optical_module_mode' [-Wmissing-prototypes]
    1671 | bool hinic3_is_optical_module_mode(void *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_comm.c:1671:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1671 | bool hinic3_is_optical_module_mode(void *hwdev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_sriov.c:176:5: warning: no previous prototype for function 'hinic3_pci_sriov_check' [-Wmissing-prototypes]
     176 | int hinic3_pci_sriov_check(struct hinic3_sriov_info *sriov_info, struct pci_dev *dev, int num_vfs)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_sriov.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     176 | int hinic3_pci_sriov_check(struct hinic3_sriov_info *sriov_info, struct pci_dev *dev, int num_vfs)
         | ^
         | static 
   1 warning generated.
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:6: warning: no previous prototype for function 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     103 | void hinic3_uld_lock_init(void)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void hinic3_uld_lock_init(void)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:5: warning: no previous prototype for function 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:5: warning: no previous prototype for function '__set_vroce_func_state' [-Wmissing-prototypes]
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:6: warning: no previous prototype for function 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:7: warning: no previous prototype for function 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:6: warning: no previous prototype for function 'hinic3_set_func_state' [-Wmissing-prototypes]
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:6: warning: no previous prototype for function 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         | ^
         | static 
   7 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_dev_mgmt.c:618:6: warning: no previous prototype for function 'hinic3_write_oshr_info' [-Wmissing-prototypes]
     618 | void hinic3_write_oshr_info(struct os_hot_replace_info *out_oshr_info,
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_dev_mgmt.c:618:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     618 | void hinic3_write_oshr_info(struct os_hot_replace_info *out_oshr_info,
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:865:5: warning: no previous prototype for function 'hinic3_global_func_id_hw' [-Wmissing-prototypes]
     865 | u16 hinic3_global_func_id_hw(void *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:865:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     865 | u16 hinic3_global_func_id_hw(void *hwdev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1211:6: warning: no previous prototype for function 'hinic3_need_proc_link_event' [-Wmissing-prototypes]
    1211 | bool hinic3_need_proc_link_event(struct hinic3_lld_dev *lld_dev)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1211 | bool hinic3_need_proc_link_event(struct hinic3_lld_dev *lld_dev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1258:6: warning: no previous prototype for function 'hinic3_need_proc_bond_event' [-Wmissing-prototypes]
    1258 | bool hinic3_need_proc_bond_event(struct hinic3_lld_dev *lld_dev)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1258 | bool hinic3_need_proc_bond_event(struct hinic3_lld_dev *lld_dev)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:342:5: warning: no previous prototype for function 'hinic3_rx_queue_stat_pack' [-Wmissing-prototypes]
     342 | int hinic3_rx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     342 | int hinic3_rx_queue_stat_pack(struct hinic3_show_item *item,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:357:5: warning: no previous prototype for function 'hinic3_tx_queue_stat_pack' [-Wmissing-prototypes]
     357 | int hinic3_tx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     357 | int hinic3_tx_queue_stat_pack(struct hinic3_show_item *item,
         | ^
         | static 
   2 warnings generated.
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_dbg.c:689:5: warning: variable 'cos_num' set but not used [-Wunused-but-set-variable]
     689 |         u8 cos_num, valid_cos_bitmap;
         |            ^
   1 warning generated.
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c:59:6: warning: variable 'size' set but not used [-Wunused-but-set-variable]
      59 |         u32 size;
         |             ^
   drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c:1757:5: warning: no previous prototype for function 'hinic3_ndo_set_vf_link_state' [-Wmissing-prototypes]
    1757 | int hinic3_ndo_set_vf_link_state(struct net_device *netdev, int vf_id, int link)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c:1757:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1757 | int hinic3_ndo_set_vf_link_state(struct net_device *netdev, int vf_id, int link)
         | ^
         | static 
   2 warnings generated.
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:54: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd16'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:95: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd16_clear'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:137: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd32'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:179: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd32_clear'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:222: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd64_pair'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:277: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd64_pair_clear'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:319: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd64'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_api.c:360: warning: Function parameter or member 'instance' not described in 'hinic3_sm_ctr_rd64_clear'
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:623:6: warning: no previous prototype for function 'print_port_info' [-Wmissing-prototypes]
     623 | void print_port_info(struct hinic3_nic_io *nic_io,
         |      ^
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:623:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     623 | void print_port_info(struct hinic3_nic_io *nic_io,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:802:6: warning: no previous prototype for function 'hinic3_notify_vf_bond_status' [-Wmissing-prototypes]
     802 | void hinic3_notify_vf_bond_status(struct hinic3_nic_io *nic_io,
         |      ^
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:802:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     802 | void hinic3_notify_vf_bond_status(struct hinic3_nic_io *nic_io,
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:832:6: warning: no previous prototype for function 'hinic3_notify_all_vfs_bond_changed' [-Wmissing-prototypes]
     832 | void hinic3_notify_all_vfs_bond_changed(void *hwdev, u8 bond_status)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:832:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     832 | void hinic3_notify_all_vfs_bond_changed(void *hwdev, u8 bond_status)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1678:5: warning: no previous prototype for function 'set_fecparam' [-Wmissing-prototypes]
    1678 | int set_fecparam(void *hwdev, u8 fecparam)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1678:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1678 | int set_fecparam(void *hwdev, u8 fecparam)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1706:5: warning: no previous prototype for function 'get_fecparam' [-Wmissing-prototypes]
    1706 | int get_fecparam(void *hwdev, u8 *advertised_fec, u8 *supported_fec)
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1706 | int get_fecparam(void *hwdev, u8 *advertised_fec, u8 *supported_fec)
         | ^
         | static 
   5 warnings generated.
..


vim +/hinic3_need_proc_link_event +1211 drivers/net/ethernet/huawei/hinic3/hinic3_main.c

  1210	
> 1211	bool hinic3_need_proc_link_event(struct hinic3_lld_dev *lld_dev)
  1212	{
  1213		int ret = 0;
  1214		u16 func_id;
  1215		u8 roce_enable = false;
  1216		bool is_slave_func = false;
  1217		struct hinic3_hw_bond_infos hw_bond_infos = {0};
  1218	
  1219		if (!lld_dev)
  1220			return false;
  1221	
  1222		/* 非slave设备需要处理link down事件 */
  1223		ret = hinic3_is_slave_func(lld_dev->hwdev, &is_slave_func);
  1224		if (ret != 0) {
  1225			nic_err(&lld_dev->pdev->dev, "NIC get info, lld_dev is null\n");
  1226			return true;
  1227		}
  1228	
  1229		if (!is_slave_func)
  1230			return true;
  1231	
  1232		/* 未使能了vroce功能，需处理link down事件 */
  1233		func_id = hinic3_global_func_id(lld_dev->hwdev);
  1234		ret = hinic3_get_func_vroce_enable(lld_dev->hwdev, func_id,
  1235						   &roce_enable);
  1236		if (ret != 0)
  1237			return true;
  1238	
  1239		if (!roce_enable)
  1240			return true;
  1241	
  1242		/* 未创建bond,需要处理link down事件 */
  1243		hw_bond_infos.bond_id = HINIC_OVS_BOND_DEFAULT_ID;
  1244	
  1245		ret = hinic3_get_hw_bond_infos(lld_dev->hwdev, &hw_bond_infos,
  1246					       HINIC3_CHANNEL_COMM);
  1247		if (ret != 0) {
  1248			pr_err("[ROCE, ERR] Get chipf bond info failed (%d)\n", ret);
  1249			return true;
  1250		}
  1251	
  1252		if (!hw_bond_infos.valid)
  1253			return true;
  1254	
  1255		return false;
  1256	}
  1257	
> 1258	bool hinic3_need_proc_bond_event(struct hinic3_lld_dev *lld_dev)
  1259	{
  1260		return !hinic3_need_proc_link_event(lld_dev);
  1261	}
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
