Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5002F29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716706913; cv=none; b=DG/KkoOJNFf480ArQCQWe69T5yqtxRUtECpOYdvQSAnfQGlaDcm48YDCouKqoIKgk3q86AsSAHlSVkmAx0qByht+A8JFyQ7E+laZ7ouSJMBm/1ePmEagV+8l/rL+rH3c9qpaBqFmU/JPw0ZwZiQE1o0Q/Jx0B/fJu7gmTMJk66o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716706913; c=relaxed/simple;
	bh=4Udb0ur1I7s0kPCCd7GrXuoTbugPIXmBoCjemklLs98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=biVPlifjjHrTAef4ZJVQqonl0J3+OdQA826OU06sWOjEqP1z+7xeY44PfGxRNqV8zt2bqNaZnYbDUuxYROy4dVIEUNtxX+mKZUEsF+W6un41qAv4el5mzsX39UrD2leOmVfDutWFT7QeT9+i+xemwcWkVz7/UbeSBOiRQ8vMdtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQo6+JUR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQo6+JUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716706911; x=1748242911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Udb0ur1I7s0kPCCd7GrXuoTbugPIXmBoCjemklLs98=;
  b=HQo6+JURyIR4PHJPO/y+IToMAzD1A4jXTJqaOptzjzjmKG6QKNLIh0Qm
   mouNdW6tFEVtLwsT5Vu84gnOp1h5HxWIrhARYIZYyDpqvPKL11yoXl4Ao
   yC6DWOFNT+1vjia7DOnCF6Et3Hl3maWM6os/M38PkJAiiD7Pi0gDPGOIX
   7HtUsWkzYeyIERjOg32Ep0RqsCNBq+3LWWVhFeG4Vvs4SQmpvCK6Ic3rX
   sgxiXMpOxIL7idhOsDuaN7x5cYjhkEWsuVC/p+JQWxciUEU26Zid49zLW
   +B8qyzaFBagzisBKHBa2JPsg65Cb/rnEWOHEX0ZWzmrCZWfBxGB9Q5wYS
   A==;
X-CSE-ConnectionGUID: RGr3fgGeRcymL3Awx2kE4g==
X-CSE-MsgGUID: 2J98QCS8Qf+Gz400Gr3uzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="16870179"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="16870179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 00:01:50 -0700
X-CSE-ConnectionGUID: 7Ery2+xtRFyvWvSK//zrqw==
X-CSE-MsgGUID: +Zi57um6QUWVOwnmFDE61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34923882"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2024 00:01:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB7sw-0007px-1X;
	Sun, 26 May 2024 07:01:38 +0000
Date: Sun, 26 May 2024 14:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15452/22498]
 drivers/net/ethernet/netswift/txgbe/txgbe_main.o: warning: objtool: missing
 symbol for section .init.text
