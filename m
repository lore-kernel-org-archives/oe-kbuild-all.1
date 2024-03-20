Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D39664A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710953064; cv=none; b=Lc41lb9IQSShvmfIsNk+/Ch9dHjMb7wdb3fbzVJp+yIwf64WcihOj32pyCqzoMbXCr+TGOI+Tx/sfV0/6N6Rl+xugySc3dzrpfoZ9WXLVyNVrIvbAp1AsGgAu/JzjRw3nJuf47jmOe0HNw4TgaZrYOKyfaLY/e9pzhzfWfYEpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710953064; c=relaxed/simple;
	bh=/NHvpwGeSo2Y/rEFZt5/3nth2xtfmvYfY/Zdbg1is5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCKwcFAWKR7yZo1xNdUrOkZcD4FpdEqy/JusLYOWhjJ9MCJKNDz8s93SJQfkXG9IsFB3CM7CXE7ozNHG8qp8WBK94vSSRW39fEYt6S9OWks80cYM9VB9heri3109CCb7u67sYWcU3zgFtI+naPybmUla0B1vxSDSB/PVXRCwV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U03TjRaG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U03TjRaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710953061; x=1742489061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NHvpwGeSo2Y/rEFZt5/3nth2xtfmvYfY/Zdbg1is5Q=;
  b=U03TjRaGH5mXw0FH47YpVYaT0F8Rfnxw2mUZAqLO5MP7Fk/6dIOVVyGC
   WPZSZZOZimsyBVqXKohlN+WUXpFiNl9pvmn+Ivq9xFDbc45FDuqP0/yce
   VdkXcM0zZy7PJaY29DdqYiJZ/Nz2/lcg9To24h1z63kQOu7MyoauBqKsL
   y+0FK1uUZ1wABXjHt1Vg5nK7LOjQdLkxwaiHPFAsChNcm8JAhAi3oQWb0
   4s//zOx8XKWEzY+Za8nk0eAUbg32D/NxM9o6RQnQeYLzL8UM4vL+F2WsH
   Jv7g/yW2cHDAZNKZTRI7dvGnOninjr2hKLrThdpSCKkdFQsbEjcGTh2iV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16531139"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="16531139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 09:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="45193696"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2024 09:44:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmz31-000Imx-2B;
	Wed, 20 Mar 2024 16:44:15 +0000
Date: Thu, 21 Mar 2024 00:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4225/4226]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest
 braces around empty body in an 'if' statement
