Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49379137E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 01:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713491710; cv=none; b=MSs+bzRN71o9iir2pPKWe3S3K4upnueBzVr5EE110+tQeAAj3q0pXG2O2LjAdki41CRDJlrZpUN1V9tH7B+rmM+TyJ+hw7pPOji/MBfm7EwZP16lA2Ksg55XWUKA4ZaNFO0LPfwugaXiJ7JRVf8n48uFdwxbwJA4mm19+Xv7Sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713491710; c=relaxed/simple;
	bh=Nuye9izC1ZHPf5mQtpTcbCY5PHxjFfsjTdH9gL6+9ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2bD59I2uiJiTpQJVznStt+mBzy0dJIhGGzVJFHWMFZN6FtrxiVcpVMw32ZQJD6DQ++qEJ03huw/14iTVhjSv7CQzYTFw3uINNzsNCK341knlVTMV30/7fACDznvoffXHw9p3/kVhMwF2sSFWXcnDA4f7cYrJJaCJugtY5f3SW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkTqAyeN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkTqAyeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713491708; x=1745027708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nuye9izC1ZHPf5mQtpTcbCY5PHxjFfsjTdH9gL6+9ww=;
  b=CkTqAyeNC3WyhFp+rcAqCrU/Wf+YMVysAjTVSB8Xwsruy3GMyoTGyOQY
   MHd2C4KQZKH1Thb0ofiWzVVom3AWfQ0JYYy31cn9fSNojLAbzSPaAzPgu
   /dVEz20eSECbCHBJPeksuz7V6PZDX/pzLWNredWTqAIvPXS/qqzqqe48o
   n6195DL8ktw3uuyaUtGc4Yh4EafpeN0RNoS7fgT8wJK0tcJJZQzvOkkZp
   Lhry2lHO3J/vrmb5C+faiLfE8dJjaf9JMG4hqjIFVJXD5b0X4nL/RJxSN
   +gadMm/ylIMogXTTxM+dLZVh5EUm98CK1JFVtr09QLPGWGZC0o9wBX3bB
   A==;
X-CSE-ConnectionGUID: zdwLZjUTSTSjPFlX5z5b5g==
X-CSE-MsgGUID: 2B4s+5ogQXC+7rIH2UDdQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8950017"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8950017"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:55:07 -0700
X-CSE-ConnectionGUID: 5u6/ajA9S2qYnGpXHk3cEg==
X-CSE-MsgGUID: DDKoY0hsRwOhh1T19I4BCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23226074"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2024 18:55:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxdSw-0009U3-1o;
	Fri, 19 Apr 2024 01:55:02 +0000
Date: Fri, 19 Apr 2024 09:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 18109/18115]
 drivers/phy/freescale/phy-fsl-lynx-28g.c:1258:12: error: invalid storage
 class for function 'lynx_28g_exit'
