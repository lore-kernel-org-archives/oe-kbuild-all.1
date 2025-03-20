Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5521D3D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471038; cv=none; b=VMJmZRm+sZQZgi1t8+RcqZNd25wZpKUi/hyF5brOCbQVA1YlpX11UiofaM09WLFUhr9ng57mos6dGlGq/e4SRRU/BuSOpSAJiZgFuT8AR+Rlg3/Fq0H+zIyF5ibahJoj80HtVpHTiWHjxh1wdOKbRUdwI+Ikl5jCvs5ArM6aDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471038; c=relaxed/simple;
	bh=x1FjIm2sR6fm6v9GgwTVda7TyMxPpdzkgR6i2Ye0dHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVz7RZPbr199Hig1mv9nv/NrMVH1S4anlClR3SaS1KHbmSSAF4hs9zgiRSPocb5xP4ty5kZtE3cHL491yhsSTkPTR7WxkjYtCX/JG6dXIO6ldm/9qL8xVKJMaaKK1i+0zUU9lTRRMW/sxAChFpt6Q3A68IivpciG6SFdEWbl1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMCaHFbn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMCaHFbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742471036; x=1774007036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1FjIm2sR6fm6v9GgwTVda7TyMxPpdzkgR6i2Ye0dHI=;
  b=HMCaHFbnrZuYUTjfMlbNLKFE9FFYL9l1eH4RD2Faz3UyMWY+ZNKc58yx
   W81ULckvWCNbIyux5OrnpO3tOfzGtJGs5cfosTvg7pgm2w5XAq9uKD6fo
   Ub9iKE7A0wUOZC6k4IZMIAv119IJ/1xrKjrMce6mTTopbXhG1ZE1gJ7fO
   W6JYTNmmPIv2kN0zTMasxfALmPhfkRCCKZQBhU6ZC3RVcdRSRB36ndPn8
   7N2sVh5QbNWgVSuxVhSYbvnaRFW+VXe/mDB4Njs8awgmxRznUtFWjsCL+
   9RPV0cRyseoYKMEyBP4JvdlQlvY4jGj81s/U8QJe6lTeBuE51bapAzBEa
   w==;
X-CSE-ConnectionGUID: U/z0+cC6TguxXCEUPL3njw==
X-CSE-MsgGUID: 7iGqS7KWQYS+0egpqp7Jeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="42865822"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="42865822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 04:43:55 -0700
X-CSE-ConnectionGUID: rjHJaDVlSyS9faHjqTYZQw==
X-CSE-MsgGUID: i0yqi/lhTBGNUkT84yh5xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123075605"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2025 04:43:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvEJT-0000PH-2m;
	Thu, 20 Mar 2025 11:43:51 +0000
Date: Thu, 20 Mar 2025 19:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2816/2816]
 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202503201925.S7VuFUSk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   762816c3c07e052877c68911685e3700fe073298