Message-ID: <202403210049.GByOQrbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1fbfc27b811b42bafdbe80c46f1fd2d9dfb1e976
commit: eba3cbcfeafedc65b74eea8faf68aae00aebd5b6 [4225/4226] drivers: initial support for rnpgbe drivers from Mucse Technology
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240321/202403210049.GByOQrbb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210049.GByOQrbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210049.GByOQrbb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:35:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h: In function '_rnpgbe_skb_dump':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     311 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:271:6: warning: no previous prototype for 'rnpgbe_disable_eee_mode' [-Wmissing-prototypes]
     271 | void rnpgbe_disable_eee_mode(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:730:5: warning: no previous prototype for 'rnpgbe_rx_ring_reinit' [-Wmissing-prototypes]
     730 | int rnpgbe_rx_ring_reinit(struct rnpgbe_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: In function 'rnpgbe_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:1933:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1933 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2170:6: warning: no previous prototype for 'rnpgbe_write_eitr_rx' [-Wmissing-prototypes]
    2170 | void rnpgbe_write_eitr_rx(struct rnpgbe_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: In function 'rnpgbe_configure_tx_ring':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2727:62: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    2727 |                         rnpgbe_dbg("wait tx ready timeout\n");
         |                                                              ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3209:6: warning: no previous prototype for 'rnpgbe_vlan_stags_flag' [-Wmissing-prototypes]
    3209 | void rnpgbe_vlan_stags_flag(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3314:6: warning: no previous prototype for 'rnpgbe_reinit_locked' [-Wmissing-prototypes]
    3314 | void rnpgbe_reinit_locked(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3487:5: warning: no previous prototype for 'rnpgbe_xmit_nop_frame_ring' [-Wmissing-prototypes]
    3487 | int rnpgbe_xmit_nop_frame_ring(struct rnpgbe_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3503:6: warning: no previous prototype for 'print_status' [-Wmissing-prototypes]
    3503 | void print_status(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4624:6: warning: no previous prototype for 'rnpgbe_eee_init' [-Wmissing-prototypes]
    4624 | bool rnpgbe_eee_init(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4651:5: warning: no previous prototype for 'rnpgbe_phy_init_eee' [-Wmissing-prototypes]
    4651 | int rnpgbe_phy_init_eee(struct rnpgbe_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6132:6: warning: no previous prototype for 'rnpgbe_assign_netdev_ops' [-Wmissing-prototypes]
    6132 | void rnpgbe_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: In function 'rnpgbe_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2484:43: warning: '-' directive output may be truncated writing 1 byte into a region of size between 0 and 17 [-Wformat-truncation=]
    2484 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                           ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2483:25: note: 'snprintf' output between 10 and 37 bytes into a destination of size 24
    2483 |                         snprintf(q_vector->name, sizeof(q_vector->name) - 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2484 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2485 |                                  q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h:21,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c:9:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h: In function '_rnpgbe_skb_dump':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     311 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h:21,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:4:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h: In function '_rnpgbe_skb_dump':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     311 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:308:5: warning: no previous prototype for 'rnpgbe_acquire_msix_vectors' [-Wmissing-prototypes]
     308 | int rnpgbe_acquire_msix_vectors(struct rnpgbe_adapter *adapter, int vectors)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:719:6: warning: no previous prototype for 'update_ring_count' [-Wmissing-prototypes]
     719 | void update_ring_count(struct rnpgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h:21,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:8:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h: In function '_rnpgbe_skb_dump':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     311 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:160:5: warning: no previous prototype for 'rnpgbe_eth_set_rar_n500' [-Wmissing-prototypes]
     160 | s32 rnpgbe_eth_set_rar_n500(struct rnpgbe_eth_info *eth, u32 index, u8 *addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:212:5: warning: no previous prototype for 'rnpgbe_eth_clear_rar_n500' [-Wmissing-prototypes]
     212 | s32 rnpgbe_eth_clear_rar_n500(struct rnpgbe_eth_info *eth, u32 index)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:246:5: warning: no previous prototype for 'rnpgbe_eth_set_vmdq_n500' [-Wmissing-prototypes]
     246 | s32 rnpgbe_eth_set_vmdq_n500(struct rnpgbe_eth_info *eth, u32 rar, u32 vmdq)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:267:5: warning: no previous prototype for 'rnpgbe_eth_clear_vmdq_n500' [-Wmissing-prototypes]
     267 | s32 rnpgbe_eth_clear_vmdq_n500(struct rnpgbe_eth_info *eth, u32 rar, u32 vmdq)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:366:5: warning: no previous prototype for 'rnpgbe_addr_list_itr' [-Wmissing-prototypes]
     366 | u8 *rnpgbe_addr_list_itr(struct rnpgbe_hw __maybe_unused *hw, u8 **mc_addr_ptr)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:394:5: warning: no previous prototype for 'rnpgbe_eth_update_mc_addr_list_n500' [-Wmissing-prototypes]
     394 | s32 rnpgbe_eth_update_mc_addr_list_n500(struct rnpgbe_eth_info *eth,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:477:6: warning: no previous prototype for 'rnpgbe_eth_clr_mc_addr_n500' [-Wmissing-prototypes]
     477 | void rnpgbe_eth_clr_mc_addr_n500(struct rnpgbe_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:492:5: warning: no previous prototype for 'rnpgbe_eth_set_rss_hfunc_n500' [-Wmissing-prototypes]
     492 | int rnpgbe_eth_set_rss_hfunc_n500(struct rnpgbe_eth_info *eth, int hfunc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:522:6: warning: no previous prototype for 'rnpgbe_eth_update_rss_key_n500' [-Wmissing-prototypes]
     522 | void rnpgbe_eth_update_rss_key_n500(struct rnpgbe_eth_info *eth,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:556:6: warning: no previous prototype for 'rnpgbe_eth_update_rss_table_n500' [-Wmissing-prototypes]
     556 | void rnpgbe_eth_update_rss_table_n500(struct rnpgbe_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:583:5: warning: no previous prototype for 'rnpgbe_eth_set_vfta_n500' [-Wmissing-prototypes]
     583 | s32 rnpgbe_eth_set_vfta_n500(struct rnpgbe_eth_info *eth, u32 vlan,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:624:6: warning: no previous prototype for 'rnpgbe_eth_clr_vfta_n500' [-Wmissing-prototypes]
     624 | void rnpgbe_eth_clr_vfta_n500(struct rnpgbe_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:680:5: warning: no previous prototype for 'rnpgbe_layer2_pritologic_n500' [-Wmissing-prototypes]
     680 | u16 rnpgbe_layer2_pritologic_n500(u16 hw_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:685:6: warning: no previous prototype for 'rnpgbe_eth_set_layer2_n500' [-Wmissing-prototypes]
     685 | void rnpgbe_eth_set_layer2_n500(struct rnpgbe_eth_info *eth,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:712:6: warning: no previous prototype for 'rnpgbe_eth_clr_layer2_n500' [-Wmissing-prototypes]
     712 | void rnpgbe_eth_clr_layer2_n500(struct rnpgbe_eth_info *eth, u16 pri_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:720:6: warning: no previous prototype for 'rnpgbe_eth_clr_all_layer2_n500' [-Wmissing-prototypes]
     720 | void rnpgbe_eth_clr_all_layer2_n500(struct rnpgbe_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:728:5: warning: no previous prototype for 'rnpgbe_tuple5_pritologic_n500' [-Wmissing-prototypes]
     728 | u16 rnpgbe_tuple5_pritologic_n500(u16 hw_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:733:6: warning: no previous prototype for 'rnpgbe_eth_set_tuple5_n500' [-Wmissing-prototypes]
     733 | void rnpgbe_eth_set_tuple5_n500(struct rnpgbe_eth_info *eth,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:814:6: warning: no previous prototype for 'rnpgbe_eth_clr_tuple5_n500' [-Wmissing-prototypes]
     814 | void rnpgbe_eth_clr_tuple5_n500(struct rnpgbe_eth_info *eth, u16 pri_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:822:6: warning: no previous prototype for 'rnpgbe_eth_clr_all_tuple5_n500' [-Wmissing-prototypes]
     822 | void rnpgbe_eth_clr_all_tuple5_n500(struct rnpgbe_eth_info *eth)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:830:6: warning: no previous prototype for 'rnpgbe_eth_set_tcp_sync_n500' [-Wmissing-prototypes]
     830 | void rnpgbe_eth_set_tcp_sync_n500(struct rnpgbe_eth_info *eth, int queue,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:846:6: warning: no previous prototype for 'rnpgbe_eth_set_rx_skip_n500' [-Wmissing-prototypes]
     846 | void rnpgbe_eth_set_rx_skip_n500(struct rnpgbe_eth_info *eth, int count,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1001:5: warning: no previous prototype for 'rnpgbe_init_hw_ops_n500' [-Wmissing-prototypes]
    1001 | s32 rnpgbe_init_hw_ops_n500(struct rnpgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1014:5: warning: no previous prototype for 'rnpgbe_get_permtion_mac_addr_n500' [-Wmissing-prototypes]
    1014 | s32 rnpgbe_get_permtion_mac_addr_n500(struct rnpgbe_hw *hw, u8 *mac_addr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1027:5: warning: no previous prototype for 'rnpgbe_reset_hw_ops_n500' [-Wmissing-prototypes]
    1027 | s32 rnpgbe_reset_hw_ops_n500(struct rnpgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1099:5: warning: no previous prototype for 'rnpgbe_start_hw_ops_n500' [-Wmissing-prototypes]
    1099 | s32 rnpgbe_start_hw_ops_n500(struct rnpgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1856:5: warning: no previous prototype for 'rnpgbe_check_mac_link_hw_ops_n500' [-Wmissing-prototypes]
    1856 | s32 rnpgbe_check_mac_link_hw_ops_n500(struct rnpgbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1888:5: warning: no previous prototype for 'rnpgbe_setup_mac_link_hw_ops_n500' [-Wmissing-prototypes]
    1888 | s32 rnpgbe_setup_mac_link_hw_ops_n500(struct rnpgbe_hw *hw, u32 adv,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1897:6: warning: no previous prototype for 'rnpgbe_clean_link_hw_ops_n500' [-Wmissing-prototypes]
    1897 | void rnpgbe_clean_link_hw_ops_n500(struct rnpgbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1956:5: warning: no previous prototype for 'rnpgbe_phy_read_reg_hw_ops_n500' [-Wmissing-prototypes]
    1956 | s32 rnpgbe_phy_read_reg_hw_ops_n500(struct rnpgbe_hw *hw, u32 reg_addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1969:5: warning: no previous prototype for 'rnpgbe_phy_write_reg_hw_ops_n500' [-Wmissing-prototypes]
    1969 | s32 rnpgbe_phy_write_reg_hw_ops_n500(struct rnpgbe_hw *hw, u32 reg_addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1980:6: warning: no previous prototype for 'rnpgbe_setup_wol_hw_ops_n500' [-Wmissing-prototypes]
    1980 | void rnpgbe_setup_wol_hw_ops_n500(struct rnpgbe_hw *hw, u32 mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1987:6: warning: no previous prototype for 'rnpgbe_setup_eee_hw_ops_n500' [-Wmissing-prototypes]
    1987 | void rnpgbe_setup_eee_hw_ops_n500(struct rnpgbe_hw *hw, int ls, int tw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:1998:6: warning: no previous prototype for 'rnpgbe_set_eee_mode_hw_ops_n500' [-Wmissing-prototypes]
    1998 | void rnpgbe_set_eee_mode_hw_ops_n500(struct rnpgbe_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2006:6: warning: no previous prototype for 'rnpgbe_reset_eee_mode_hw_ops_n500' [-Wmissing-prototypes]
    2006 | void rnpgbe_reset_eee_mode_hw_ops_n500(struct rnpgbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2013:6: warning: no previous prototype for 'rnpgbe_set_eee_pls_hw_ops_n500' [-Wmissing-prototypes]
    2013 | void rnpgbe_set_eee_pls_hw_ops_n500(struct rnpgbe_hw *hw, int link)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2020:5: warning: no previous prototype for 'rnpgbe_get_lpi_status_hw_ops_n500' [-Wmissing-prototypes]
    2020 | u32 rnpgbe_get_lpi_status_hw_ops_n500(struct rnpgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2027:5: warning: no previous prototype for 'rnpgbe_get_ncsi_mac_hw_ops_n500' [-Wmissing-prototypes]
    2027 | int rnpgbe_get_ncsi_mac_hw_ops_n500(struct rnpgbe_hw *hw, u8 *addr, int idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2050:5: warning: no previous prototype for 'rnpgbe_get_ncsi_vlan_hw_ops_n500' [-Wmissing-prototypes]
    2050 | int rnpgbe_get_ncsi_vlan_hw_ops_n500(struct rnpgbe_hw *hw, u16 *vlan, int idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2066:6: warning: no previous prototype for 'rnpgbe_set_lldp_hw_ops_n500' [-Wmissing-prototypes]
    2066 | void rnpgbe_set_lldp_hw_ops_n500(struct rnpgbe_hw *hw, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2071:6: warning: no previous prototype for 'rnpgbe_get_lldp_hw_ops_n500' [-Wmissing-prototypes]
    2071 | void rnpgbe_get_lldp_hw_ops_n500(struct rnpgbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2075:6: warning: no previous prototype for 'rnpgbe_set_eee_timer_hw_ops_n500' [-Wmissing-prototypes]
    2075 | void rnpgbe_set_eee_timer_hw_ops_n500(struct rnpgbe_hw *hw, int ls, int tw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2082:6: warning: no previous prototype for 'rnpgbe_set_vf_vlan_mode_hw_ops_n500' [-Wmissing-prototypes]
    2082 | void rnpgbe_set_vf_vlan_mode_hw_ops_n500(struct rnpgbe_hw *hw, u16 vlan, int vf,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2092:6: warning: no previous prototype for 'rnpgbe_driver_status_hw_ops_n500' [-Wmissing-prototypes]
    2092 | void rnpgbe_driver_status_hw_ops_n500(struct rnpgbe_hw *hw, bool enable,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2256:5: warning: no previous prototype for 'rnp500_get_link_ksettings' [-Wmissing-prototypes]
    2256 | int rnp500_get_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2381:5: warning: no previous prototype for 'rnp500_set_link_ksettings' [-Wmissing-prototypes]
    2381 | int rnp500_set_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2550:6: warning: no previous prototype for 'rnp500_get_pauseparam' [-Wmissing-prototypes]
    2550 | void rnp500_get_pauseparam(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2574:5: warning: no previous prototype for 'rnp500_set_pauseparam' [-Wmissing-prototypes]
    2574 | int rnp500_set_pauseparam(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: In function 'rnp500_get_strings':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:2624:13: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    2624 |         u32 dma_ch;
         |             ^~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: In function 'rnp500_get_ethtool_stats':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:3075:21: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
    3075 |                 int idx;
         |                     ^~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: At top level:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c:3265:6: warning: no previous prototype for 'rnpgbe_set_ethtool_hw_ops_n500' [-Wmissing-prototypes]
    3265 | void rnpgbe_set_ethtool_hw_ops_n500(struct net_device *netdev)
--
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h:21,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:9:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h: In function '_rnpgbe_skb_dump':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:311:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     311 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:276:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     276 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h:275:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     275 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:15:24: warning: no previous prototype for 'mbx_cookie_zalloc' [-Wmissing-prototypes]
      15 | struct mbx_req_cookie *mbx_cookie_zalloc(int priv_len)
         |                        ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:29:5: warning: no previous prototype for 'rnpgbe_mbx_write_posted_locked' [-Wmissing-prototypes]
      29 | int rnpgbe_mbx_write_posted_locked(struct rnpgbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:66:6: warning: no previous prototype for 'rnpgbe_link_stat_mark_reset' [-Wmissing-prototypes]
      66 | void rnpgbe_link_stat_mark_reset(struct rnpgbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:71:6: warning: no previous prototype for 'rnpgbe_link_stat_mark_disable' [-Wmissing-prototypes]
      71 | void rnpgbe_link_stat_mark_disable(struct rnpgbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:76:5: warning: no previous prototype for 'rnpgbe_mbx_fw_post_req' [-Wmissing-prototypes]
      76 | int rnpgbe_mbx_fw_post_req(struct rnpgbe_hw *hw, struct mbx_fw_cmd_req *req,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:131:5: warning: no previous prototype for 'rnpgbe_fw_send_cmd_wait' [-Wmissing-prototypes]
     131 | int rnpgbe_fw_send_cmd_wait(struct rnpgbe_hw *hw, struct mbx_fw_cmd_req *req,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:185:5: warning: no previous prototype for 'rnpgbe_mbx_get_link' [-Wmissing-prototypes]
     185 | int rnpgbe_mbx_get_link(struct rnpgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:930:5: warning: no previous prototype for 'to_mac_type' [-Wmissing-prototypes]
     930 | int to_mac_type(struct phy_abilities *ability)
         |     ^~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: In function 'rnpgbe_mbx_phy_eee_set':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:1145:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1145 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: In function 'rnpgbe_mbx_get_temp':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:1229:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1229 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:1262:5: warning: no previous prototype for 'rnpgbe_fw_reg_read' [-Wmissing-prototypes]
    1262 | int rnpgbe_fw_reg_read(struct rnpgbe_hw *hw, int addr, int sz)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: In function 'rnpgbe_fw_reg_read':
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:1266:13: warning: variable 'value' set but not used [-Wunused-but-set-variable]
    1266 |         int value;
         |             ^~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: In function 'rnpgbe_mbx_reg_write':
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:564:9: warning: 'build_writereg_req' accessing 16 bytes in a region of size 4 [-Wstringop-overflow=]
     564 |         build_writereg_req(&req, NULL, fw_reg, 4, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c:564:9: note: referencing argument 5 of type 'int[4]'
   In file included from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h:8,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h:1025,
                    from drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h:20:
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:817:20: note: in a call to function 'build_writereg_req'
     817 | static inline void build_writereg_req(struct mbx_fw_cmd_req *req, void *cookie,
         |                    ^~~~~~~~~~~~~~~~~~
..


vim +/if +311 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.h

   264	
   265	#ifndef NO_SKB_DUMP
   266	static inline void _rnpgbe_skb_dump(const struct sk_buff *skb, bool full_pkt)
   267	{
   268		static atomic_t can_dump_full = ATOMIC_INIT(5);
   269	#ifdef DEBUG
   270		struct skb_shared_info *sh = skb_shinfo(skb);
   271	#endif
   272		struct net_device *dev = skb->dev;
   273		//struct sock *sk = skb->sk;
   274		struct sk_buff *list_skb;
   275		bool has_mac, has_trans;
   276		int headroom, tailroom;
   277		int i, len, seg_len;
   278		const char *level = KERN_WARNING;
   279	
   280		if (full_pkt)
   281			full_pkt = atomic_dec_if_positive(&can_dump_full) >= 0;
   282	
   283		if (full_pkt)
   284			len = skb->len;
   285		else
   286			len = min_t(int, skb->len, MAX_HEADER + 128);
   287	
   288		headroom = skb_headroom(skb);
   289		tailroom = skb_tailroom(skb);
   290	
   291		has_mac = skb_mac_header_was_set(skb);
   292		has_trans = skb_transport_header_was_set(skb);
   293	
   294		dbg("%sskb len=%u headroom=%u headlen=%u tailroom=%u\n"
   295		    "mac=(%d,%d) net=(%d,%d) trans=%d\n"
   296		    "shinfo(txflags=%u nr_frags=%u gso(size=%hu type=%u segs=%hu))\n"
   297		    "csum(0x%x ip_summed=%u complete_sw=%u valid=%u level=%u)\n"
   298		    "hash(0x%x sw=%u l4=%u) proto=0x%04x pkttype=%u iif=%d\n",
   299		    level, skb->len, headroom, skb_headlen(skb), tailroom,
   300		    has_mac ? skb->mac_header : -1,
   301		    has_mac ? (skb->network_header - skb->mac_header) : -1,
   302		    skb->network_header, has_trans ? skb_network_header_len(skb) : -1,
   303		    has_trans ? skb->transport_header : -1, sh->tx_flags, sh->nr_frags,
   304		    sh->gso_size, sh->gso_type, sh->gso_segs, skb->csum, skb->ip_summed,
   305		    skb->csum_complete_sw, skb->csum_valid, skb->csum_level, skb->hash,
   306		    skb->sw_hash, skb->l4_hash, ntohs(skb->protocol), skb->pkt_type,
   307		    skb->skb_iif);
   308	
   309		if (dev)
   310			dbg("%sdev name=%s feat=0x%pNF\n", level, dev->name,
 > 311			    &dev->features);
   312	
   313		seg_len = min_t(int, skb_headlen(skb), len);
   314		if (seg_len)
   315			print_hex_dump(level, "skb linear:   ", DUMP_PREFIX_OFFSET, 16,
   316				       1, skb->data, seg_len, false);
   317		len -= seg_len;
   318	
   319		for (i = 0; len && i < skb_shinfo(skb)->nr_frags; i++) {
   320			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
   321			u32 p_len;
   322			struct page *p;
   323			u8 *vaddr;
   324	
   325			p = skb_frag_address(frag);
   326			p_len = skb_frag_size(frag);
   327			seg_len = min_t(int, p_len, len);
   328			vaddr = kmap_atomic(p);
   329			print_hex_dump(level, "skb frag:     ", DUMP_PREFIX_OFFSET, 16,
   330				       1, vaddr, seg_len, false);
   331			kunmap_atomic(vaddr);
   332			len -= seg_len;
   333			if (!len)
   334				break;
   335		}
   336	
   337		if (full_pkt && skb_has_frag_list(skb)) {
   338			dbg("skb fraglist:\n");
   339			skb_walk_frags(skb, list_skb) _rnpgbe_skb_dump(list_skb, true);
   340		}
   341	}
   342	#endif
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
