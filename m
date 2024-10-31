Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504413D245
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 05:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730352120; cv=none; b=jjEfKaWIFx2S8hgrO3V7aTtdLqy4NaqFh6udcXMuMUMRmUjDRpDkT1O8/nNAi61cL7sphw/ExYGTnAQ0kEryyZMk5oRfE18UjeasKKeq9eY/hbdNBgk9XPSyIyMFoNW9wqThi9RhCjodvU0jWg51mmehhP2VBYoN/SecjedQhQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730352120; c=relaxed/simple;
	bh=VIQLDewGnYuWAigOB1qlJMA57VgkuAWoshI2ILCH/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oaHLGLReXmJS/tu2YGtvpASv2ZI6FuEGH6W8nLE5KVxl897co1HUQjRkWNRzqG9/HalZRN3oBr1OuxLrMQrCIJiAEkUxsOK2j6Rl3YHaiZeq5AgCWMzO65xRQq9cOQahEXF3jIDyHPv0vTu4uujQeIOBgsDKmLJGeiSWnjleNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiC9HNft; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiC9HNft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730352117; x=1761888117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIQLDewGnYuWAigOB1qlJMA57VgkuAWoshI2ILCH/jA=;
  b=hiC9HNft3ri9ztKETefd7MczjCpPrM7ADvJVL/m5AE7ex8aBj/wCe8vH
   EwI5hT5klKLVp259fvkEiKOO5pmbyNJPKo3lmMeWZJm3cTEUiAdgxw9e9
   X3PcXuj03fKFvt+jXFgNqQya2OJjosB1KGwTA17C1GQ2jqwPExFt6omP3
   JU1dgiStS5/UxoYl95jHY0SjIeRGpcEiGA3TfZbHSXScbBXQErv8AA0NX
   MEjRdfHFTNhDgrx2CElQqqEAm+MHSxzttNd+uHiuYol+s+xrJM9a7UY0y
   gHMIDJ+1gCBRPwysVh4195kBTLfBFa48fp1ankP1qRjrauZifJ4nKUSjk
   w==;
X-CSE-ConnectionGUID: 7rtFuaf7RJKiH56LMvebgA==
X-CSE-MsgGUID: m+JGDZwZRe+CFvZ+xKbfig==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41444299"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="41444299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 22:21:56 -0700
X-CSE-ConnectionGUID: 3qikBba2Tkq4TjQUeBm6CA==
X-CSE-MsgGUID: f3wCGTDiR0669b9uCFFwCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87123430"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 22:21:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Nd3-000fhe-0Y;
	Thu, 31 Oct 2024 05:21:53 +0000
Date: Thu, 31 Oct 2024 13:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 12950/30000]
 drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:263:5: warning: no previous
 prototype for 'txgbe_read_v2p_mailbox'
