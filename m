Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E91991DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326063; cv=none; b=RKtIckjl/83AhEimNh6CSA8RKCP1LcQAvv04RJDDbfbYdLHZBPqtFi85bOwbPL+M5HRjj8S1niCdk5nJZzjcK6pKNClu0i9cvo4bxjQ/lzD44pB7UYjS5vyNY3TCVPHMzGtsBnaAnkWit/23VHBCMPccxPphpSEGvjAZu4efxMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326063; c=relaxed/simple;
	bh=USovzD6NKgR2I5J5F+i/ulrqYUPp+/bgHt8jBeX538c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjLCtDK08/o9/ovtGKl4Y+3xIC+MqvUwCCc1KCa1lPouO4tLsktsPosixyQYLNy4CilO4hW/ZM0kh4AjyR5Nrje66gGiRjF7MVKMGLlg2MTyikdg8c5myFtHnrjTU0/7FqPp2Zq+2MB9hqpO7DEWwrRglDBSNdmyYLfS7ss9cRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXTjV/is; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXTjV/is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730326060; x=1761862060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USovzD6NKgR2I5J5F+i/ulrqYUPp+/bgHt8jBeX538c=;
  b=eXTjV/isfN+R8cU/HI8NsEp/2TczQ1GQLUR+waPPgbTAV6/fTL3kVSaI
   x+qqnMEDj+G9ITUMu2gxndocrMMOaPy7L+enDrU2Blpiq2LxRt5jkcwK9
   BJKT65DoW6oJdTqLOaaMnPAUD7RnvwI435rDIXq4FteAnx0CohQVtxZ8v
   ID63+Kq6aKIQYSO64YrRSMzk1mpRFzm+roJNPX8/t0yA08PuyjID8jzJP
   8cRUqYkUCZ/8CNxAci8tMzV6dNsJ3sT2HXFn2qkfzYEHWmnvic279dRmU
   n4NCI/Bj4hUlrKpL4yS27hb5wiuqghEPmNBhOPKq/pbHOdNU/Ut2KHASo
   A==;
X-CSE-ConnectionGUID: hyEHsF4fRXKCRcuiWOgVGg==
X-CSE-MsgGUID: LG+yeVg4SiKrUmGq2QFubw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29948144"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="29948144"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 15:07:39 -0700
X-CSE-ConnectionGUID: POD6lSOTTQCxSBSx5V5a/w==
X-CSE-MsgGUID: nHh/5erVSRylQGhEEXJReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87049122"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 15:07:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Gql-000fMk-0I;
	Wed, 30 Oct 2024 22:07:35 +0000
Date: Thu, 31 Oct 2024 06:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Xin <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 15901/15906]
 drivers/infiniband/hw/xsc/main.c:1139:5: warning: no previous prototype for
 function 'xsc_ib_reboot_event_handler'