Message-ID: <202404190952.D5TVRzZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 86a389d3e879c2f3ba9b4f4d74b9ac47cf53227c [18109/18115] Merge remote-tracking branch 'lf-6.1.y' into 6.1-2.2.x-imx
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190952.D5TVRzZB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190952.D5TVRzZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190952.D5TVRzZB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/freescale/phy-fsl-lynx-28g.c: In function 'lynx_28g_set_lane_mode':
   drivers/phy/freescale/phy-fsl-lynx-28g.c:972:17: error: 'submode' undeclared (first use in this function)
     972 |         switch (submode) {
         |                 ^~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:972:17: note: each undeclared identifier is reported only once for each function it appears in
   drivers/phy/freescale/phy-fsl-lynx-28g.c:975:17: error: implicit declaration of function 'lynx_28g_lane_set_sgmii'; did you mean 'lynx_28g_lane_set_1g'? [-Werror=implicit-function-declaration]
     975 |                 lynx_28g_lane_set_sgmii(lane);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 lynx_28g_lane_set_1g
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_UNKNOWN' not handled in switch [-Wswitch]
     966 |         switch (lane_mode) {
         |         ^~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_10GBASER' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_USXGMII' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_25GBASER' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_10GBASEKR' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_25GBASEKR' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_40GBASEKR4' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_MAX' not handled in switch [-Wswitch]
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1010:12: error: invalid storage class for function 'lynx_28g_set_interface'
    1010 | static int lynx_28g_set_interface(struct phy *phy, phy_interface_t submode)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1010:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1010 | static int lynx_28g_set_interface(struct phy *phy, phy_interface_t submode)
         | ^~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1015:13: error: invalid storage class for function 'lynx_28g_tune_tx_eq'
    1015 | static void lynx_28g_tune_tx_eq(struct phy *phy,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1035:13: error: invalid storage class for function 'lynx_28g_read_tx_eq'
    1035 | static void lynx_28g_read_tx_eq(struct phy *phy, struct lynx_xgkr_tx_eq *tx_eq)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1049:12: error: invalid storage class for function 'lynx_28g_snapshot_rx_eq'
    1049 | static int lynx_28g_snapshot_rx_eq(struct phy *phy, int bin_sel, void *ctx,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1108:13: error: invalid storage class for function 'lynx_28g_snapshot_gains_cb'
    1108 | static void lynx_28g_snapshot_gains_cb(struct phy *phy, void *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1122:12: error: invalid storage class for function 'lynx_28g_snapshot_rx_eq_gains'
    1122 | static int lynx_28g_snapshot_rx_eq_gains(struct phy *phy, u8 *gaink2,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1135:13: error: invalid storage class for function 'lynx_28g_snapshot_bin_cb'
    1135 | static void lynx_28g_snapshot_bin_cb(struct phy *phy, void *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1151:12: error: invalid storage class for function 'lynx_28g_snapshot_rx_eq_bin'
    1151 | static int lynx_28g_snapshot_rx_eq_bin(struct phy *phy, enum lynx_bin_type bin_type,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1159:23: error: initializer element is not constant
    1159 |         .tune_tx_eq = lynx_28g_tune_tx_eq,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1159:23: note: (near initialization for 'lynx_28g_xgkr_ops.tune_tx_eq')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1160:23: error: initializer element is not constant
    1160 |         .read_tx_eq = lynx_28g_read_tx_eq,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1160:23: note: (near initialization for 'lynx_28g_xgkr_ops.read_tx_eq')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1161:33: error: initializer element is not constant
    1161 |         .snapshot_rx_eq_gains = lynx_28g_snapshot_rx_eq_gains,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1161:33: note: (near initialization for 'lynx_28g_xgkr_ops.snapshot_rx_eq_gains')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1162:31: error: initializer element is not constant
    1162 |         .snapshot_rx_eq_bin = lynx_28g_snapshot_rx_eq_bin,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1162:31: note: (near initialization for 'lynx_28g_xgkr_ops.snapshot_rx_eq_bin')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1165:12: error: invalid storage class for function 'lynx_28g_set_link_mode'
    1165 | static int lynx_28g_set_link_mode(struct phy *phy,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1188:12: error: invalid storage class for function 'lynx_28g_set_mode'
    1188 | static int lynx_28g_set_mode(struct phy *phy, enum phy_mode mode, int submode)
         |            ^~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1200:12: error: invalid storage class for function 'lynx_28g_validate_interface'
    1200 | static int lynx_28g_validate_interface(struct phy *phy, phy_interface_t submode)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1212:12: error: invalid storage class for function 'lynx_28g_validate_link_mode'
    1212 | static int lynx_28g_validate_link_mode(struct phy *phy,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1228:12: error: invalid storage class for function 'lynx_28g_validate'
    1228 | static int lynx_28g_validate(struct phy *phy, enum phy_mode mode, int submode,
         |            ^~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1241:12: error: invalid storage class for function 'lynx_28g_init'
    1241 | static int lynx_28g_init(struct phy *phy)
         |            ^~~~~~~~~~~~~
>> drivers/phy/freescale/phy-fsl-lynx-28g.c:1258:12: error: invalid storage class for function 'lynx_28g_exit'
    1258 | static int lynx_28g_exit(struct phy *phy)
         |            ^~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1273:13: error: invalid storage class for function 'lynx_28g_check_cdr_lock'
    1273 | static void lynx_28g_check_cdr_lock(struct phy *phy,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/freescale/phy-fsl-lynx-28g.c:1281:13: error: invalid storage class for function 'lynx_28g_get_pcvt_addr'
    1281 | static void lynx_28g_get_pcvt_addr(struct phy *phy,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/freescale/phy-fsl-lynx-28g.c:1339:12: error: invalid storage class for function 'lynx_28g_get_status'
    1339 | static int lynx_28g_get_status(struct phy *phy, enum phy_status_type type,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1356:12: error: invalid storage class for function 'lynx_28g_configure'
    1356 | static int lynx_28g_configure(struct phy *phy, union phy_configure_opts *opts)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1364:27: error: initializer element is not constant
    1364 |         .init           = lynx_28g_init,
         |                           ^~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1364:27: note: (near initialization for 'lynx_28g_ops.init')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1365:27: error: initializer element is not constant
    1365 |         .exit           = lynx_28g_exit,
         |                           ^~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1365:27: note: (near initialization for 'lynx_28g_ops.exit')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1368:27: error: initializer element is not constant
    1368 |         .set_mode       = lynx_28g_set_mode,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1368:27: note: (near initialization for 'lynx_28g_ops.set_mode')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1369:27: error: initializer element is not constant
    1369 |         .validate       = lynx_28g_validate,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1369:27: note: (near initialization for 'lynx_28g_ops.validate')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1370:27: error: initializer element is not constant
    1370 |         .get_status     = lynx_28g_get_status,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1370:27: note: (near initialization for 'lynx_28g_ops.get_status')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1371:27: error: initializer element is not constant
    1371 |         .configure      = lynx_28g_configure,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1371:27: note: (near initialization for 'lynx_28g_ops.configure')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1375:13: error: invalid storage class for function 'lynx_28g_pll_read_configuration'
    1375 | static void lynx_28g_pll_read_configuration(struct lynx_28g_priv *priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1420:13: error: invalid storage class for function 'lynx_28g_cdr_lock_check_work'
    1420 | static void lynx_28g_cdr_lock_check_work(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1444:13: error: invalid storage class for function 'lynx_28g_lane_read_configuration'
    1444 | static void lynx_28g_lane_read_configuration(struct lynx_28g_lane *lane)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1477:20: error: invalid storage class for function 'lynx_28g_xlate'
    1477 | static struct phy *lynx_28g_xlate(struct device *dev,
         |                    ^~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1489:12: error: invalid storage class for function 'lynx_28g_probe'
    1489 | static int lynx_28g_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1538:13: error: invalid storage class for function 'lynx_28g_remove'
    1538 | static void lynx_28g_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1553:19: error: initializer element is not constant
    1553 |         .probe  = lynx_28g_probe,
         |                   ^~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1553:19: note: (near initialization for 'lynx_28g_driver.probe')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1554:23: error: initializer element is not constant
    1554 |         .remove_new = lynx_28g_remove,
         |                       ^~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1554:23: note: (near initialization for 'lynx_28g_driver.remove_new')
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1552:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1552 | static struct platform_driver lynx_28g_driver = {
         | ^~~~~~
   In file included from include/linux/device.h:32,
                    from include/linux/dma-mapping.h:7,
                    from include/linux/skbuff.h:31,
                    from include/linux/netlink.h:7,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from drivers/phy/freescale/phy-fsl-lynx-28g.c:5:
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1560:24: error: invalid storage class for function 'lynx_28g_driver_init'
    1560 | module_platform_driver(lynx_28g_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/device/driver.h:263:19: note: in definition of macro 'module_driver'
     263 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1560:1: note: in expansion of macro 'module_platform_driver'
    1560 | module_platform_driver(lynx_28g_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/phy/freescale/phy-fsl-lynx-28g.c:4:
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1560:24: error: initializer element is not constant
    1560 | module_platform_driver(lynx_28g_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:250:55: note: in definition of macro '____define_initcall'
     250 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:260:9: note: in expansion of macro '__unique_initcall'
     260 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:262:35: note: in expansion of macro '___define_initcall'
     262 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:41: note: in expansion of macro '__define_initcall'
     291 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:296:24: note: in expansion of macro 'device_initcall'
     296 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~


vim +/lynx_28g_exit +1258 drivers/phy/freescale/phy-fsl-lynx-28g.c

2fe2978e3e0035 Vladimir Oltean 2023-08-01  1211  
2fe2978e3e0035 Vladimir Oltean 2023-08-01 @1212  static int lynx_28g_validate_link_mode(struct phy *phy,
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1213  				       enum ethtool_link_mode_bit_indices submode)
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1214  {
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1215  	enum lynx_28g_lane_mode lane_mode = link_mode_to_lane_mode(submode);
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1216  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1217  	struct lynx_28g_priv *priv = lane->priv;
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1218  
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1219  	if (!lynx_28g_supports_lane_mode(priv, lane_mode))
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1220  		return -EOPNOTSUPP;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1221  
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1222  	if (lane_mode != lane->supported_backplane_mode)
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1223  		return -EOPNOTSUPP;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1224  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1225  	return 0;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1226  }
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1227  
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1228  static int lynx_28g_validate(struct phy *phy, enum phy_mode mode, int submode,
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1229  			     union phy_configure_opts *opts __always_unused)
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1230  {
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1231  	switch (mode) {
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1232  	case PHY_MODE_ETHERNET:
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1233  		return lynx_28g_validate_interface(phy, submode);
c9c9d09e10215e Vladimir Oltean 2023-08-01  1234  	case PHY_MODE_ETHERNET_LINKMODE:
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1235  		return lynx_28g_validate_link_mode(phy, submode);
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1236  	default:
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1237  		return -EOPNOTSUPP;
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1238  	}
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1239  }
2fe2978e3e0035 Vladimir Oltean 2023-08-01  1240  
8f73b37cf3fbda Ioana Ciornei   2022-03-11 @1241  static int lynx_28g_init(struct phy *phy)
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1242  {
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1243  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1244  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1245  	/* Mark the fact that the lane was init */
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1246  	lane->init = true;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1247  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1248  	/* SerDes lanes are powered on at boot time.  Any lane that is managed
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1249  	 * by this driver will get powered down at init time aka at dpaa2-eth
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1250  	 * probe time.
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1251  	 */
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1252  	lane->powered_up = true;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1253  	lynx_28g_power_off(phy);
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1254  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1255  	return 0;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1256  }
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1257  
3479611119244e Vladimir Oltean 2023-11-01 @1258  static int lynx_28g_exit(struct phy *phy)
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1259  {
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1260  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1261  
3479611119244e Vladimir Oltean 2023-11-01  1262  	/* The lane returns to the state where it isn't managed by the
3479611119244e Vladimir Oltean 2023-11-01  1263  	 * consumer, so we must treat is as if it isn't initialized, and always
3479611119244e Vladimir Oltean 2023-11-01  1264  	 * powered on.
3479611119244e Vladimir Oltean 2023-11-01  1265  	 */
3479611119244e Vladimir Oltean 2023-11-01  1266  	lane->init = false;
3479611119244e Vladimir Oltean 2023-11-01  1267  	lane->powered_up = false;
3479611119244e Vladimir Oltean 2023-11-01  1268  	lynx_28g_power_on(phy);
3479611119244e Vladimir Oltean 2023-11-01  1269  
3479611119244e Vladimir Oltean 2023-11-01  1270  	return 0;
3479611119244e Vladimir Oltean 2023-11-01  1271  }
3479611119244e Vladimir Oltean 2023-11-01  1272  
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1273  static void lynx_28g_check_cdr_lock(struct phy *phy,
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1274  				    struct phy_status_opts_cdr *cdr)
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1275  {
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1276  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1277  
f74d6747a377b7 Vladimir Oltean 2023-09-22  1278  	cdr->cdr_locked = lynx_28g_cdr_lock_check(lane);
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1279  }
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1280  
3eb4303a931224 Vladimir Oltean 2023-09-19 @1281  static void lynx_28g_get_pcvt_addr(struct phy *phy,
3eb4303a931224 Vladimir Oltean 2023-09-19  1282  				   struct phy_status_opts_pcvt *pcvt)
3eb4303a931224 Vladimir Oltean 2023-09-19  1283  {
3eb4303a931224 Vladimir Oltean 2023-09-19  1284  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
3eb4303a931224 Vladimir Oltean 2023-09-19  1285  	enum lynx_28g_lane_mode lane_mode = lane->mode;
3eb4303a931224 Vladimir Oltean 2023-09-19  1286  	u32 cr1;
3eb4303a931224 Vladimir Oltean 2023-09-19  1287  
3eb4303a931224 Vladimir Oltean 2023-09-19  1288  	switch (pcvt->type) {
3eb4303a931224 Vladimir Oltean 2023-09-19  1289  	case PHY_PCVT_ETHERNET_PCS:
3eb4303a931224 Vladimir Oltean 2023-09-19  1290  		switch (lane_mode) {
3eb4303a931224 Vladimir Oltean 2023-09-19  1291  		case LANE_MODE_1000BASEX_SGMII:
3eb4303a931224 Vladimir Oltean 2023-09-19  1292  		case LANE_MODE_1000BASEKX:
3eb4303a931224 Vladimir Oltean 2023-09-19  1293  			cr1 = lynx_28g_lane_read(lane, SGMIIaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1294  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1295  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1296  		case LANE_MODE_10GBASER:
3eb4303a931224 Vladimir Oltean 2023-09-19  1297  		case LANE_MODE_USXGMII:
3eb4303a931224 Vladimir Oltean 2023-09-19  1298  		case LANE_MODE_10GBASEKR:
3eb4303a931224 Vladimir Oltean 2023-09-19  1299  			cr1 = lynx_28g_lane_read(lane, SXGMIIaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1300  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1301  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1302  		case LANE_MODE_25GBASER:
3eb4303a931224 Vladimir Oltean 2023-09-19  1303  		case LANE_MODE_25GBASEKR:
3eb4303a931224 Vladimir Oltean 2023-09-19  1304  			cr1 = lynx_28g_lane_read(lane, E25GaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1305  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1306  			break;
f665001bd4296b Vladimir Oltean 2023-09-22  1307  		case LANE_MODE_40GBASEKR4:
f665001bd4296b Vladimir Oltean 2023-09-22  1308  			cr1 = lynx_28g_40g_pcvt_read(lane);
f665001bd4296b Vladimir Oltean 2023-09-22  1309  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
f665001bd4296b Vladimir Oltean 2023-09-22  1310  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1311  		default:
3eb4303a931224 Vladimir Oltean 2023-09-19  1312  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1313  		}
3eb4303a931224 Vladimir Oltean 2023-09-19  1314  		break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1315  	case PHY_PCVT_ETHERNET_ANLT:
3eb4303a931224 Vladimir Oltean 2023-09-19  1316  		switch (lane_mode) {
3eb4303a931224 Vladimir Oltean 2023-09-19  1317  		case LANE_MODE_1000BASEKX:
3eb4303a931224 Vladimir Oltean 2023-09-19  1318  			cr1 = lynx_28g_lane_read(lane, SGMIIaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1319  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1320  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1321  		case LANE_MODE_10GBASEKR:
3eb4303a931224 Vladimir Oltean 2023-09-19  1322  			cr1 = lynx_28g_lane_read(lane, SXGMIIaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1323  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1324  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1325  		case LANE_MODE_25GBASEKR:
f665001bd4296b Vladimir Oltean 2023-09-22  1326  		case LANE_MODE_40GBASEKR4:
3eb4303a931224 Vladimir Oltean 2023-09-19  1327  			cr1 = lynx_28g_lane_read(lane, ANLTaCR1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1328  			pcvt->addr.mdio = LYNX_28G_MDEV_PORT_X(cr1);
3eb4303a931224 Vladimir Oltean 2023-09-19  1329  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1330  		default:
3eb4303a931224 Vladimir Oltean 2023-09-19  1331  			break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1332  		}
3eb4303a931224 Vladimir Oltean 2023-09-19  1333  		break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1334  	default:
3eb4303a931224 Vladimir Oltean 2023-09-19  1335  		break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1336  	}
3eb4303a931224 Vladimir Oltean 2023-09-19  1337  }
3eb4303a931224 Vladimir Oltean 2023-09-19  1338  
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23 @1339  static int lynx_28g_get_status(struct phy *phy, enum phy_status_type type,
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1340  			       union phy_status_opts *opts)
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1341  {
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1342  	switch (type) {
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1343  	case PHY_STATUS_CDR_LOCK:
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1344  		lynx_28g_check_cdr_lock(phy, &opts->cdr);
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1345  		break;
3eb4303a931224 Vladimir Oltean 2023-09-19  1346  	case PHY_STATUS_PCVT_ADDR:
3eb4303a931224 Vladimir Oltean 2023-09-19  1347  		lynx_28g_get_pcvt_addr(phy, &opts->pcvt);
3eb4303a931224 Vladimir Oltean 2023-09-19  1348  		break;
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1349  	default:
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1350  		return -EOPNOTSUPP;
e0f3ef0b77ff1d Vladimir Oltean 2023-07-23  1351  	}
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1352  
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1353  	return 0;
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1354  }
ab7ba9f4e6473d Vladimir Oltean 2023-07-23  1355  

:::::: The code at line 1258 was first introduced by commit
:::::: 3479611119244e3e5bb6ec7291f5ec790e170993 net: phy: lynx-28g: implement phy_exit() operation

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: Jason Liu <jason.hui.liu@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
