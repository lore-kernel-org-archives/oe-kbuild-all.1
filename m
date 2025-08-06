Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9CA28BAB6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484002; cv=none; b=Im/kFrJ3AuG2DpO8Pe5+CJEVDQvWgYxbFDJ0DIKzy9KUKy+pDn05lThARGLpYadQZSq14DJ+ZRdnMzwXmTq7k36TAUZ57kyrU/ECNB76EPSIgZ6PlnaHHbQVcasNHjiiQgsAFU8QjZ6Y8i6arMFeG6gN184OgBgeFTBBAMow4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484002; c=relaxed/simple;
	bh=56y3mPq01yeU9xzFUwIFuiGLPeD5TbxDwbuL4CoYeDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+pzOzCNqQkGOeeWJJuLcr9Pb3FkQuNCDjFRxlfhamY3D9TK+aUOdwEWn+t1Y7bHXwB0lB732M8qMCOzxEmO4WVSfpvLQibDLmb6vXuWzplhAH9dt0Y90GcX3RdULyGah/Jmu1EM4yzkhx2wtPBL38aab2JkCB2IW34bwjHe06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qajqb1ma; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qajqb1ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754483999; x=1786019999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56y3mPq01yeU9xzFUwIFuiGLPeD5TbxDwbuL4CoYeDY=;
  b=Qajqb1manFAu//LLcp4HFVxI2UlICUeihxKckNvp9IyYHgC1uNwp1ucE
   rWhnlvmJDnu7gmDQFz5Bp6swFaUFUQQ2F6bcesqJFMlGFf3gwMiGWXwso
   Rt9UXv775Aa/7j/ZQpM+M0l+ih/SNlRbd2y5bHEGzLwjc9tIMMJjkXbpI
   t++oV+A5t07Jp1RSX0pWeY5WNWTGw19sh9BA41Hknew3G85M+P+xxZOSj
   vKuDddGgrG+v5bjdIi7FXEWL45GblC9eB/kiLgBrAx3KeEfh7CRLn7UZ5
   G5alUMxlxOrBY3vTaqlqxa8K5XXHKNaA1aBquS8+20fYxLvaiCK04O07r
   w==;
X-CSE-ConnectionGUID: BBFFZMnbRHSmLqIadAwvYA==
X-CSE-MsgGUID: NebGcamySRGZYQ2coMMKAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82245298"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="82245298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 05:39:58 -0700
X-CSE-ConnectionGUID: 2Amlwj3rTSK9Ror4WlwjbA==
X-CSE-MsgGUID: h8d7IDbRRmuL2e3+F9J+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="188431490"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2025 05:39:57 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujdQw-0002Cl-2P;
	Wed, 06 Aug 2025 12:39:54 +0000
Date: Wed, 6 Aug 2025 14:39:01 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3106/3106]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:752:6: warning: no previous
 prototype for 'ngbe_add_uc_addr'
