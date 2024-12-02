Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505BBA53
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154340; cv=none; b=CDAHb6Xt4ZGGZqkthnZ4h6CP+ABHoqmUOPcqErpHVe5GYyvYzVbnvDkARuOFIkVusbH21i4JjKDrhp+wTfOWcO6PdcZq7Fp5OZc85i/9Ilk7ulxT+GMKcSckWGjnqY6X1raDD4gDUft9ep1EFKGPY15e08P5ahc0r4bx/k5yyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154340; c=relaxed/simple;
	bh=uCr9M9VOlcOuL0XUE/oIyM2yBDY4ZzMhMW1rEOtfU3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1F5iIfbicIpVH4xcZ0fvfl18J9v9xLyuaQiwo9xTetv1RrgbIZqlZt/aGKbwlPHKYlLWRQ/k3L0h5xyvIQJCsXKuYX1BHoKqYRLMyiuaTkqKTtptMFFC3wGHKsz7QPNuIbxd23dvTGl6CBL4sO3p6gu7to9rS43Oiim1IYy5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UC5eyVR/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UC5eyVR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733154339; x=1764690339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCr9M9VOlcOuL0XUE/oIyM2yBDY4ZzMhMW1rEOtfU3g=;
  b=UC5eyVR/m8rNTjnZg5x1B5FwGmm4+44xUfUFIWzi7dyevh6EMzdUVqX2
   CSj+7fDjBX0lUwis7AtBVX8E6gR9zjWaXg0Tp/A1uzeqNrtnGDyTV/D5+
   Hn37X3lAJymyuki/pRhQKn2GeGwyCJby6FNm9xXblRx9vefblhpTZGgiO
   IPrWLqFqklcKja4pH0wId8rui5/UGOmdwZfptleKCfCDGLK0vwm49T0yM
   UJmSohHpfRcgJEQYGZK/5VxhdWrSNVBaep12MWyrjx6CgkDqsyxgLNxeS
   TehZkifkQuARArgYmXIEgRoYQoJjrWhXxRuNgf+nBNrCZd8suaaZ8VZQo
   A==;
X-CSE-ConnectionGUID: oV3nm5J8Qi6qEl4VQaAWLw==
X-CSE-MsgGUID: KoPrSl/1RmG1meDHAmnQJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44705020"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="44705020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 07:45:38 -0800
X-CSE-ConnectionGUID: 0Ge+jut1REq5ZCUzZvLWxA==
X-CSE-MsgGUID: pmYuk03DQB+xE2GwvPURQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93453140"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 07:45:37 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI8cA-0002XT-2l;
	Mon, 02 Dec 2024 15:45:34 +0000
Date: Mon, 2 Dec 2024 23:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455]
 drivers/net/ethernet/mucse/rnp/rnp_main.c:7167:17: warning: unused variable
 'hw'
Message-ID: <202412022302.Pt3NTSUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [1455/1455] drivers: initial support for rnp drivers from Mucse Technology
config: x86_64-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241202/202412022302.Pt3NTSUQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022302.Pt3NTSUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022302.Pt3NTSUQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:175:6: warning: no previous prototype for function 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     175 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     175 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:670:5: warning: no previous prototype for function 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     670 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:670:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     670 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:1777:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1777 |         bool xdp_xmit = false;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: warning: no previous prototype for function 'rnp_write_eitr_rx' [-Wmissing-prototypes]
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2012 | void rnp_write_eitr_rx(struct rnp_q_vector *q_vector)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2818:6: warning: variable 'rxctrl' set but not used [-Wunused-but-set-variable]
    2818 |         u32 rxctrl = 0, dma_axi_ctl;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3176:6: warning: no previous prototype for function 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3176 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3176 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3580:5: warning: no previous prototype for function 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3580 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3580 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4842:6: warning: no previous prototype for function 'rnp_service_timer' [-Wmissing-prototypes]
    4842 | void rnp_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4842:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4842 | void rnp_service_timer(struct timer_list *t)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4950:6: warning: no previous prototype for function 'rnp_service_task' [-Wmissing-prototypes]
    4950 | void rnp_service_task(struct work_struct *work)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4950:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4950 | void rnp_service_task(struct work_struct *work)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5972:5: warning: no previous prototype for function 'rnp_delete_knode' [-Wmissing-prototypes]
    5972 | int rnp_delete_knode(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5972:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5972 | int rnp_delete_knode(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6061:5: warning: no previous prototype for function 'rnp_config_knode' [-Wmissing-prototypes]
    6061 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6061:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6061 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6120:5: warning: no previous prototype for function 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6120 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6120 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6197:6: warning: no previous prototype for function 'rnp_do_reset' [-Wmissing-prototypes]
    6197 | void rnp_do_reset(struct net_device *netdev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6197 | void rnp_do_reset(struct net_device *netdev)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6452:6: warning: no previous prototype for function 'rnp_assign_netdev_ops' [-Wmissing-prototypes]
    6452 | void rnp_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6452 | void rnp_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6628:5: warning: no previous prototype for function 'rnp_can_rpu_start' [-Wmissing-prototypes]
    6628 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6628:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6628 | int rnp_can_rpu_start(struct rnp_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:7167:17: warning: unused variable 'hw' [-Wunused-variable]
    7167 |         struct rnp_hw *hw = &adapter->hw;
         |                        ^~
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6481:29: warning: unused function 'rnp_tso_features' [-Wunused-function]
    6481 | static inline unsigned long rnp_tso_features(struct rnp_hw *hw)
         |                             ^~~~~~~~~~~~~~~~
   18 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_sriov.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:305:6: warning: no previous prototype for function 'check_ari_mode' [-Wmissing-prototypes]
     305 | bool check_ari_mode(struct pci_dev *dev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     305 | bool check_ari_mode(struct pci_dev *dev)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:397:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     397 |         int err;
         |             ^
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:411:2: warning: non-void function does not return a value [-Wreturn-type]
     411 |         }
         |         ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:413:2: error: expected identifier or '('
     413 |         return err;
         |         ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:414:1: error: extraneous closing brace ('}')
     414 | }
         | ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:5: warning: no previous prototype for function 'rnp_msg_post_status_signle_link' [-Wmissing-prototypes]
    1140 | int rnp_msg_post_status_signle_link(struct rnp_adapter *adapter, int vf,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1140 | int rnp_msg_post_status_signle_link(struct rnp_adapter *adapter, int vf,
         | ^
         | static 
   5 warnings and 2 errors generated.


vim +/hw +7167 drivers/net/ethernet/mucse/rnp/rnp_main.c

  7153	
  7154	/**
  7155	 * rnp_io_error_detected - called when PCI error is detected
  7156	 * @pdev: Pointer to PCI device
  7157	 * @state: The current pci connection state
  7158	 *
  7159	 * This function is called after a PCI bus error affecting
  7160	 * this device has been detected.
  7161	 */
  7162	static pci_ers_result_t rnp_io_error_detected(struct pci_dev *pdev,
  7163			pci_channel_state_t state)
  7164	{
  7165		struct rnp_adapter *adapter = pci_get_drvdata(pdev);
  7166		struct net_device *netdev = adapter->netdev;
> 7167		struct rnp_hw *hw = &adapter->hw;
  7168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