Message-ID: <202410310653.bdy4fiTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab348dfdf1ec26d67e53449056f417e399807edc
commit: bcfb3e65a5707ca4caf593a33276f26b993ad71e [15901/15906] drivers: update Yunsilicon driver to version 2406_rc16
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241031/202410310653.bdy4fiTq-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310653.bdy4fiTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310653.bdy4fiTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/xsc/main.c:13:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/infiniband/hw/xsc/main.c:52:6: warning: variable 'max_sq_sg' set but not used [-Wunused-but-set-variable]
      52 |         int max_sq_sg;
         |             ^
   drivers/infiniband/hw/xsc/main.c:196:6: warning: no previous prototype for function 'xsc_calc_link_info' [-Wmissing-prototypes]
     196 | void xsc_calc_link_info(struct xsc_core_device *xdev,
         |      ^
   drivers/infiniband/hw/xsc/main.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     196 | void xsc_calc_link_info(struct xsc_core_device *xdev,
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:340:5: warning: no previous prototype for function 'xsc_ib_add_gid' [-Wmissing-prototypes]
     340 | int xsc_ib_add_gid(const struct ib_gid_attr *attr, void **context)
         |     ^
   drivers/infiniband/hw/xsc/main.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | int xsc_ib_add_gid(const struct ib_gid_attr *attr, void **context)
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:624:6: warning: no previous prototype for function 'xsc_get_guid' [-Wmissing-prototypes]
     624 | void xsc_get_guid(const u8 *dev_addr, u8 *guid)
         |      ^
   drivers/infiniband/hw/xsc/main.c:624:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     624 | void xsc_get_guid(const u8 *dev_addr, u8 *guid)
         | ^
         | static 
   drivers/infiniband/hw/xsc/main.c:653:6: warning: no previous prototype for function 'xsc_core_event' [-Wmissing-prototypes]
     653 | void xsc_core_event(struct xsc_core_device *xdev, enum xsc_dev_event event,
         |      ^
   drivers/infiniband/hw/xsc/main.c:653:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     653 | void xsc_core_event(struct xsc_core_device *xdev, enum xsc_dev_event event,
         | ^
         | static 
>> drivers/infiniband/hw/xsc/main.c:1139:5: warning: no previous prototype for function 'xsc_ib_reboot_event_handler' [-Wmissing-prototypes]
    1139 | int xsc_ib_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         |     ^
   drivers/infiniband/hw/xsc/main.c:1139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1139 | int xsc_ib_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         | ^
         | static 
   11 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/qp.c:8:
   In file included from include/rdma/ib_umem.h:11:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/infiniband/hw/xsc/qp.c:284:26: warning: variable 'context' set but not used [-Wunused-but-set-variable]
     284 |         struct xsc_ib_ucontext *context;
         |                                 ^
   drivers/infiniband/hw/xsc/qp.c:362:26: warning: variable 'context' set but not used [-Wunused-but-set-variable]
     362 |         struct xsc_ib_ucontext *context;
         |                                 ^
   drivers/infiniband/hw/xsc/qp.c:1274:5: warning: no previous prototype for function 'xsc_icrc_hdr' [-Wmissing-prototypes]
    1274 | u32 xsc_icrc_hdr(struct xsc_ib_dev *dev, void *pkt, u32 size, u32 *icrc)
         |     ^
   drivers/infiniband/hw/xsc/qp.c:1274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1274 | u32 xsc_icrc_hdr(struct xsc_ib_dev *dev, void *pkt, u32 size, u32 *icrc)
         | ^
         | static 
   drivers/infiniband/hw/xsc/qp.c:1364:5: warning: no previous prototype for function 'build_qp1_send_v2' [-Wmissing-prototypes]
    1364 | int build_qp1_send_v2(struct xsc_ib_dev *dev,
         |     ^
   drivers/infiniband/hw/xsc/qp.c:1364:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1364 | int build_qp1_send_v2(struct xsc_ib_dev *dev,
         | ^
         | static 
>> drivers/infiniband/hw/xsc/qp.c:1896:25: warning: variable 'xsc_state' is uninitialized when used here [-Wuninitialized]
    1896 |         qp_attr->sq_draining = xsc_state == XSC_QP_STATE_SQ_DRAINING;
         |                                ^~~~~~~~~
   drivers/infiniband/hw/xsc/qp.c:1877:15: note: initialize the variable 'xsc_state' to silence this warning
    1877 |         int xsc_state;
         |                      ^
         |                       = 0
   drivers/infiniband/hw/xsc/qp.c:1845:32: warning: unused function 'to_ib_qp_state' [-Wunused-function]
    1845 | static inline enum ib_qp_state to_ib_qp_state(enum xsc_qp_state xsc_state)
         |                                ^~~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/qp.c:1860:33: warning: unused function 'to_ib_mig_state' [-Wunused-function]
    1860 | static inline enum ib_mig_state to_ib_mig_state(int xsc_mig_state)
         |                                 ^~~~~~~~~~~~~~~
   12 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/mr.c:11:
   In file included from include/rdma/ib_umem.h:11:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/infiniband/hw/xsc/mr.c:75:6: warning: no previous prototype for function 'xsc_fill_pas' [-Wmissing-prototypes]
      75 | void xsc_fill_pas(int npages, u64 *pas, __be64 *req_pas)
         |      ^
   drivers/infiniband/hw/xsc/mr.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | void xsc_fill_pas(int npages, u64 *pas, __be64 *req_pas)
         | ^
         | static 
>> drivers/infiniband/hw/xsc/mr.c:380:4: warning: no previous prototype for function 'xsc_get_mr_page_mode' [-Wmissing-prototypes]
     380 | u8 xsc_get_mr_page_mode(struct xsc_core_device *xdev, u32 page_shift)
         |    ^
   drivers/infiniband/hw/xsc/mr.c:380:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     380 | u8 xsc_get_mr_page_mode(struct xsc_core_device *xdev, u32 page_shift)
         | ^
         | static 
   7 warnings generated.
--
   In file included from drivers/infiniband/hw/xsc/private_dev.c:9:
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
   drivers/infiniband/hw/xsc/private_dev.c:432:5: warning: no previous prototype for function 'xsc_priv_dev_exec_ioctl' [-Wmissing-prototypes]
     432 | int xsc_priv_dev_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         |     ^
   drivers/infiniband/hw/xsc/private_dev.c:432:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     432 | int xsc_priv_dev_exec_ioctl(struct xsc_core_device *xdev, void *in, int in_size, void *out,
         | ^
         | static 
>> drivers/infiniband/hw/xsc/private_dev.c:977:15: warning: variable 'char_dev' set but not used [-Wunused-but-set-variable]
     977 |         struct cdev *char_dev;
         |                      ^
   7 warnings generated.
--
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1526:5: warning: no previous prototype for function 'xsc_eth_open_channels' [-Wmissing-prototypes]
    1526 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1526 | int xsc_eth_open_channels(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1638:6: warning: no previous prototype for function 'xsc_eth_activate_channel' [-Wmissing-prototypes]
    1638 | void xsc_eth_activate_channel(struct xsc_channel *c)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1638:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1638 | void xsc_eth_activate_channel(struct xsc_channel *c)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1644:6: warning: no previous prototype for function 'xsc_eth_deactivate_channel' [-Wmissing-prototypes]
    1644 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1644:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1644 | void xsc_eth_deactivate_channel(struct xsc_channel *c)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1690:6: warning: no previous prototype for function 'xsc_eth_activate_priv_channels' [-Wmissing-prototypes]
    1690 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1690 | void xsc_eth_activate_priv_channels(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1705:6: warning: no previous prototype for function 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
    1705 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1705:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1705 | void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1864:5: warning: no previous prototype for function 'xsc_eth_change_link_status' [-Wmissing-prototypes]
    1864 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1864:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1864 | int xsc_eth_change_link_status(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1927:6: warning: no previous prototype for function 'xsc_eth_event_handler' [-Wmissing-prototypes]
    1927 | void xsc_eth_event_handler(void *arg)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1927:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1927 | void xsc_eth_event_handler(void *arg)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1935:5: warning: no previous prototype for function 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
    1935 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1935:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1935 | int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1999:5: warning: no previous prototype for function 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
    1999 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1999:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1999 | int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2029:6: warning: no previous prototype for function 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
    2029 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2029 | void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2357:6: warning: no previous prototype for function 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
    2357 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2357 | void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2455:5: warning: no previous prototype for function 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
    2455 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2455:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2455 | int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2525:5: warning: no previous prototype for function 'xsc_set_vf_mac' [-Wmissing-prototypes]
    2525 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2525:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2525 | int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2593:5: warning: no previous prototype for function 'xsc_get_vf_config' [-Wmissing-prototypes]
    2593 | int xsc_get_vf_config(struct net_device *dev,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2593 | int xsc_get_vf_config(struct net_device *dev,
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2610:5: warning: no previous prototype for function 'xsc_set_vf_link_state' [-Wmissing-prototypes]
    2610 | int xsc_set_vf_link_state(struct net_device *dev, int vf,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2610:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2610 | int xsc_set_vf_link_state(struct net_device *dev, int vf,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2620:5: warning: no previous prototype for function 'set_feature_rxcsum' [-Wmissing-prototypes]
    2620 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2620 | int set_feature_rxcsum(struct net_device *netdev, bool enable)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2642:5: warning: no previous prototype for function 'set_feature_vlan_offload' [-Wmissing-prototypes]
    2642 | int set_feature_vlan_offload(struct net_device *netdev, bool enable)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2642:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2642 | int set_feature_vlan_offload(struct net_device *netdev, bool enable)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2694:5: warning: no previous prototype for function 'xsc_eth_set_features' [-Wmissing-prototypes]
    2694 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2694:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2694 | int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2757:5: warning: no previous prototype for function 'xsc_select_queue' [-Wmissing-prototypes]
    2757 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2757:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2757 | u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2766:10: warning: variable 'txq_ix' is uninitialized when used here [-Wuninitialized]
    2766 |                 return txq_ix;
         |                        ^~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2760:12: note: initialize the variable 'txq_ix' to silence this warning
    2760 |         int txq_ix, up = 0;
         |                   ^
         |                    = 0
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2966:24: warning: no previous prototype for function 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
    2966 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         |                        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2966:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2966 | struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2971:6: warning: no previous prototype for function 'xsc_build_rss_params' [-Wmissing-prototypes]
    2971 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2971:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2971 | void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2989:6: warning: no previous prototype for function 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
    2989 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2989 | void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3017:6: warning: no previous prototype for function 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
    3017 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         |      ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3017:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3017 | void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3085:5: warning: no previous prototype for function 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
    3085 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3085:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3085 | int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
         | ^
         | static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3106:5: warning: no previous prototype for function 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
    3106 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3106 | int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:3343:5: warning: no previous prototype for function 'xsc_net_reboot_event_handler' [-Wmissing-prototypes]
    3343 | int xsc_net_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         |     ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:3343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3343 | int xsc_net_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
         | ^
         | static 
   54 warnings generated.
..


vim +/xsc_ib_reboot_event_handler +1139 drivers/infiniband/hw/xsc/main.c

  1138	
> 1139	int xsc_ib_reboot_event_handler(struct notifier_block *nb, unsigned long action, void *data)
  1140	{
  1141		pr_info("xsc ib driver recv %lu event\n", action);
  1142	
  1143		if (exist_incomplete_qp_flush()) {
  1144			xsc_set_exit_flag();
  1145			return NOTIFY_OK;
  1146		}
  1147	
  1148		xsc_remove_rdma_driver();
  1149	
  1150		return NOTIFY_OK;
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
