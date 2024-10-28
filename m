Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E013A271
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150128; cv=none; b=TG3OzP12Bfsf30+3o91LqwIAw8xiFyW/d+7CnwR+SBA92mcvGIz2F1Natqiq1lzDx2O79ZF7sdM9EuD66NmCd2EJgmoZR3gxmMAQrlmUIFk0cpJr1Zv0Q2xoHFhu71I/aYylaNQVB/SNkQUrKkH2hKm1SAfqz3L7zi9kTClJpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150128; c=relaxed/simple;
	bh=xrqB/wDKChKrrXa9s774HLAyWGbtbnuXptKXAWbMhso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbm6p2ch73wD5YvhPtkM+5KgInZIzl8Ck0eY2zW0hP86WtRbKWyBtc+kqzCiw5NOmslSJTWgIY82fqKPuIAiLjXyX4+vAH0lycC+vALxWP817keXwU5JKzsXOO45GfRJ5CXK9PlcwHVRNeVthnv88TmFhoWgU3AYiRC5LSy3C5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YywA92P1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YywA92P1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730150126; x=1761686126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrqB/wDKChKrrXa9s774HLAyWGbtbnuXptKXAWbMhso=;
  b=YywA92P13pDUZP5QzEFXY9r/YtFmSVy/d/lQ+Z5h6DdC8YuLZC0ZlkGE
   6zeWDOOEJv9Z+kCGYjRjYBwz93qqy78IXGIeAUPJn6Who6Oj5Yqw73r0s
   s5rlr0cOMqxL8OWgtS+1vp6bMbjjBVrKyU2zlFWtkYEX7SctMq4Uw5udf
   UVaY/C2FPGeGOjumC9y7h48jlmrBFkH+wplB04rmEOMtPtPXOII4dDaxV
   kQz4G79WtiVbjU4+Sspp5sIOm4GotDCwedLRy4SY+Agt/qeNayqvdUnCl
   jyge9lmTgseLWeT1kl8Rctr1R+rLLcKaA3ThOHyySGahCpe+HL9IM+X9S
   g==;
X-CSE-ConnectionGUID: QNuvMrAEQ0eE+ZCbsrd1nA==
X-CSE-MsgGUID: IYel/DQzRmWhu8I48IZe+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40304912"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40304912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 14:15:25 -0700
X-CSE-ConnectionGUID: iRN+LBSQSsSKvJ3ARJVQ1g==
X-CSE-MsgGUID: SNRfs6gzTX2pURNz1zoyOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81843438"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 14:15:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5X57-000csu-1Z;
	Mon, 28 Oct 2024 21:15:21 +0000
Date: Tue, 29 Oct 2024 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3876/15358]
 drivers/net/ethernet/mucse/rnp/rnp_main.c:7167:17: warning: unused variable
 'hw'
Message-ID: <202410290516.SciOffDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   27e5d43e49e85d816bd05ffe8672ceea631a07e4
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [3876/15358] drivers: initial support for rnp drivers from Mucse Technology
config: arm64-randconfig-004-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290516.SciOffDt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290516.SciOffDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290516.SciOffDt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   22 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_sriov.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
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
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:413:2: error: expected identifier or '('
     413 |         return err;
         |         ^
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:414:1: error: extraneous closing brace ('}')
     414 | }
         | ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:5: warning: no previous prototype for function 'rnp_msg_post_status_signle_link' [-Wmissing-prototypes]
    1140 | int rnp_msg_post_status_signle_link(struct rnp_adapter *adapter, int vf,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1140 | int rnp_msg_post_status_signle_link(struct rnp_adapter *adapter, int vf,
         | ^
         | static 
   9 warnings and 2 errors generated.


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
