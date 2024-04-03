Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB912B79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 00:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712104189; cv=none; b=smqd8zR5cy/jy6DRmPBg2QvwFRs7bAICFLpP4RH6gVDy4atu1nOVrmfoSbExY4wxjiUKIAYvKhPpVJejUs++K0D7oLc+Cb4S3VQtSojL5w8qNlxYK7ygNlqGwTH1wN7SgHH5tX7b/zj/Q1mpbjWF9UCNhyeedyCA7U1iTL3XcC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712104189; c=relaxed/simple;
	bh=O8V2T0F1/UZHkLwnjBTdXNaKSvuTNIefZgiXQT3nDPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCJGeLIdKyGCxxqHSSDKWGIn0gE6tTumVIU0qaXG5XVMwWgiRB/Dmaw3H6NDgcBXkrviCCqayyM51pzjXP9kEoemS7KEmfL++KVvxfVX+LGjkRhC+4ITE0uNO8pkKoLdul+9k+1p5GPKP6868ExRuoqSHcYgHJMNnnmpFSkYqHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLeHcNve; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLeHcNve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712104187; x=1743640187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8V2T0F1/UZHkLwnjBTdXNaKSvuTNIefZgiXQT3nDPE=;
  b=NLeHcNvePL7upGICfxXsMcC+Ldsu/tcUaE0KdcQGEAzFTNIOrSwuGril
   /O5aqrX8roG2YG8Ql8R9Fv2avd0nVCJPWkK/fChOFkThOdy/ziwWj7SDj
   SHeSJcilz9E7Lj/I84SmhgfkddULyqhBmVcEOIchR49M4Kj+Yi2WbSXeU
   2oeqhRni8F3NKNJ9HuNrfxfp1JIx144YOwJRhjto3qYwH5QxuzLBI/lEb
   vBSYQq+23HMFmI/hkfQtEyeaEGyu+j0tHCAhd9+yw3kwz5hcsGLtZtXXC
   UZHEiDXAmo4VMG4frnpbitqNtgpBlYdTp8vgiy6wrZh1NEGxwMxKbflZW
   w==;
X-CSE-ConnectionGUID: hrEKglBiQquHlvX+KHetbQ==
X-CSE-MsgGUID: /oIuHEo6Tf6Hxcbc5mxYxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7533667"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7533667"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 17:29:46 -0700
X-CSE-ConnectionGUID: ESW4sDcXQVKbLI3TvqKcww==
X-CSE-MsgGUID: 3OlTp3L6SMuDKFyX8vXinw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="55696477"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2024 17:29:44 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rroVa-0001gD-03;
	Wed, 03 Apr 2024 00:29:42 +0000
Date: Wed, 3 Apr 2024 08:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7041/7265]
 drivers/net/ethernet/mucse/rnpgbevf/vf.c:488:5: warning: no previous
 prototype for 'rnpgbevf_addr_list_itr'