Message-ID: <202508061443.vbBAmdyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a8c621aa031669a6835da1431d9765e3bbbc3621
commit: a5961b4bc6ce09a70902686ecc848a47493a9251 [3106/3106] openeuler: net: ngbe: add ngbe module support
config: x86_64-buildonly-randconfig-2003-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061443.vbBAmdyk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061443.vbBAmdyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061443.vbBAmdyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_phy.h:8,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:6:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:752:6: warning: no previous prototype for 'ngbe_add_uc_addr' [-Wmissing-prototypes]
     752 | void ngbe_add_uc_addr(struct ngbe_hw *hw, u8 *addr, u32 vmdq)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:885:6: warning: no previous prototype for 'ngbe_set_mta' [-Wmissing-prototypes]
     885 | void ngbe_set_mta(struct ngbe_hw *hw, u8 *mc_addr)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1889:5: warning: no previous prototype for 'ngbe_host_interface_pass_command' [-Wmissing-prototypes]
    1889 | s32 ngbe_host_interface_pass_command(struct ngbe_hw *hw, u32 *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2186:5: warning: no previous prototype for 'ngbe_setup_mac_link_hostif' [-Wmissing-prototypes]
    2186 | s32 ngbe_setup_mac_link_hostif(struct ngbe_hw *hw, u32 speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2222:5: warning: no previous prototype for 'ngbe_crc16_ccitt' [-Wmissing-prototypes]
    2222 | u16 ngbe_crc16_ccitt(const u8 *buf, int size)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2339:4: warning: no previous prototype for 'fmgr_cmd_op' [-Wmissing-prototypes]
    2339 | u8 fmgr_cmd_op(struct ngbe_hw *hw, u32 cmd, u32 cmd_addr)
         |    ^~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2360:4: warning: no previous prototype for 'fmgr_usr_cmd_op' [-Wmissing-prototypes]
    2360 | u8 fmgr_usr_cmd_op(struct ngbe_hw *hw, u32 usr_cmd)
         |    ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2370:4: warning: no previous prototype for 'flash_erase_chip' [-Wmissing-prototypes]
    2370 | u8 flash_erase_chip(struct ngbe_hw *hw)
         |    ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2376:4: warning: no previous prototype for 'flash_erase_sector' [-Wmissing-prototypes]
    2376 | u8 flash_erase_sector(struct ngbe_hw *hw, u32 sec_addr)
         |    ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2392:4: warning: no previous prototype for 'flash_write_dword' [-Wmissing-prototypes]
    2392 | u8 flash_write_dword(struct ngbe_hw *hw, u32 addr, u32 dword)
         |    ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3296:5: warning: no previous prototype for 'ngbe_get_copper_link_capabilities' [-Wmissing-prototypes]
    3296 | s32 ngbe_get_copper_link_capabilities(struct ngbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3456:5: warning: no previous prototype for 'ngbe_reset_misc' [-Wmissing-prototypes]
    3456 | int ngbe_reset_misc(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3910:5: warning: no previous prototype for 'ngbe_read_ee_hostif_data' [-Wmissing-prototypes]
    3910 | s32 ngbe_read_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3981:5: warning: no previous prototype for 'ngbe_phy_led_oem_chk' [-Wmissing-prototypes]
    3981 | s32 ngbe_phy_led_oem_chk(struct ngbe_hw *hw, u32 *data)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4163:5: warning: no previous prototype for 'ngbe_read_ee_hostif_data32' [-Wmissing-prototypes]
    4163 | s32 ngbe_read_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4225:5: warning: no previous prototype for 'ngbe_write_ee_hostif_data' [-Wmissing-prototypes]
    4225 | s32 ngbe_write_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4282:5: warning: no previous prototype for 'ngbe_write_ee_hostif_data32' [-Wmissing-prototypes]
    4282 | s32 ngbe_write_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2689:17: warning: 'ngbe_emc_therm_limit' defined but not used [-Wunused-const-variable=]
    2689 | static const u8 ngbe_emc_therm_limit[4] = {
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2682:17: warning: 'ngbe_emc_temp_data' defined but not used [-Wunused-const-variable=]
    2682 | static const u8 ngbe_emc_temp_data[4] = {
         |                 ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:5:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:113:5: warning: no previous prototype for 'ngbe_poll_for_msg' [-Wmissing-prototypes]
     113 | int ngbe_poll_for_msg(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:143:5: warning: no previous prototype for 'ngbe_poll_for_ack' [-Wmissing-prototypes]
     143 | int ngbe_poll_for_ack(struct ngbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:244:5: warning: no previous prototype for 'ngbe_read_v2p_mailbox' [-Wmissing-prototypes]
     244 | u32 ngbe_read_v2p_mailbox(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:262:5: warning: no previous prototype for 'ngbe_check_for_bit_vf' [-Wmissing-prototypes]
     262 | int ngbe_check_for_bit_vf(struct ngbe_hw *hw, u32 mask)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:278:5: warning: no previous prototype for 'ngbe_check_for_msg_vf' [-Wmissing-prototypes]
     278 | int ngbe_check_for_msg_vf(struct ngbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:298:5: warning: no previous prototype for 'ngbe_check_for_ack_vf' [-Wmissing-prototypes]
     298 | int ngbe_check_for_ack_vf(struct ngbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:318:5: warning: no previous prototype for 'ngbe_check_for_rst_vf' [-Wmissing-prototypes]
     318 | int ngbe_check_for_rst_vf(struct ngbe_hw *hw, u16 __always_unused mbx_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:337:5: warning: no previous prototype for 'ngbe_obtain_mbx_lock_vf' [-Wmissing-prototypes]
     337 | int ngbe_obtain_mbx_lock_vf(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:365:5: warning: no previous prototype for 'ngbe_write_mbx_vf' [-Wmissing-prototypes]
     365 | int ngbe_write_mbx_vf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:403:5: warning: no previous prototype for 'ngbe_read_mbx_vf' [-Wmissing-prototypes]
     403 | int ngbe_read_mbx_vf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:461:5: warning: no previous prototype for 'ngbe_check_for_bit_pf' [-Wmissing-prototypes]
     461 | int ngbe_check_for_bit_pf(struct ngbe_hw *hw, u32 mask)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:481:5: warning: no previous prototype for 'ngbe_check_for_msg_pf' [-Wmissing-prototypes]
     481 | int ngbe_check_for_msg_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:501:5: warning: no previous prototype for 'ngbe_check_for_ack_pf' [-Wmissing-prototypes]
     501 | int ngbe_check_for_ack_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:521:5: warning: no previous prototype for 'ngbe_check_for_rst_pf' [-Wmissing-prototypes]
     521 | int ngbe_check_for_rst_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:544:5: warning: no previous prototype for 'ngbe_obtain_mbx_lock_pf' [-Wmissing-prototypes]
     544 | int ngbe_obtain_mbx_lock_pf(struct ngbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:572:5: warning: no previous prototype for 'ngbe_write_mbx_pf' [-Wmissing-prototypes]
     572 | int ngbe_write_mbx_pf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_mbx.c:612:5: warning: no previous prototype for 'ngbe_read_mbx_pf' [-Wmissing-prototypes]
     612 | int ngbe_read_mbx_pf(struct ngbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_ptp.c:4:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_ptp.c: In function 'ngbe_ptp_check_pps_event':
>> drivers/net/ethernet/netswift/ngbe/ngbe_ptp.c:253:32: warning: variable 'event' set but not used [-Wunused-but-set-variable]
     253 |         struct ptp_clock_event event;
         |                                ^~~~~
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_phy.h:8,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:4:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_phy.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:16:6: warning: no previous prototype for 'ngbe_check_reset_blocked' [-Wmissing-prototypes]
      16 | bool ngbe_check_reset_blocked(struct ngbe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:33:5: warning: no previous prototype for 'ngbe_phy_read_reg' [-Wmissing-prototypes]
      33 | s32 ngbe_phy_read_reg(struct ngbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:56:5: warning: no previous prototype for 'ngbe_phy_write_reg' [-Wmissing-prototypes]
      56 | s32 ngbe_phy_write_reg(struct ngbe_hw *hw,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:74:5: warning: no previous prototype for 'ngbe_check_internal_phy_id' [-Wmissing-prototypes]
      74 | s32 ngbe_check_internal_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:273:5: warning: no previous prototype for 'ngbe_check_mdi_phy_id' [-Wmissing-prototypes]
     273 | s32 ngbe_check_mdi_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:337:6: warning: no previous prototype for 'ngbe_validate_phy_addr' [-Wmissing-prototypes]
     337 | bool ngbe_validate_phy_addr(struct ngbe_hw *hw, u32 phy_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:353:5: warning: no previous prototype for 'ngbe_check_yt_phy_id' [-Wmissing-prototypes]
     353 | s32 ngbe_check_yt_phy_id(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1242:5: warning: no previous prototype for 'ngbe_phy_get_advertised_pause' [-Wmissing-prototypes]
    1242 | s32 ngbe_phy_get_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1279:5: warning: no previous prototype for 'ngbe_phy_get_lp_advertised_pause' [-Wmissing-prototypes]
    1279 | s32 ngbe_phy_get_lp_advertised_pause(struct ngbe_hw *hw, u8 *pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1324:5: warning: no previous prototype for 'ngbe_phy_set_pause_advertisement' [-Wmissing-prototypes]
    1324 | s32 ngbe_phy_set_pause_advertisement(struct ngbe_hw *hw, u16 pause_bit)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_phy.c:1450:5: warning: no previous prototype for 'ngbe_phy_setup' [-Wmissing-prototypes]
    1450 | s32 ngbe_phy_setup(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:15:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:128:5: warning: no previous prototype for 'ngbe_get_link_ksettings' [-Wmissing-prototypes]
     128 | int ngbe_get_link_ksettings(struct net_device *netdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c: In function 'ngbe_set_link_ksettings':
>> drivers/net/ethernet/netswift/ngbe/ngbe_ethtool.c:318:25: warning: variable 'old' set but not used [-Wunused-but-set-variable]
     318 |         u32 advertised, old;
         |                         ^~~
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:23:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:741:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     741 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:139:6: warning: no previous prototype for 'ngbe_service_event_schedule' [-Wmissing-prototypes]
     139 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_tx_timeout':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:401:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     401 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3159:6: warning: no previous prototype for 'ngbe_configure_isb' [-Wmissing-prototypes]
    3159 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3173:6: warning: no previous prototype for 'ngbe_configure_port' [-Wmissing-prototypes]
    3173 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3529:6: warning: no previous prototype for 'ngbe_disable_device' [-Wmissing-prototypes]
    3529 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3644:5: warning: no previous prototype for 'ngbe_init_shared_code' [-Wmissing-prototypes]
    3644 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5791:5: warning: no previous prototype for 'ngbe_skb_pad_nonzero' [-Wmissing-prototypes]
    5791 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_mii_ioctl':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5989:20: warning: variable 'devad' set but not used [-Wunused-but-set-variable]
    5989 |         int prtad, devad, ret = 0;
         |                    ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5989:13: warning: variable 'prtad' set but not used [-Wunused-but-set-variable]
    5989 |         int prtad, devad, ret = 0;
         |             ^~~~~
--
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:602: warning: Function parameter or member 'pools' not described in 'ngbe_set_rar'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:602: warning: Excess function parameter 'vmdq' description in 'ngbe_set_rar'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:753: warning: Function parameter or member 'vmdq' not described in 'ngbe_add_uc_addr'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:886: warning: Function parameter or member 'mc_addr' not described in 'ngbe_set_mta'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:886: warning: Excess function parameter 'hash_value' description in 'ngbe_set_mta'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1505: warning: Function parameter or member 'pool' not described in 'ngbe_set_vmdq'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1505: warning: Excess function parameter 'vmdq' description in 'ngbe_set_vmdq'
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: warning: Function parameter or member 'hw' not described in 'fmgr_cmd_op'
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: warning: Function parameter or member 'cmd' not described in 'fmgr_cmd_op'
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: warning: Function parameter or member 'cmd_addr' not described in 'fmgr_cmd_op'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2703: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2710: warning: Excess function parameter 'data' description in 'ngbe_get_thermal_sensor_data'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3441: warning: Function parameter or member 'need_restart_AN' not described in 'ngbe_setup_copper_link'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3441: warning: Excess function parameter 'autoneg_wait_to_complete' description in 'ngbe_setup_copper_link'
--
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:226: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:398: warning: Function parameter or member 'txqueue' not described in 'ngbe_tx_timeout'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1608: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1608: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1997: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2389: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2856: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3684: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4267: warning: Function parameter or member 'pdev' not described in '__ngbe_shutdown'
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4267: warning: Function parameter or member 'enable_wake' not described in '__ngbe_shutdown'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4558: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4620: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4716: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4761: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4828: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4898: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4927: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4927: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6022: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6022: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6273: warning: Excess function parameter 'device_id' description in 'ngbe_wol_supported'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6273: warning: Excess function parameter 'subdev_id' description in 'ngbe_wol_supported'


vim +/ngbe_add_uc_addr +752 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c

   589	
   590	/**
   591	 *  ngbe_set_rar - Set Rx address register
   592	 *  @hw: pointer to hardware structure
   593	 *  @index: Receive address register to write
   594	 *  @addr: Address to put into receive address register
   595	 *  @vmdq: VMDq "set" or "pool" index
   596	 *  @enable_addr: set flag that address is active
   597	 *
   598	 *  Puts an ethernet address into a receive address register.
   599	 **/
   600	s32 ngbe_set_rar(struct ngbe_hw *hw, u32 index, u8 *addr, u64 pools,
   601				  u32 enable_addr)
 > 602	{
   603		u32 rar_low, rar_high;
   604		u32 rar_entries = hw->mac.num_rar_entries;
   605	
   606		/* Make sure we are using a valid rar index range */
   607		if (index >= rar_entries) {
   608			ERROR_REPORT2(NGBE_ERROR_ARGUMENT,
   609				     "RAR index %d is out of range.\n", index);
   610			return NGBE_ERR_INVALID_ARGUMENT;
   611		}
   612	
   613		/* select the MAC address */
   614		wr32(hw, NGBE_PSR_MAC_SWC_IDX, index);
   615	
   616		/* setup VMDq pool mapping */
   617		wr32(hw, NGBE_PSR_MAC_SWC_VM, pools & 0xFFFFFFFF);
   618	
   619		/* HW expects these in little endian so we reverse the byte
   620		 * order from network order (big endian) to little endian
   621		 *
   622		 * Some parts put the VMDq setting in the extra RAH bits,
   623		 * so save everything except the lower 16 bits that hold part
   624		 * of the address and the address valid bit.
   625		 */
   626		rar_low = ((u32)addr[5] |
   627			  ((u32)addr[4] << 8) |
   628			  ((u32)addr[3] << 16) |
   629			  ((u32)addr[2] << 24));
   630		rar_high = ((u32)addr[1] |
   631			   ((u32)addr[0] << 8));
   632		if (enable_addr != 0)
   633			rar_high |= NGBE_PSR_MAC_SWC_AD_H_AV;
   634	
   635		wr32(hw, NGBE_PSR_MAC_SWC_AD_L, rar_low);
   636		wr32m(hw, NGBE_PSR_MAC_SWC_AD_H,
   637			(NGBE_PSR_MAC_SWC_AD_H_AD(~0) |
   638			 NGBE_PSR_MAC_SWC_AD_H_ADTYPE(~0) |
   639			 NGBE_PSR_MAC_SWC_AD_H_AV),
   640			rar_high);
   641	
   642		return 0;
   643	}
   644	
   645	/**
   646	 *  ngbe_clear_rar - Remove Rx address register
   647	 *  @hw: pointer to hardware structure
   648	 *  @index: Receive address register to write
   649	 *
   650	 *  Clears an ethernet address from a receive address register.
   651	 **/
   652	s32 ngbe_clear_rar(struct ngbe_hw *hw, u32 index)
   653	{
   654		u32 rar_entries = hw->mac.num_rar_entries;
   655	
   656		/* Make sure we are using a valid rar index range */
   657		if (index >= rar_entries) {
   658			ERROR_REPORT2(NGBE_ERROR_ARGUMENT,
   659				     "RAR index %d is out of range.\n", index);
   660			return NGBE_ERR_INVALID_ARGUMENT;
   661		}
   662	
   663		/* Some parts put the VMDq setting in the extra RAH bits,
   664		 * so save everything except the lower 16 bits that hold part
   665		 * of the address and the address valid bit.
   666		 */
   667		wr32(hw, NGBE_PSR_MAC_SWC_IDX, index);
   668	
   669		wr32(hw, NGBE_PSR_MAC_SWC_VM, 0);
   670		wr32(hw, NGBE_PSR_MAC_SWC_AD_L, 0);
   671		wr32m(hw, NGBE_PSR_MAC_SWC_AD_H,
   672			(NGBE_PSR_MAC_SWC_AD_H_AD(~0) |
   673			 NGBE_PSR_MAC_SWC_AD_H_ADTYPE(~0) |
   674			 NGBE_PSR_MAC_SWC_AD_H_AV),
   675			0);
   676	
   677		return 0;
   678	}
   679	
   680	/**
   681	 *  ngbe_init_rx_addrs - Initializes receive address filters.
   682	 *  @hw: pointer to hardware structure
   683	 *
   684	 *  Places the MAC address in receive address register 0 and clears the rest
   685	 *  of the receive address registers. Clears the multicast table. Assumes
   686	 *  the receiver is in reset when the routine is called.
   687	 **/
   688	s32 ngbe_init_rx_addrs(struct ngbe_hw *hw)
   689	{
   690		u32 i;
   691		u32 rar_entries = hw->mac.num_rar_entries;
   692		u32 psrctl;
   693	
   694		/* If the current mac address is valid, assume it is a software override
   695		 * to the permanent address.
   696		 * Otherwise, use the permanent address from the eeprom.
   697		 */
   698		if (ngbe_validate_mac_addr(hw->mac.addr) ==
   699			NGBE_ERR_INVALID_MAC_ADDR) {
   700			/* Get the MAC address from the RAR0 for later reference */
   701			TCALL(hw, mac.ops.get_mac_addr, hw->mac.addr);
   702	
   703			DEBUGOUT3(" Keeping Current RAR0 Addr =%.2X %.2X %.2X %.2X %.2X %.2X\n",
   704				hw->mac.addr[0], hw->mac.addr[1],
   705				hw->mac.addr[2], hw->mac.addr[3],
   706				hw->mac.addr[4], hw->mac.addr[5]);
   707		} else {
   708			/* Setup the receive address. */
   709			DEBUGOUT("Overriding MAC Address in RAR[0]\n");
   710			DEBUGOUT3(" New MAC Addr =%.2X %.2X %.2X %.2X %.2X %.2X\n",
   711				hw->mac.addr[0], hw->mac.addr[1],
   712				hw->mac.addr[2], hw->mac.addr[3],
   713				hw->mac.addr[4], hw->mac.addr[5]);
   714	
   715			TCALL(hw, mac.ops.set_rar, 0, hw->mac.addr, 0,
   716				NGBE_PSR_MAC_SWC_AD_H_AV);
   717		}
   718		hw->addr_ctrl.overflow_promisc = 0;
   719	
   720		hw->addr_ctrl.rar_used_count = 1;
   721	
   722		/* Zero out the other receive addresses. */
   723		DEBUGOUT1("Clearing RAR[1-%d]\n", rar_entries - 1);
   724		for (i = 1; i < rar_entries; i++) {
   725			wr32(hw, NGBE_PSR_MAC_SWC_IDX, i);
   726			wr32(hw, NGBE_PSR_MAC_SWC_AD_L, 0);
   727			wr32(hw, NGBE_PSR_MAC_SWC_AD_H, 0);
   728		}
   729	
   730		/* Clear the MTA */
   731		hw->addr_ctrl.mta_in_use = 0;
   732		psrctl = rd32(hw, NGBE_PSR_CTL);
   733		psrctl &= ~(NGBE_PSR_CTL_MO | NGBE_PSR_CTL_MFE);
   734		psrctl |= hw->mac.mc_filter_type << NGBE_PSR_CTL_MO_SHIFT;
   735		wr32(hw, NGBE_PSR_CTL, psrctl);
   736		DEBUGOUT(" Clearing MTA\n");
   737		for (i = 0; i < hw->mac.mcft_size; i++)
   738			wr32(hw, NGBE_PSR_MC_TBL(i), 0);
   739	
   740		TCALL(hw, mac.ops.init_uta_tables);
   741	
   742		return 0;
   743	}
   744	
   745	/**
   746	 *  ngbe_add_uc_addr - Adds a secondary unicast address.
   747	 *  @hw: pointer to hardware structure
   748	 *  @addr: new address
   749	 *
   750	 *  Adds it to unused receive address register or goes into promiscuous mode.
   751	 **/
 > 752	void ngbe_add_uc_addr(struct ngbe_hw *hw, u8 *addr, u32 vmdq)
   753	{
   754		u32 rar_entries = hw->mac.num_rar_entries;
   755		u32 rar;
   756	
   757		DEBUGOUT6(" UC Addr = %.2X %.2X %.2X %.2X %.2X %.2X\n",
   758			  addr[0], addr[1], addr[2], addr[3], addr[4], addr[5]);
   759	
   760		/* Place this address in the RAR if there is room,
   761		 * else put the controller into promiscuous mode
   762		 */
   763		if (hw->addr_ctrl.rar_used_count < rar_entries) {
   764			rar = hw->addr_ctrl.rar_used_count;
   765			TCALL(hw, mac.ops.set_rar, rar, addr, vmdq,
   766				NGBE_PSR_MAC_SWC_AD_H_AV);
   767			DEBUGOUT1("Added a secondary address to RAR[%d]\n", rar);
   768			hw->addr_ctrl.rar_used_count++;
   769		} else {
   770			hw->addr_ctrl.overflow_promisc++;
   771		}
   772	}
   773	
   774	/**
   775	 *  ngbe_update_uc_addr_list - Updates MAC list of secondary addresses
   776	 *  @hw: pointer to hardware structure
   777	 *  @addr_list: the list of new addresses
   778	 *  @addr_count: number of addresses
   779	 *  @next: iterator function to walk the address list
   780	 *
   781	 *  The given list replaces any existing list.  Clears the secondary addrs from
   782	 *  receive address registers.  Uses unused receive address registers for the
   783	 *  first secondary addresses, and falls back to promiscuous mode as needed.
   784	 *
   785	 *  Drivers using secondary unicast addresses must set user_set_promisc when
   786	 *  manually putting the device into promiscuous mode.
   787	 **/
   788	s32 ngbe_update_uc_addr_list(struct ngbe_hw *hw, u8 *addr_list,
   789					      u32 addr_count, ngbe_mc_addr_itr next)
   790	{
   791		u8 *addr;
   792		u32 i;
   793		u32 old_promisc_setting = hw->addr_ctrl.overflow_promisc;
   794		u32 uc_addr_in_use;
   795		u32 vmdq;
   796	
   797		/* Clear accounting of old secondary address list,
   798		 * don't count RAR[0]
   799		 */
   800		uc_addr_in_use = hw->addr_ctrl.rar_used_count - 1;
   801		hw->addr_ctrl.rar_used_count -= uc_addr_in_use;
   802		hw->addr_ctrl.overflow_promisc = 0;
   803	
   804		/* Zero out the other receive addresses */
   805		DEBUGOUT1("Clearing RAR[1-%d]\n", uc_addr_in_use + 1);
   806		for (i = 0; i < uc_addr_in_use; i++) {
   807			wr32(hw, NGBE_PSR_MAC_SWC_IDX, 1 + i);
   808			wr32(hw, NGBE_PSR_MAC_SWC_AD_L, 0);
   809			wr32(hw, NGBE_PSR_MAC_SWC_AD_H, 0);
   810		}
   811	
   812		/* Add the new addresses */
   813		for (i = 0; i < addr_count; i++) {
   814			DEBUGOUT(" Adding the secondary addresses:\n");
   815			addr = next(hw, &addr_list, &vmdq);
   816			ngbe_add_uc_addr(hw, addr, vmdq);
   817		}
   818	
   819		if (hw->addr_ctrl.overflow_promisc) {
   820			/* enable promisc if not already in overflow or set by user */
   821			if (!old_promisc_setting && !hw->addr_ctrl.user_set_promisc) {
   822				DEBUGOUT(" Entering address overflow promisc mode\n");
   823				wr32m(hw, NGBE_PSR_CTL,
   824					NGBE_PSR_CTL_UPE, NGBE_PSR_CTL_UPE);
   825			}
   826		} else {
   827			/* only disable if set by overflow, not by user */
   828			if (old_promisc_setting && !hw->addr_ctrl.user_set_promisc) {
   829				DEBUGOUT(" Leaving address overflow promisc mode\n");
   830				wr32m(hw, NGBE_PSR_CTL,
   831					NGBE_PSR_CTL_UPE, 0);
   832			}
   833		}
   834	
   835		return 0;
   836	}
   837	
   838	/**
   839	 *  ngbe_mta_vector - Determines bit-vector in multicast table to set
   840	 *  @hw: pointer to hardware structure
   841	 *  @mc_addr: the multicast address
   842	 *
   843	 *  Extracts the 12 bits, from a multicast address, to determine which
   844	 *  bit-vector to set in the multicast table. The hardware uses 12 bits, from
   845	 *  incoming rx multicast addresses, to determine the bit-vector to check in
   846	 *  the MTA. Which of the 4 combination, of 12-bits, the hardware uses is set
   847	 *  by the MO field of the MCSTCTRL. The MO field is set during initialization
   848	 *  to mc_filter_type.
   849	 **/
   850	static s32 ngbe_mta_vector(struct ngbe_hw *hw, u8 *mc_addr)
   851	{
   852		u32 vector = 0;
   853	
   854		switch (hw->mac.mc_filter_type) {
   855		case 0:   /* use bits [47:36] of the address */
   856			vector = ((mc_addr[4] >> 4) | (((u16)mc_addr[5]) << 4));
   857			break;
   858		case 1:   /* use bits [46:35] of the address */
   859			vector = ((mc_addr[4] >> 3) | (((u16)mc_addr[5]) << 5));
   860			break;
   861		case 2:   /* use bits [45:34] of the address */
   862			vector = ((mc_addr[4] >> 2) | (((u16)mc_addr[5]) << 6));
   863			break;
   864		case 3:   /* use bits [43:32] of the address */
   865			vector = ((mc_addr[4]) | (((u16)mc_addr[5]) << 8));
   866			break;
   867		default:  /* Invalid mc_filter_type */
   868			DEBUGOUT("MC filter type param set incorrectly\n");
   869			ASSERT(0);
   870			break;
   871		}
   872	
   873		/* vector can only be 12-bits or boundary will be exceeded */
   874		vector &= 0xFFF;
   875		return vector;
   876	}
   877	
   878	/**
   879	 *  ngbe_set_mta - Set bit-vector in multicast table
   880	 *  @hw: pointer to hardware structure
   881	 *  @hash_value: Multicast address hash value
   882	 *
   883	 *  Sets the bit-vector in the multicast table.
   884	 **/
 > 885	void ngbe_set_mta(struct ngbe_hw *hw, u8 *mc_addr)
   886	{
   887		u32 vector;
   888		u32 vector_bit;
   889		u32 vector_reg;
   890	
   891		hw->addr_ctrl.mta_in_use++;
   892	
   893		vector = ngbe_mta_vector(hw, mc_addr);
   894		DEBUGOUT1(" bit-vector = 0x%03X\n", vector);
   895	
   896		/* The MTA is a register array of 128 32-bit registers. It is treated
   897		 * like an array of 4096 bits.  We want to set bit
   898		 * BitArray[vector_value]. So we figure out what register the bit is
   899		 * in, read it, OR in the new bit, then write back the new value.  The
   900		 * register is determined by the upper 7 bits of the vector value and
   901		 * the bit within that register are determined by the lower 5 bits of
   902		 * the value.
   903		 */
   904		vector_reg = (vector >> 5) & 0x7F;
   905		vector_bit = vector & 0x1F;
   906		hw->mac.mta_shadow[vector_reg] |= (1 << vector_bit);
   907	}
   908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
