Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC812C80D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706918324; cv=none; b=StFI4g9CaPxx99ouSlisbn65uXk+Kme6mkXst6UVnLiBmsqRUtliiH+slvL73YbTp4qe4zohDkwSA2XsdzORToamj2cUcB1x9iNm2qAOGjqpx0TZ+iQ/fhsq3OC2X+ECnKF8hhecQQRTKDhh7zDB8V/vstnPo3T92skrw0hnfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706918324; c=relaxed/simple;
	bh=3iHo5jFbOoBjmlrWVNrRBKHdIEaU0Jo77eGSWz2fUeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seRC8DEZh+LYBsRgv0GkRG9ygSZ8bOsuchY5jhoSZ0im1bmot3P4mft76aKetP1CmL/vYznWkCUcbzULtffRBeqP/FUyVLeDcbbZ5L4nGSt6lxcqlgVaUX591tiKCaemthaEkiFhJFG/7tVJIFuEOKYV2ueHkc6V1pxhptQ55uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+491opZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+491opZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706918321; x=1738454321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iHo5jFbOoBjmlrWVNrRBKHdIEaU0Jo77eGSWz2fUeE=;
  b=L+491opZxO/NBOcjPW7pRPfUVimUw896NjihXxiChCobGDKpJJNpWDGY
   5pS1Q9fJMlSFH8vVv4+d9/kCMd7EEIXhk8TDEiKHl453PqqZq4bAXLMp9
   f5cakTOyNHyjmvFjIfDqO6KZ43xXCnXy9bWQgM5TO4wZy/mzDqX9V05uM
   KQ7uZaK8RGPpM/uMhS31MNrPTA0DZERAyIzCYLwrr8HIXjYu+chiZRZXN
   2tbI1ak812oFms3XX9RFW6PqmRNnA2i0yd8WewtgYRlgkeV11jGXjt92j
   r0jwssTgPLvLCsABBQlzwIYpCSoh+fGqQuiRlnvJq3q63GGEZQ0Q99lOK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="172873"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="172873"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 15:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932625972"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="932625972"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2024 15:58:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW3QZ-0004Pu-2H;
	Fri, 02 Feb 2024 23:58:35 +0000
Date: Sat, 3 Feb 2024 07:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/21614]
 drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2718:30: warning: unused
 variable 'adapter'
Message-ID: <202402030729.W96TozyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5bc2c7cbdcbc5c8e5bbe65d3542ec2fccbc61492
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/21614] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-randconfig-011-20240203 (https://download.01.org/0day-ci/archive/20240203/202402030729.W96TozyN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030729.W96TozyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030729.W96TozyN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/netswift/ngbe/ngbe.h:28,
                    from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:38:
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
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_main.c:38:
   drivers/net/ethernet/netswift/ngbe/ngbe.h: In function 'ngbe_misc_isb':
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:170:6: warning: no previous prototype for 'ngbe_service_event_schedule' [-Wmissing-prototypes]
     170 | void ngbe_service_event_schedule(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_tx_timeout':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:433:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     433 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_addr_list_itr':
>> drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2718:30: warning: unused variable 'adapter' [-Wunused-variable]
    2718 |         struct ngbe_adapter *adapter = hw->back;
         |                              ^~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: At top level:
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3223:6: warning: no previous prototype for 'ngbe_configure_isb' [-Wmissing-prototypes]
    3223 | void ngbe_configure_isb(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3233:6: warning: no previous prototype for 'ngbe_configure_port' [-Wmissing-prototypes]
    3233 | void ngbe_configure_port(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3592:6: warning: no previous prototype for 'ngbe_disable_device' [-Wmissing-prototypes]
    3592 | void ngbe_disable_device(struct ngbe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3693:5: warning: no previous prototype for 'ngbe_init_shared_code' [-Wmissing-prototypes]
    3693 | s32 ngbe_init_shared_code(struct ngbe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:5810:5: warning: no previous prototype for 'ngbe_skb_pad_nonzero' [-Wmissing-prototypes]
    5810 | int ngbe_skb_pad_nonzero(struct sk_buff *skb, int pad)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c: In function 'ngbe_mii_ioctl':
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6010:20: warning: variable 'devad' set but not used [-Wunused-but-set-variable]
    6010 |         int prtad, devad, ret = 0;
         |                    ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6010:13: warning: variable 'prtad' set but not used [-Wunused-but-set-variable]
    6010 |         int prtad, devad, ret = 0;
         |             ^~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:257: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:1644: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2035: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2449: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:2913: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:3722: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4583: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4648: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4744: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4789: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4856: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4928: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:4957: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6043: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6043: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6297: warning: Excess function parameter 'device_id' description in 'ngbe_wol_supported'
   drivers/net/ethernet/netswift/ngbe/ngbe_main.c:6297: warning: Excess function parameter 'subdev_id' description in 'ngbe_wol_supported'


vim +/adapter +2718 drivers/net/ethernet/netswift/ngbe/ngbe_main.c

  2712	
  2713	static u8 *ngbe_addr_list_itr(struct ngbe_hw *hw,
  2714				       u8 **mc_addr_ptr, u32 *vmdq)
  2715	{
  2716		struct netdev_hw_addr *mc_ptr;
  2717		u8 *addr = *mc_addr_ptr;
> 2718		struct ngbe_adapter *adapter = hw->back;
  2719	
  2720		/* VMDQ_P implicitely uses the adapter struct when CONFIG_PCI_IOV is
  2721		 * defined, so we have to wrap the pointer above correctly to prevent
  2722		 * a warning.
  2723		 */
  2724		*vmdq = VMDQ_P(0);
  2725	
  2726		mc_ptr = container_of(addr, struct netdev_hw_addr, addr[0]);
  2727		if (mc_ptr->list.next) {
  2728			struct netdev_hw_addr *ha;
  2729	
  2730			ha = list_entry(mc_ptr->list.next, struct netdev_hw_addr, list);
  2731			*mc_addr_ptr = ha->addr;
  2732		} else
  2733			*mc_addr_ptr = NULL;
  2734	
  2735		return addr;
  2736	}
  2737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