Message-ID: <202404030843.QBSlcQpx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   448a7c1b3e0654d6b6801c216e7c265445a83a2f
commit: bf177ad1d8f72824180b44563c09f37562f645de [7041/7265] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240403/202404030843.QBSlcQpx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030843.QBSlcQpx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030843.QBSlcQpx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnpgbevf/vf.h:13,
                    from drivers/net/ethernet/mucse/rnpgbevf/vf.c:4:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: In function 'rnpgbevf_stop_hw_vf':
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:258:13: warning: variable 'number_of_queues' set but not used [-Wunused-but-set-variable]
     258 |         u32 number_of_queues;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:488:5: warning: no previous prototype for 'rnpgbevf_addr_list_itr' [-Wmissing-prototypes]
     488 | u8 *rnpgbevf_addr_list_itr(struct rnpgbevf_hw __maybe_unused *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:685:5: warning: no previous prototype for 'rnpgbevf_negotiate_api_version' [-Wmissing-prototypes]
     685 | int rnpgbevf_negotiate_api_version(struct rnpgbevf_hw *hw, int api)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:690:5: warning: no previous prototype for 'rnpgbevf_get_queues' [-Wmissing-prototypes]
     690 | int rnpgbevf_get_queues(struct rnpgbevf_hw *hw, unsigned int *num_tcs,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:696:6: warning: no previous prototype for 'rnpgbevf_set_veb_mac_n500' [-Wmissing-prototypes]
     696 | void rnpgbevf_set_veb_mac_n500(struct rnpgbevf_hw *hw, u8 *mac, u32 vf_num,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:709:6: warning: no previous prototype for 'rnpgbevf_set_vlan_n500' [-Wmissing-prototypes]
     709 | void rnpgbevf_set_vlan_n500(struct rnpgbevf_hw *hw, u16 vid, u32 vf_num)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnpgbevf/vf.h:13,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h:14,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c:16:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c:254:6: warning: no previous prototype for 'rnpgbevf_get_ringparam' [-Wmissing-prototypes]
     254 | void rnpgbevf_get_ringparam(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c:267:5: warning: no previous prototype for 'rnpgbevf_set_ringparam' [-Wmissing-prototypes]
     267 | int rnpgbevf_set_ringparam(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: In function 'rnpgbevf_get_strings':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c:398:13: warning: variable 'queue_idx' set but not used [-Wunused-but-set-variable]
     398 |         u16 queue_idx;
         |             ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c:102:19: warning: 'rnp_gstrings_test' defined but not used [-Wunused-const-variable=]
     102 | static const char rnp_gstrings_test[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/mucse/rnpgbevf/vf.h:13,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h:14,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:27:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:119:6: warning: no previous prototype for 'rnpgbevf_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     119 | void rnpgbevf_unmap_and_free_tx_resource(struct rnpgbevf_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:777:6: warning: no previous prototype for 'rnpgbevf_alloc_rx_buffers' [-Wmissing-prototypes]
     777 | void rnpgbevf_alloc_rx_buffers(struct rnpgbevf_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2263:6: warning: no previous prototype for 'rnpgbevf_write_eitr_rx' [-Wmissing-prototypes]
    2263 | void rnpgbevf_write_eitr_rx(struct rnpgbevf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2361:6: warning: no previous prototype for 'rnpgbevf_configure_tx_ring' [-Wmissing-prototypes]
    2361 | void rnpgbevf_configure_tx_ring(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2426:6: warning: no previous prototype for 'rnpgbevf_disable_rx_queue' [-Wmissing-prototypes]
    2426 | void rnpgbevf_disable_rx_queue(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2432:6: warning: no previous prototype for 'rnpgbevf_enable_rx_queue' [-Wmissing-prototypes]
    2432 | void rnpgbevf_enable_rx_queue(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2438:6: warning: no previous prototype for 'rnpgbevf_configure_rx_ring' [-Wmissing-prototypes]
    2438 | void rnpgbevf_configure_rx_ring(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_vlan_rx_kill_vid':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2561:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2561 |         int err = -EOPNOTSUPP;
         |             ^~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_acquire_msix_vectors':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3187:13: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3187 |         int vector_threshold;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: At top level:
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4378:6: warning: no previous prototype for 'rnpgbevf_tx_ctxtdesc' [-Wmissing-prototypes]
    4378 | void rnpgbevf_tx_ctxtdesc(struct rnpgbevf_ring *tx_ring, u16 mss_seg_len,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4820:6: warning: no previous prototype for 'rnpgbevf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    4820 | void rnpgbevf_maybe_tx_ctxtdesc(struct rnpgbevf_ring *tx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4838:13: warning: no previous prototype for 'rnpgbevf_xmit_frame_ring' [-Wmissing-prototypes]
    4838 | netdev_tx_t rnpgbevf_xmit_frame_ring(struct sk_buff *skb,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:5311:6: warning: no previous prototype for 'rnpgbevf_assign_netdev_ops' [-Wmissing-prototypes]
    5311 | void rnpgbevf_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_request_msix_irqs':
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1978:44: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                            ^~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1978:34: note: directive argument in the range [0, 65535]
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ^~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1977:25: note: 'snprintf' output between 10 and 29 bytes into a destination of size 24
    1977 |                         snprintf(q_vector->name, sizeof(q_vector->name) - 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1979 |                                  q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~


vim +/rnpgbevf_addr_list_itr +488 drivers/net/ethernet/mucse/rnpgbevf/vf.c

   487	
 > 488	u8 *rnpgbevf_addr_list_itr(struct rnpgbevf_hw __maybe_unused *hw,
   489				   u8 **mc_addr_ptr)
   490	{
   491		struct netdev_hw_addr *mc_ptr;
   492		u8 *addr = *mc_addr_ptr;
   493	
   494		mc_ptr = container_of(addr, struct netdev_hw_addr, addr[0]);
   495		if (mc_ptr->list.next) {
   496			struct netdev_hw_addr *ha;
   497	
   498			ha = list_entry(mc_ptr->list.next, struct netdev_hw_addr, list);
   499			*mc_addr_ptr = ha->addr;
   500		} else {
   501			*mc_addr_ptr = NULL;
   502		}
   503	
   504		return addr;
   505	}
   506	
   507	/**
   508	 *  rnpgbevf_update_mc_addr_list_vf - Update Multicast addresses
   509	 *  @hw: pointer to the HW structure
   510	 *  @netdev: pointer to net device structure
   511	 *
   512	 *  Updates the Multicast Table Array.
   513	 **/
   514	static s32 rnpgbevf_update_mc_addr_list_vf(struct rnpgbevf_hw *hw,
   515						   struct net_device *netdev)
   516	{
   517		struct netdev_hw_addr *ha;
   518		u32 msgbuf[RNPGBE_VFMAILBOX_SIZE];
   519		u16 *vector_list = (u16 *)&msgbuf[1];
   520		u32 cnt, i;
   521		int addr_count = 0;
   522		u8 *addr_list = NULL;
   523	
   524		/* Each entry in the list uses 1 16 bit word.  We have 30
   525		 * 16 bit words available in our HW msg buffer (minus 1 for the
   526		 * msg type).  That's 30 hash values if we pack 'em right.  If
   527		 * there are more than 30 MC addresses to add then punt the
   528		 * extras for now and then add code to handle more than 30 later.
   529		 * It would be unusual for a server to request that many multi-cast
   530		 * addresses except for in large enterprise network environments.
   531		 */
   532	
   533		cnt = netdev_mc_count(netdev);
   534		if (cnt > 30)
   535			cnt = 30;
   536		msgbuf[0] = RNPGBE_VF_SET_MULTICAST;
   537		msgbuf[0] |= cnt << RNPGBE_VT_MSGINFO_SHIFT;
   538	
   539		addr_count = netdev_mc_count(netdev);
   540	
   541		ha = list_first_entry(&netdev->mc.list, struct netdev_hw_addr, list);
   542		addr_list = ha->addr;
   543		for (i = 0; i < addr_count; i++) {
   544			vector_list[i] = rnpgbevf_mta_vector(hw,
   545					rnpgbevf_addr_list_itr(hw, &addr_list));
   546		}
   547	
   548		rnpgbevf_write_msg_read_ack(hw, msgbuf, RNPGBE_VFMAILBOX_SIZE);
   549	
   550		return 0;
   551	}
   552	
   553	/**
   554	 *  rnpgbevf_set_vfta_vf - Set/Unset vlan filter table address
   555	 *  @hw: pointer to the HW structure
   556	 *  @vlan: 12 bit VLAN ID
   557	 *  @vind: unused by VF drivers
   558	 *  @vlan_on: if true then set bit, else clear bit
   559	 **/
   560	static s32 rnpgbevf_set_vfta_vf(struct rnpgbevf_hw *hw, u32 vlan, u32 vind,
   561					bool vlan_on)
   562	{
   563		struct rnp_mbx_info *mbx = &hw->mbx;
   564		u32 msgbuf[2];
   565		s32 err;
   566	
   567		msgbuf[0] = RNPGBE_VF_SET_VLAN;
   568		msgbuf[1] = vlan;
   569		/* Setting the 8 bit field MSG INFO to TRUE indicates "add" */
   570		msgbuf[0] |= vlan_on << RNPGBE_VT_MSGINFO_SHIFT;
   571	
   572		err = mbx->ops.write_posted(hw, msgbuf, 2, false);
   573		if (err)
   574			goto mbx_err;
   575	
   576		err = mbx->ops.read_posted(hw, msgbuf, 2, false);
   577		if (err)
   578			goto mbx_err;
   579	
   580		/* remove extra bits from the message */
   581		msgbuf[0] &= ~RNPGBE_VT_MSGTYPE_CTS;
   582		msgbuf[0] &= ~(0xFF << RNPGBE_VT_MSGINFO_SHIFT);
   583	
   584		if (msgbuf[0] != (RNPGBE_VF_SET_VLAN | RNPGBE_VT_MSGTYPE_ACK))
   585			err = RNPGBE_ERR_INVALID_ARGUMENT;
   586	
   587	mbx_err:
   588		return err;
   589	}
   590	
   591	static s32 rnpgbevf_set_vlan_strip(struct rnpgbevf_hw *hw, bool vlan_on)
   592	{
   593		struct rnp_mbx_info *mbx = &hw->mbx;
   594		struct rnpgbevf_adapter *adapter = (struct rnpgbevf_adapter *)hw->back;
   595		u32 msgbuf[4];
   596		s32 err;
   597		int i;
   598	
   599		if (adapter->num_rx_queues > 2) {
   600			err = -EINVAL;
   601			goto mbx_err;
   602		}
   603	
   604		msgbuf[0] = RNPGBE_VF_SET_VLAN_STRIP;
   605		msgbuf[1] = (vlan_on << 31) | adapter->num_rx_queues;
   606	
   607		for (i = 0; i < adapter->num_rx_queues; i++)
   608			msgbuf[2 + i] = adapter->rx_ring[i]->rnpgbevf_queue_idx;
   609	
   610		err = mbx->ops.write_posted(hw, msgbuf, 2 + adapter->num_rx_queues,
   611					    false);
   612		if (err)
   613			goto mbx_err;
   614	
   615		err = mbx->ops.read_posted(hw, msgbuf, 1, false);
   616		if (err)
   617			goto mbx_err;
   618	
   619		/* remove extra bits from the message */
   620		msgbuf[0] &= ~RNPGBE_VT_MSGTYPE_CTS;
   621		msgbuf[0] &= ~(0xFF << RNPGBE_VT_MSGINFO_SHIFT);
   622	
   623		if (msgbuf[0] != (RNPGBE_VF_SET_VLAN_STRIP | RNPGBE_VT_MSGTYPE_ACK))
   624			err = RNPGBE_ERR_INVALID_ARGUMENT;
   625	
   626	mbx_err:
   627		return err;
   628	}
   629	
   630	/**
   631	 *  rnpgbevf_setup_mac_link_vf - Setup MAC link settings
   632	 *  @hw: pointer to hardware structure
   633	 *  @speed: Unused in this implementation
   634	 *  @autoneg: Unused in this implementation
   635	 *  @autoneg_wait_to_complete: Unused in this implementation
   636	 *
   637	 *  Do nothing and return success.  VF drivers are not allowed to change
   638	 *  global settings.  Maintained for driver compatibility.
   639	 **/
   640	static s32 rnpgbevf_setup_mac_link_vf(struct rnpgbevf_hw *hw,
   641					      rnp_link_speed speed, bool autoneg,
   642					      bool autoneg_wait_to_complete)
   643	{
   644		return 0;
   645	}
   646	
   647	/**
   648	 *  rnpgbevf_check_mac_link_vf - Get link/speed status
   649	 *  @hw: pointer to hardware structure
   650	 *  @speed: pointer to link speed
   651	 *  @link_up: true is link is up, false otherwise
   652	 *  @autoneg_wait_to_complete: true when waiting for completion is needed
   653	 *
   654	 *  Reads the links register to determine if link is up and the current speed
   655	 **/
   656	static s32 rnpgbevf_check_mac_link_vf(struct rnpgbevf_hw *hw,
   657					      rnp_link_speed *speed, bool *link_up,
   658					      bool autoneg_wait_to_complete)
   659	{
   660		*speed = hw->speed;
   661		*link_up = hw->link;
   662	
   663		return 0;
   664	}
   665	
   666	/**
   667	 *  rnpgbevf_rlpml_set_vf - Set the maximum receive packet length
   668	 *  @hw: pointer to the HW structure
   669	 *  @max_size: value to assign to max frame size
   670	 **/
   671	void rnpgbevf_rlpml_set_vf(struct rnpgbevf_hw *hw, u16 max_size)
   672	{
   673		u32 msgbuf[2];
   674	
   675		msgbuf[0] = RNPGBE_VF_SET_LPE;
   676		msgbuf[1] = max_size;
   677		rnpgbevf_write_msg_read_ack(hw, msgbuf, 2);
   678	}
   679	
   680	/**
   681	 *  rnpgbevf_negotiate_api_version - Negotiate supported API version
   682	 *  @hw: pointer to the HW structure
   683	 *  @api: integer containing requested API version
   684	 **/
 > 685	int rnpgbevf_negotiate_api_version(struct rnpgbevf_hw *hw, int api)
   686	{
   687		return 0;
   688	}
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