Message-ID: <202405261446.vSg0xorn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4ba26291c36f420273a2546b25d2c0db3115d226
commit: e9f0b33ca1fa178f87823d17762a4d2f9296efd1 [15452/22498] net: txgbe: Add support for Netswift 10G NIC
config: x86_64-buildonly-randconfig-003-20240525 (https://download.01.org/0day-ci/archive/20240526/202405261446.vSg0xorn-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261446.vSg0xorn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261446.vSg0xorn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/txgbe/txgbe.h:28,
                    from drivers/net/ethernet/netswift/txgbe/txgbe_main.c:45:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/netswift/txgbe/txgbe.h:871:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     871 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c: At top level:
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:170:6: warning: no previous prototype for 'txgbe_service_event_schedule' [-Wmissing-prototypes]
     170 | void txgbe_service_event_schedule(struct txgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c: In function 'txgbe_tx_timeout':
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:433:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     433 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c: At top level:
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2634:6: warning: no previous prototype for 'txgbe_disable_tx_queue' [-Wmissing-prototypes]
    2634 | void txgbe_disable_tx_queue(struct txgbe_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3299:5: warning: no previous prototype for 'txgbe_add_cloud_switcher' [-Wmissing-prototypes]
    3299 | int txgbe_add_cloud_switcher(struct txgbe_adapter *adapter, u32 key, u16 pool)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3315:5: warning: no previous prototype for 'txgbe_del_cloud_switcher' [-Wmissing-prototypes]
    3315 | int txgbe_del_cloud_switcher(struct txgbe_adapter *adapter, u32 key, u16 pool)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3667:6: warning: no previous prototype for 'txgbe_configure_isb' [-Wmissing-prototypes]
    3667 | void txgbe_configure_isb(struct txgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3677:6: warning: no previous prototype for 'txgbe_configure_port' [-Wmissing-prototypes]
    3677 | void txgbe_configure_port(struct txgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4219:6: warning: no previous prototype for 'txgbe_disable_device' [-Wmissing-prototypes]
    4219 | void txgbe_disable_device(struct txgbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4315:5: warning: no previous prototype for 'txgbe_init_shared_code' [-Wmissing-prototypes]
    4315 | s32 txgbe_init_shared_code(struct txgbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6697:5: warning: no previous prototype for 'txgbe_skb_pad_nonzero' [-Wmissing-prototypes]
    6697 | int txgbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:257: warning: Function parameter or member 'quiet' not described in 'txgbe_read_reg'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:1802: warning: Function parameter or member 'queues' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:1802: warning: Function parameter or member 'flush' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2246: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_msi_and_legacy'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:2766: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_bridge_mode'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:3279: warning: Function parameter or member 'pool' not described in 'txgbe_write_uc_addr_list'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:4333: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5242: warning: Function parameter or member 'adapter' not described in 'txgbe_fdir_reinit_subtask'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5284: warning: Function parameter or member 'adapter' not described in 'txgbe_check_hang_subtask'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5307: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_update_link'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5391: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_up'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5437: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_down'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5510: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_flush_tx'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5531: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_subtask'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5570: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_detection_subtask'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5641: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_link_config_subtask'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5725: warning: Function parameter or member 't' not described in 'txgbe_service_timer'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:5725: warning: Excess function parameter 'data' description in 'txgbe_service_timer'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6921: warning: Function parameter or member 'dev' not described in 'txgbe_add_sanmac_netdev'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6921: warning: Excess function parameter 'netdev' description in 'txgbe_add_sanmac_netdev'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6946: warning: Function parameter or member 'dev' not described in 'txgbe_del_sanmac_netdev'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:6946: warning: Excess function parameter 'netdev' description in 'txgbe_del_sanmac_netdev'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7041: warning: Function parameter or member 'dev' not described in 'txgbe_setup_tc'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7041: warning: Excess function parameter 'netdev' description in 'txgbe_setup_tc'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7469: warning: Excess function parameter 'device_id' description in 'txgbe_wol_supported'
   drivers/net/ethernet/netswift/txgbe/txgbe_main.c:7469: warning: Excess function parameter 'subdev_id' description in 'txgbe_wol_supported'
>> drivers/net/ethernet/netswift/txgbe/txgbe_main.o: warning: objtool: missing symbol for section .init.text
--
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/txgbe/txgbe.h:28,
                    from drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:25:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/netswift/txgbe/txgbe.h:871:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     871 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c: At top level:
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:132:5: warning: no previous prototype for 'txgbe_poll_for_msg' [-Wmissing-prototypes]
     132 | int txgbe_poll_for_msg(struct txgbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:162:5: warning: no previous prototype for 'txgbe_poll_for_ack' [-Wmissing-prototypes]
     162 | int txgbe_poll_for_ack(struct txgbe_hw *hw, u16 mbx_id)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:185:5: warning: no previous prototype for 'txgbe_check_for_bit_pf' [-Wmissing-prototypes]
     185 | int txgbe_check_for_bit_pf(struct txgbe_hw *hw, u32 mask, int index)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:205:5: warning: no previous prototype for 'txgbe_check_for_msg_pf' [-Wmissing-prototypes]
     205 | int txgbe_check_for_msg_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:227:5: warning: no previous prototype for 'txgbe_check_for_ack_pf' [-Wmissing-prototypes]
     227 | int txgbe_check_for_ack_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:249:5: warning: no previous prototype for 'txgbe_check_for_rst_pf' [-Wmissing-prototypes]
     249 | int txgbe_check_for_rst_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:274:5: warning: no previous prototype for 'txgbe_obtain_mbx_lock_pf' [-Wmissing-prototypes]
     274 | int txgbe_obtain_mbx_lock_pf(struct txgbe_hw *hw, u16 vf)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:303:5: warning: no previous prototype for 'txgbe_write_mbx_pf' [-Wmissing-prototypes]
     303 | int txgbe_write_mbx_pf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:346:5: warning: no previous prototype for 'txgbe_read_mbx_pf' [-Wmissing-prototypes]
     346 | int txgbe_read_mbx_pf(struct txgbe_hw *hw, u32 *msg, u16 size,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