commit: e53494b741272933726616122ea77143d9742631 [2816/2816] drivers: initial support for rnp drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250320/202503201925.S7VuFUSk-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201925.S7VuFUSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201925.S7VuFUSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp_main.c:34:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_tc_u32_parse.h:6:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:20:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     898 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:1068:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1068 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_main.c:34:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_tc_u32_parse.h:6:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:174:6: warning: no previous prototype for function 'rnp_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     174 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | void rnp_unmap_and_free_tx_resource(struct rnp_ring *ring,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:669:5: warning: no previous prototype for function 'rnp_rx_ring_reinit' [-Wmissing-prototypes]
     669 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:669:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     669 | int rnp_rx_ring_reinit(struct rnp_adapter *adapter,
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
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3152:6: warning: no previous prototype for function 'rnp_vlan_stags_flag' [-Wmissing-prototypes]
    3152 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3152 | void rnp_vlan_stags_flag(struct rnp_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3558:5: warning: no previous prototype for function 'rnp_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3558 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3558 | int rnp_xmit_nop_frame_ring(struct rnp_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4811:6: warning: no previous prototype for function 'rnp_service_timer' [-Wmissing-prototypes]
    4811 | void rnp_service_timer(struct timer_list *t)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4811:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4811 | void rnp_service_timer(struct timer_list *t)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4919:6: warning: no previous prototype for function 'rnp_service_task' [-Wmissing-prototypes]
    4919 | void rnp_service_task(struct work_struct *work)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4919:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4919 | void rnp_service_task(struct work_struct *work)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5941:5: warning: no previous prototype for function 'rnp_delete_knode' [-Wmissing-prototypes]
    5941 | int rnp_delete_knode(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5941:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5941 | int rnp_delete_knode(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6030:5: warning: no previous prototype for function 'rnp_config_knode' [-Wmissing-prototypes]
    6030 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6030 | int rnp_config_knode(struct net_device *dev, __be16 protocol,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6089:5: warning: no previous prototype for function 'rnp_setup_tc_cls_u32' [-Wmissing-prototypes]
    6089 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6089:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6089 | int rnp_setup_tc_cls_u32(struct net_device *dev,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6166:6: warning: no previous prototype for function 'rnp_do_reset' [-Wmissing-prototypes]
    6166 | void rnp_do_reset(struct net_device *netdev)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_common.c:10:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:20:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     898 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:1068:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1068 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_common.c:10:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   6 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_lib.c:4:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:20:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     898 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:1068:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1068 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_lib.c:4:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:5: warning: no previous prototype for function 'rnp_acquire_msix_vectors' [-Wmissing-prototypes]
     439 | int rnp_acquire_msix_vectors(struct rnp_adapter *adapter, int vectors)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     439 | int rnp_acquire_msix_vectors(struct rnp_adapter *adapter, int vectors)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:985:6: warning: no previous prototype for function 'rnp_print_ring_info' [-Wmissing-prototypes]
     985 | void rnp_print_ring_info(struct rnp_adapter *adapter)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     985 | void rnp_print_ring_info(struct rnp_adapter *adapter)
         | ^
         | static 
   8 warnings generated.
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_n10.c:8:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:20:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     898 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:1068:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1068 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_n10.c:8:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:122:5: warning: no previous prototype for function 'rnp_eth_set_rar_n10' [-Wmissing-prototypes]
     122 | s32 rnp_eth_set_rar_n10(struct rnp_eth_info *eth, u32 index, u8 *addr,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | s32 rnp_eth_set_rar_n10(struct rnp_eth_info *eth, u32 index, u8 *addr,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:179:5: warning: no previous prototype for function 'rnp_eth_clear_rar_n10' [-Wmissing-prototypes]
     179 | s32 rnp_eth_clear_rar_n10(struct rnp_eth_info *eth, u32 index)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | s32 rnp_eth_clear_rar_n10(struct rnp_eth_info *eth, u32 index)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:214:5: warning: no previous prototype for function 'rnp_eth_set_vmdq_n10' [-Wmissing-prototypes]
     214 | s32 rnp_eth_set_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:214:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     214 | s32 rnp_eth_set_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:244:5: warning: no previous prototype for function 'rnp_eth_clear_vmdq_n10' [-Wmissing-prototypes]
     244 | s32 rnp_eth_clear_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     244 | s32 rnp_eth_clear_vmdq_n10(struct rnp_eth_info *eth, u32 rar, u32 vmdq)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:328:5: warning: no previous prototype for function 'rnp_addr_list_itr' [-Wmissing-prototypes]
     328 | u8 *rnp_addr_list_itr(struct rnp_hw __maybe_unused *hw, u8 **mc_addr_ptr)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:328:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     328 | u8 *rnp_addr_list_itr(struct rnp_hw __maybe_unused *hw, u8 **mc_addr_ptr)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:359:5: warning: no previous prototype for function 'rnp_eth_update_mc_addr_list_n10' [-Wmissing-prototypes]
     359 | s32 rnp_eth_update_mc_addr_list_n10(struct rnp_eth_info *eth,
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:359:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     359 | s32 rnp_eth_update_mc_addr_list_n10(struct rnp_eth_info *eth,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:442:6: warning: no previous prototype for function 'rnp_eth_clr_mc_addr_n10' [-Wmissing-prototypes]
     442 | void rnp_eth_clr_mc_addr_n10(struct rnp_eth_info *eth)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:442:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     442 | void rnp_eth_clr_mc_addr_n10(struct rnp_eth_info *eth)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:457:6: warning: no previous prototype for function 'rnp_eth_update_rss_key_n10' [-Wmissing-prototypes]
     457 | void rnp_eth_update_rss_key_n10(struct rnp_eth_info *eth, bool sriov_flag)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     457 | void rnp_eth_update_rss_key_n10(struct rnp_eth_info *eth, bool sriov_flag)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:486:6: warning: no previous prototype for function 'rnp_eth_update_rss_table_n10' [-Wmissing-prototypes]
     486 | void rnp_eth_update_rss_table_n10(struct rnp_eth_info *eth)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:486:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     486 | void rnp_eth_update_rss_table_n10(struct rnp_eth_info *eth)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:511:5: warning: no previous prototype for function 'rnp_eth_set_vfta_n10' [-Wmissing-prototypes]
     511 | s32 rnp_eth_set_vfta_n10(struct rnp_eth_info *eth, u32 vlan, bool vlan_on)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:511:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     511 | s32 rnp_eth_set_vfta_n10(struct rnp_eth_info *eth, u32 vlan, bool vlan_on)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:551:6: warning: no previous prototype for function 'rnp_eth_clr_vfta_n10' [-Wmissing-prototypes]
     551 | void rnp_eth_clr_vfta_n10(struct rnp_eth_info *eth)
         |      ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | void rnp_eth_clr_vfta_n10(struct rnp_eth_info *eth)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:577:5: warning: no previous prototype for function 'rnp_layer2_pritologic_n10' [-Wmissing-prototypes]
     577 | u16 rnp_layer2_pritologic_n10(u16 hw_id)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:577:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
--
   In file included from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:9:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:20:
   In file included from drivers/net/ethernet/mucse/rnp/rnp_type.h:960:
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:898:37: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     898 |                 req->set_phy_reg.recall_qsfp_page = 1;
         |                                                   ^ ~
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h:1068:45: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
    1068 |                 req->loopback.loopback_force_speed_enable = 1;
         |                                                           ^ ~
   In file included from drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:9:
   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21:
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1100:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1100 |         int err;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1140:6: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1140 |         int value;
         |             ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1136:5: warning: no previous prototype for function 'rnp_fw_reg_read' [-Wmissing-prototypes]
    1136 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         |     ^
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1136 | int rnp_fw_reg_read(struct rnp_hw *hw, int addr, int sz)
         | ^
         | static 
   9 warnings generated.
..


vim +/int +898 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.h

   879	
   880	static inline void build_set_phy_reg(struct mbx_fw_cmd_req *req,
   881					     void *cookie,
   882					     enum PHY_INTERFACE phy_inf,
   883					     char nr_lane, int reg, int w_data,
   884					     int recall_qsfp_page)
   885	{
   886		req->flags = 0;
   887		req->opcode = SET_PHY_REG;
   888		req->datalen = sizeof(req->set_phy_reg);
   889		req->cookie = cookie;
   890		req->reply_lo = 0;
   891		req->reply_hi = 0;
   892		req->set_phy_reg.phy_interface = phy_inf;
   893		req->set_phy_reg.nr_lane = nr_lane;
   894		req->set_phy_reg.phy_reg_addr = reg;
   895		req->set_phy_reg.phy_w_data = w_data;
   896	
   897		if (recall_qsfp_page)
 > 898			req->set_phy_reg.recall_qsfp_page = 1;
   899		else
   900			req->set_phy_reg.recall_qsfp_page = 0;
   901	}
   902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
