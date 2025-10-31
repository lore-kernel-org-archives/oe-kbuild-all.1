Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C02701DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 02:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761876793; cv=none; b=jx7ukazZVbs28FP9Oxe1NLpJeB9o1TTGFds4MLhuFljdjTESWUtFqkHKmrxjtuOCN0a0XYPcFP6juqq6c7XCIx2xazQGFVejABCzPjwBgE5GE2IQAmSockyiVG4tiDVbGq5LmH2dsUL0iMk3n0VBdNsi8tCaR606YIltSzUXVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761876793; c=relaxed/simple;
	bh=f8el+S+32gRcLrFTdDBSbJp9MPzWnktheOGp1LjYW80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVjqG+vrV7IdK5pA0rzuC9ldZn1F+8410O+pF0SZ7hRErZEDu5naRpP2QuzvY9LEkiL9OaFlOdJw8LXDIBSd3ch0JESCdqSuC19n71bF8bGoZ7WLDKvKLlyz/rV5J9cjvfxtnLI7FwPQT04ZoOPAyDtOKNsYkF3Cj/70mLw12YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOvimIeg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOvimIeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761876791; x=1793412791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8el+S+32gRcLrFTdDBSbJp9MPzWnktheOGp1LjYW80=;
  b=VOvimIeg7w7iBJoY29OwqAU3h8T+UEDINWdNREdQJ4OwNi59FBFURHwW
   XP03WCbNNR0zNHqh5l3KXo/xsMKBeSLxKPFrvhkmKOGV9nkLI84FyOQC/
   GgOhPP5xKWKnUsVPLyjkBZoaZiaiEqo60Be3tdHfqLWjxdtFWWa7s19UJ
   BbINZ80WLP/mO68kTilx3bkAKbfVNHG5zsYDUDN+GF7SJU5i+jRZs28eQ
   oOq7Q0jL9VTXCwWYMuko7B4ajZPHRWViaKhDTYYLszn+EA3EwreLIue+w
   2SNwe5ie8lGb55dwLwJHWvP3CHos7+Yf3LhpbvWluNgUPWBKknl2IgftF
   A==;
X-CSE-ConnectionGUID: zD1BR/aHTjWMFOHsFP0Vng==
X-CSE-MsgGUID: VjL7Ct3mRrCvtp9M/t+GhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67867920"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67867920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:13:09 -0700
X-CSE-ConnectionGUID: DwLxCva2S+aIF+C4Pp/W7g==
X-CSE-MsgGUID: V36v28tbTlqu9w0GnzE5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186447037"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2025 19:13:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEedW-000Mga-1F;
	Fri, 31 Oct 2025 02:13:06 +0000
Date: Fri, 31 Oct 2025 10:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075]
 drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:20: error: 'adapter'
 undeclared
Message-ID: <202510311058.pwU944FY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [3075/3075] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-randconfig-102-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311058.pwU944FY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311058.pwU944FY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311058.pwU944FY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_xsk.h:7,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:28:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_tx_timeout':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:582:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     582 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_do_lan_reset':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2618:28: warning: variable 'tx_ring' set but not used [-Wunused-but-set-variable]
    2618 |         struct txgbe_ring *tx_ring;
         |                            ^~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: At top level:
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: warning: no previous prototype for 'txgbe_irq_rearm_queues' [-Wmissing-prototypes]
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:10:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_init_fdir_signature':
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6111:31: warning: unused variable 'adapter' [-Wunused-variable]
    6111 |         struct txgbe_adapter *adapter = (struct txgbe_adapter *)hw->back;
         |                               ^~~~~~~
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_type.h:9,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6:
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_fdir_set_input_mask':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:20: error: 'adapter' undeclared (first use in this function)
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                    ^~~~~~~
   include/linux/netdevice.h:4407:35: note: in definition of macro 'netif_msg_drv'
    4407 | #define netif_msg_drv(p)        ((p)->msg_enable & NETIF_MSG_DRV)
         |                                   ^
   include/net/net_debug.h:109:9: note: in expansion of macro 'netif_level'
     109 |         netif_level(info, priv, type, dev, fmt, ##args)
         |         ^~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:9: note: in expansion of macro 'netif_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |         ^~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:17: note: in expansion of macro 'e_info'
    6450 |                 e_info(drv, " bucket hash should always be 0 in mask\n");
         |                 ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:20: note: each undeclared identifier is reported only once for each function it appears in
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                    ^~~~~~~
   include/linux/netdevice.h:4407:35: note: in definition of macro 'netif_msg_drv'
    4407 | #define netif_msg_drv(p)        ((p)->msg_enable & NETIF_MSG_DRV)
         |                                   ^
   include/net/net_debug.h:109:9: note: in expansion of macro 'netif_level'
     109 |         netif_level(info, priv, type, dev, fmt, ##args)
         |         ^~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:9: note: in expansion of macro 'netif_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |         ^~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:17: note: in expansion of macro 'e_info'
    6450 |                 e_info(drv, " bucket hash should always be 0 in mask\n");
         |                 ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_hic_get_lldp':
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7554:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7554 |         int status;
         |             ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_hic_notify_led_active':
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7687:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7687 |         int status;
         |             ^~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c:15:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c: In function 'txgbe_set_vf_vlan_msg':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c:865:25: error: label 'out' used but not defined
     865 |                         goto out;
         |                         ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/adapter +1292 drivers/net/ethernet/wangxun/txgbe/txgbe.h

  1276	
  1277	#define hw_dbg(hw, format, arg...) \
  1278		netdev_dbg(txgbe_hw_to_netdev(hw), format, ## arg)
  1279	#define hw_err(hw, format, arg...) \
  1280		netdev_err(txgbe_hw_to_netdev(hw), format, ## arg)
  1281	#define e_dev_info(format, arg...) \
  1282		dev_info(pci_dev_to_dev(adapter->pdev), format, ## arg)
  1283	#define e_dev_warn(format, arg...) \
  1284		dev_warn(pci_dev_to_dev(adapter->pdev), format, ## arg)
  1285	#define e_dev_err(format, arg...) \
  1286		dev_err(pci_dev_to_dev(adapter->pdev), format, ## arg)
  1287	#define e_dev_notice(format, arg...) \
  1288		dev_notice(pci_dev_to_dev(adapter->pdev), format, ## arg)
  1289	#define e_dbg(msglvl, format, arg...) \
  1290		netif_dbg(adapter, msglvl, adapter->netdev, format, ## arg)
  1291	#define e_info(msglvl, format, arg...) \
> 1292		netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
  1293	#define e_err(msglvl, format, arg...) \
  1294		netif_err(adapter, msglvl, adapter->netdev, format, ## arg)
  1295	#define e_warn(msglvl, format, arg...) \
  1296		netif_warn(adapter, msglvl, adapter->netdev, format, ## arg)
  1297	#define e_crit(msglvl, format, arg...) \
  1298		netif_crit(adapter, msglvl, adapter->netdev, format, ## arg)
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