Message-ID: <202410311329.lKBVIwUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ef5d1e35e964c2582be72addba582d0529ec73c7
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [12950/30000] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-002-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311329.lKBVIwUs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311329.lKBVIwUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311329.lKBVIwUs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:25:
   drivers/net/ethernet/netswift/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/netswift/txgbe/txgbe.h:927:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     927 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c: At top level:
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:132:5: warning: no previous prototype for 'txgbe_poll_for_msg' [-Wmissing-prototypes]
     132 | int txgbe_poll_for_msg(struct txgbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:162:5: warning: no previous prototype for 'txgbe_poll_for_ack' [-Wmissing-prototypes]
     162 | int txgbe_poll_for_ack(struct txgbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:263:5: warning: no previous prototype for 'txgbe_read_v2p_mailbox' [-Wmissing-prototypes]
     263 | u32 txgbe_read_v2p_mailbox(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:284:5: warning: no previous prototype for 'txgbe_check_for_bit_vf' [-Wmissing-prototypes]
     284 | int txgbe_check_for_bit_vf(struct txgbe_hw *hw, u32 mask)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:300:5: warning: no previous prototype for 'txgbe_check_for_msg_vf' [-Wmissing-prototypes]
     300 | int txgbe_check_for_msg_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:320:5: warning: no previous prototype for 'txgbe_check_for_ack_vf' [-Wmissing-prototypes]
     320 | int txgbe_check_for_ack_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:340:5: warning: no previous prototype for 'txgbe_check_for_rst_vf' [-Wmissing-prototypes]
     340 | int txgbe_check_for_rst_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:359:5: warning: no previous prototype for 'txgbe_obtain_mbx_lock_vf' [-Wmissing-prototypes]
     359 | int txgbe_obtain_mbx_lock_vf(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:387:5: warning: no previous prototype for 'txgbe_write_mbx_vf' [-Wmissing-prototypes]
     387 | int txgbe_write_mbx_vf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:425:5: warning: no previous prototype for 'txgbe_read_mbx_vf' [-Wmissing-prototypes]
     425 | int txgbe_read_mbx_vf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:483:5: warning: no previous prototype for 'txgbe_check_for_bit_pf' [-Wmissing-prototypes]
     483 | int txgbe_check_for_bit_pf(struct txgbe_hw *hw, u32 mask, int index)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:503:5: warning: no previous prototype for 'txgbe_check_for_msg_pf' [-Wmissing-prototypes]
     503 | int txgbe_check_for_msg_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:525:5: warning: no previous prototype for 'txgbe_check_for_ack_pf' [-Wmissing-prototypes]
     525 | int txgbe_check_for_ack_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:547:5: warning: no previous prototype for 'txgbe_check_for_rst_pf' [-Wmissing-prototypes]
     547 | int txgbe_check_for_rst_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:572:5: warning: no previous prototype for 'txgbe_obtain_mbx_lock_pf' [-Wmissing-prototypes]
     572 | int txgbe_obtain_mbx_lock_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:601:5: warning: no previous prototype for 'txgbe_write_mbx_pf' [-Wmissing-prototypes]
     601 | int txgbe_write_mbx_pf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:644:5: warning: no previous prototype for 'txgbe_read_mbx_pf' [-Wmissing-prototypes]
     644 | int txgbe_read_mbx_pf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_bp.h:22,
                    from drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:19:
   drivers/net/ethernet/netswift/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/netswift/txgbe/txgbe.h:927:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     927 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c: At top level:
>> drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:450:5: warning: no previous prototype for 'read_phy_lane_txeq' [-Wmissing-prototypes]
     450 | int read_phy_lane_txeq(unsigned short lane, struct txgbe_adapter *adapter, int post_t, int mode)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:513:5: warning: no previous prototype for 'en_cl72_krtr' [-Wmissing-prototypes]
     513 | int en_cl72_krtr(unsigned int enable, struct txgbe_adapter *adapter)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:567:5: warning: no previous prototype for 'chk_cl72_krtr_status' [-Wmissing-prototypes]
     567 | int chk_cl72_krtr_status(struct txgbe_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_phy.h:28,
                    from drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:27:
   drivers/net/ethernet/netswift/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/netswift/txgbe/txgbe.h:927:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     927 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c: At top level:
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1004:6: warning: no previous prototype for 'txgbe_add_uc_addr' [-Wmissing-prototypes]
    1004 | void txgbe_add_uc_addr(struct txgbe_hw *hw, u8 *addr, u32 vmdq)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1138:6: warning: no previous prototype for 'txgbe_set_mta' [-Wmissing-prototypes]
    1138 | void txgbe_set_mta(struct txgbe_hw *hw, u8 *mc_addr)
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2707:5: warning: no previous prototype for 'txgbe_setup_mac_link_hostif' [-Wmissing-prototypes]
    2707 | s32 txgbe_setup_mac_link_hostif(struct txgbe_hw *hw, u32 speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2744:5: warning: no previous prototype for 'txgbe_crc16_ccitt' [-Wmissing-prototypes]
    2744 | u16 txgbe_crc16_ccitt(const u8 *buf, int size)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2853:4: warning: no previous prototype for 'fmgr_cmd_op' [-Wmissing-prototypes]
    2853 | u8 fmgr_cmd_op(struct txgbe_hw *hw, u32 cmd, u32 cmd_addr)
         |    ^~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2874:4: warning: no previous prototype for 'fmgr_usr_cmd_op' [-Wmissing-prototypes]
    2874 | u8 fmgr_usr_cmd_op(struct txgbe_hw *hw, u32 usr_cmd)
         |    ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2884:4: warning: no previous prototype for 'flash_erase_chip' [-Wmissing-prototypes]
    2884 | u8 flash_erase_chip(struct txgbe_hw *hw)
         |    ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2890:4: warning: no previous prototype for 'flash_erase_sector' [-Wmissing-prototypes]
    2890 | u8 flash_erase_sector(struct txgbe_hw *hw, u32 sec_addr)
         |    ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2897:5: warning: no previous prototype for 'flash_read_dword' [-Wmissing-prototypes]
    2897 | u32 flash_read_dword(struct txgbe_hw *hw, u32 addr)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2907:4: warning: no previous prototype for 'flash_write_dword' [-Wmissing-prototypes]
    2907 | u8 flash_write_dword(struct txgbe_hw *hw, u32 addr, u32 dword)
         |    ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2922:5: warning: no previous prototype for 'txgbe_flash_write_cab' [-Wmissing-prototypes]
    2922 | int txgbe_flash_write_cab(struct txgbe_hw *hw, u32 addr, u32 value, u16 lan_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2944:5: warning: no previous prototype for 'txgbe_flash_read_cab' [-Wmissing-prototypes]
    2944 | int txgbe_flash_read_cab(struct txgbe_hw *hw, u32 addr, u16 lan_id)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2975:5: warning: no previous prototype for 'txgbe_flash_write_unlock' [-Wmissing-prototypes]
    2975 | int txgbe_flash_write_unlock(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2998:5: warning: no previous prototype for 'txgbe_flash_write_lock' [-Wmissing-prototypes]
    2998 | int txgbe_flash_write_lock(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4396:5: warning: no previous prototype for 'txgbe_enable_rx_adapter' [-Wmissing-prototypes]
    4396 | s32 txgbe_enable_rx_adapter(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4417:5: warning: no previous prototype for 'txgbe_set_sgmii_an37_ability' [-Wmissing-prototypes]
    4417 | s32 txgbe_set_sgmii_an37_ability(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4963:5: warning: no previous prototype for 'txgbe_set_link_to_sfi' [-Wmissing-prototypes]
    4963 | s32 txgbe_set_link_to_sfi(struct txgbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:5345:5: warning: no previous prototype for 'txgbe_reset_misc' [-Wmissing-prototypes]
    5345 | int txgbe_reset_misc(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6593:5: warning: no previous prototype for 'txgbe_read_ee_hostif_data' [-Wmissing-prototypes]
    6593 | s32 txgbe_read_ee_hostif_data(struct txgbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6737:5: warning: no previous prototype for 'txgbe_write_ee_hostif_data' [-Wmissing-prototypes]
    6737 | s32 txgbe_write_ee_hostif_data(struct txgbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3188:17: warning: 'txgbe_emc_therm_limit' defined but not used [-Wunused-const-variable=]
    3188 | STATIC const u8 txgbe_emc_therm_limit[4] = {
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3182:17: warning: 'txgbe_emc_temp_data' defined but not used [-Wunused-const-variable=]
    3182 | STATIC const u8 txgbe_emc_temp_data[4] = {
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/txgbe_read_v2p_mailbox +263 drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c

   255	
   256	/**
   257	 *  txgbe_read_v2p_mailbox - read v2p mailbox
   258	 *  @hw: pointer to the HW structure
   259	 *
   260	 *  This function is used to read the v2p mailbox without losing the read to
   261	 *  clear status bits.
   262	 **/
 > 263	u32 txgbe_read_v2p_mailbox(struct txgbe_hw *hw)
   264	{
   265		u32 v2p_mailbox = rd32(hw, TXGBE_VXMAILBOX);
   266	
   267		v2p_mailbox |= hw->mbx.v2p_mailbox;
   268		/* read and clear mirrored mailbox flags */
   269		v2p_mailbox |= rd32a(hw, TXGBE_VXMBMEM, TXGBE_VXMAILBOX_SIZE);
   270		wr32a(hw, TXGBE_VXMBMEM, TXGBE_VXMAILBOX_SIZE, 0);
   271		hw->mbx.v2p_mailbox |= v2p_mailbox & TXGBE_VXMAILBOX_R2C_BITS;
   272	
   273		return v2p_mailbox;
   274	}
   275	
   276	/**
   277	 *  txgbe_check_for_bit_vf - Determine if a status bit was set
   278	 *  @hw: pointer to the HW structure
   279	 *  @mask: bitmask for bits to be tested and cleared
   280	 *
   281	 *  This function is used to check for the read to clear bits within
   282	 *  the V2P mailbox.
   283	 **/
 > 284	int txgbe_check_for_bit_vf(struct txgbe_hw *hw, u32 mask)
   285	{
   286		u32 mailbox = txgbe_read_v2p_mailbox(hw);
   287	
   288		hw->mbx.v2p_mailbox &= ~mask;
   289	
   290		return (mailbox & mask ? 0 : TXGBE_ERR_MBX);
   291	}
   292	
   293	/**
   294	 *  txgbe_check_for_msg_vf - checks to see if the PF has sent mail
   295	 *  @hw: pointer to the HW structure
   296	 *  @mbx_id: id of mailbox to check
   297	 *
   298	 *  returns SUCCESS if the PF has set the Status bit or else ERR_MBX
   299	 **/
 > 300	int txgbe_check_for_msg_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
   301	{
   302		int err = TXGBE_ERR_MBX;
   303	
   304		/* read clear the pf sts bit */
   305		if (!txgbe_check_for_bit_vf(hw, TXGBE_VXMAILBOX_PFSTS)) {
   306			err = 0;
   307			hw->mbx.stats.reqs++;
   308		}
   309	
   310		return err;
   311	}
   312	
   313	/**
   314	 *  txgbe_check_for_ack_vf - checks to see if the PF has ACK'd
   315	 *  @hw: pointer to the HW structure
   316	 *  @mbx_id: id of mailbox to check
   317	 *
   318	 *  returns SUCCESS if the PF has set the ACK bit or else ERR_MBX
   319	 **/
 > 320	int txgbe_check_for_ack_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
   321	{
   322		int err = TXGBE_ERR_MBX;
   323	
   324		/* read clear the pf ack bit */
   325		if (!txgbe_check_for_bit_vf(hw, TXGBE_VXMAILBOX_PFACK)) {
   326			err = 0;
   327			hw->mbx.stats.acks++;
   328		}
   329	
   330		return err;
   331	}
   332	
   333	/**
   334	 *  txgbe_check_for_rst_vf - checks to see if the PF has reset
   335	 *  @hw: pointer to the HW structure
   336	 *  @mbx_id: id of mailbox to check
   337	 *
   338	 *  returns true if the PF has set the reset done bit or else false
   339	 **/
 > 340	int txgbe_check_for_rst_vf(struct txgbe_hw *hw, u16 __always_unused mbx_id)
   341	{
   342		int err = TXGBE_ERR_MBX;
   343	
   344		if (!txgbe_check_for_bit_vf(hw, (TXGBE_VXMAILBOX_RSTD |
   345		    TXGBE_VXMAILBOX_RSTI))) {
   346			err = 0;
   347			hw->mbx.stats.rsts++;
   348		}
   349	
   350		return err;
   351	}
   352	
   353	/**
   354	 *  txgbe_obtain_mbx_lock_vf - obtain mailbox lock
   355	 *  @hw: pointer to the HW structure
   356	 *
   357	 *  return SUCCESS if we obtained the mailbox lock
   358	 **/
 > 359	int txgbe_obtain_mbx_lock_vf(struct txgbe_hw *hw)
   360	{
   361		int err = TXGBE_ERR_MBX;
   362		u32 mailbox;
   363	
   364		/* Take ownership of the buffer */
   365		wr32(hw, TXGBE_VXMAILBOX, TXGBE_VXMAILBOX_VFU);
   366	
   367		/* reserve mailbox for vf use */
   368		mailbox = txgbe_read_v2p_mailbox(hw);
   369		if (mailbox & TXGBE_VXMAILBOX_VFU)
   370			err = 0;
   371		else
   372			ERROR_REPORT2(TXGBE_ERROR_POLLING,
   373				   "Failed to obtain mailbox lock for VF");
   374	
   375		return err;
   376	}
   377	
   378	/**
   379	 *  txgbe_write_mbx_vf - Write a message to the mailbox
   380	 *  @hw: pointer to the HW structure
   381	 *  @msg: The message buffer
   382	 *  @size: Length of buffer
   383	 *  @mbx_id: id of mailbox to write
   384	 *
   385	 *  returns SUCCESS if it successfully copied message into the buffer
   386	 **/
 > 387	int txgbe_write_mbx_vf(struct txgbe_hw *hw, u32 *msg, u16 size,
   388				      u16 __always_unused mbx_id)
   389	{
   390		int err;
   391		u16 i;
   392	
   393		/* lock the mailbox to prevent pf/vf race condition */
   394		err = txgbe_obtain_mbx_lock_vf(hw);
   395		if (err)
   396			goto out_no_write;
   397	
   398		/* flush msg and acks as we are overwriting the message buffer */
   399		txgbe_check_for_msg_vf(hw, 0);
   400		txgbe_check_for_ack_vf(hw, 0);
   401	
   402		/* copy the caller specified message to the mailbox memory buffer */
   403		for (i = 0; i < size; i++)
   404			wr32a(hw, TXGBE_VXMBMEM, i, msg[i]);
   405	
   406		/* update stats */
   407		hw->mbx.stats.msgs_tx++;
   408	
   409		/* Drop VFU and interrupt the PF to tell it a message has been sent */
   410		wr32(hw, TXGBE_VXMAILBOX, TXGBE_VXMAILBOX_REQ);
   411	
   412	out_no_write:
   413		return err;
   414	}
   415	
   416	/**
   417	 *  txgbe_read_mbx_vf - Reads a message from the inbox intended for vf
   418	 *  @hw: pointer to the HW structure
   419	 *  @msg: The message buffer
   420	 *  @size: Length of buffer
   421	 *  @mbx_id: id of mailbox to read
   422	 *
   423	 *  returns SUCCESS if it successfully read message from buffer
   424	 **/
 > 425	int txgbe_read_mbx_vf(struct txgbe_hw *hw, u32 *msg, u16 size,
   426				     u16 __always_unused mbx_id)
   427	{
   428		int err = 0;
   429		u16 i;
   430	
   431		/* lock the mailbox to prevent pf/vf race condition */
   432		err = txgbe_obtain_mbx_lock_vf(hw);
   433		if (err)
   434			goto out_no_read;
   435	
   436		/* copy the message from the mailbox memory buffer */
   437		for (i = 0; i < size; i++)
   438			msg[i] = rd32a(hw, TXGBE_VXMBMEM, i);
   439	
   440		/* Acknowledge receipt and release mailbox, then we're done */
   441		wr32(hw, TXGBE_VXMAILBOX, TXGBE_VXMAILBOX_ACK);
   442	
   443		/* update stats */
   444		hw->mbx.stats.msgs_rx++;
   445	
   446	out_no_read:
   447		return err;
   448	}
   449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
