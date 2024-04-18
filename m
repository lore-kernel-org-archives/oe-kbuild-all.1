Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73CC171085
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713461330; cv=none; b=ioJ7nupUmr5tXYHEsb9QTKqXzEKg0/WiNhPyJPWjvoja+yavRFONoOvxIjxF5Er0DtaV29SwBiVrogBXs/z/n5+DVnbIj27oc0IefpkASyMlEQv5XFk45EZt0Fbc7Z1TWeinnIzMy1eW1V8U/R0rdQPPmzzTJGJS6mKu8JUYw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713461330; c=relaxed/simple;
	bh=29XpLY4YXHXQ8lxUnJrtk454AWAd6mwV/BfQ9b74Il4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXVBTPLnEYUzV36/mOYnTSlDkOI8kDt8IpZHOBeCOSQTlhgHKm48J1dv2y9A6taC+WDcG3EI55NOW6h3leH/Yl82LzpDVNr4EW+OjEbiBR2Hun+Au2p5tnotWUt9SPW9yrdw61bhZQ7OtthsjWD8TLRWbm8NC0eNwILp8NVp0hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaypGcGj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaypGcGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713461329; x=1744997329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29XpLY4YXHXQ8lxUnJrtk454AWAd6mwV/BfQ9b74Il4=;
  b=UaypGcGjQFZvjn6Iz2K39z6ENFK73elKtm+iSGK6lksm80xwrXv93BRk
   dQl63zkuXGUbixwsz4YESEWZGdpeXKjstXAST909fs/XkmfcfJ8XM7gp8
   rlMthY4vESAW07HpFIZVZ1Yb7+X7fmGn2DznDzAO5/g+0NrW/AVGMOJOt
   QSJYXWMzvA/a48fq6KQ8Ppexua+d1XMs9JCoALsv79EqyHZGUP0/pUvvM
   jwTMCK9IEy/Apn4QWB7d+iWcgHctqSJ1FyxcwwYbRdmOhf/Pu0yLTr2GA
   X7HKD9dTjHJiDgAbZaRGojJGNkKhohXlZSIzRUGjICYpz9oCGub3NEfM/
   Q==;
X-CSE-ConnectionGUID: bkeNW58OT1aUYnZIbqRZQA==
X-CSE-MsgGUID: MnO0U0L6Tvu/tc4U6y1fdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19638888"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="19638888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 10:28:48 -0700
X-CSE-ConnectionGUID: YMAp0cK4QXSST+tUNK0t9g==
X-CSE-MsgGUID: 7EuflODES5++H1Im0gW6pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="54254099"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Apr 2024 10:28:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxVYz-00091w-05;
	Thu, 18 Apr 2024 17:28:45 +0000
Date: Fri, 19 Apr 2024 01:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 18109/18115]
 drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value
 'LANE_MODE_40GBASEKR4' not handled in switch
Message-ID: <202404190105.k5dyD1mJ-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190105.k5dyD1mJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190105.k5dyD1mJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190105.k5dyD1mJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/phy/freescale/phy-fsl-lynx-28g.c:966:9: warning: enumeration value 'LANE_MODE_40GBASEKR4' not handled in switch [-Wswitch]
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
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1258:12: error: invalid storage class for function 'lynx_28g_exit'
    1258 | static int lynx_28g_exit(struct phy *phy)
         |            ^~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1273:13: error: invalid storage class for function 'lynx_28g_check_cdr_lock'
    1273 | static void lynx_28g_check_cdr_lock(struct phy *phy,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1281:13: error: invalid storage class for function 'lynx_28g_get_pcvt_addr'
    1281 | static void lynx_28g_get_pcvt_addr(struct phy *phy,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-28g.c:1339:12: error: invalid storage class for function 'lynx_28g_get_status'
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


vim +/LANE_MODE_40GBASEKR4 +966 drivers/phy/freescale/phy-fsl-lynx-28g.c

8f73b37cf3fbda Ioana Ciornei   2022-03-11   943  
2fe2978e3e0035 Vladimir Oltean 2023-08-01   944  static int lynx_28g_set_lane_mode(struct phy *phy, enum lynx_28g_lane_mode lane_mode)
8f73b37cf3fbda Ioana Ciornei   2022-03-11   945  {
8f73b37cf3fbda Ioana Ciornei   2022-03-11   946  	struct lynx_28g_lane *lane = phy_get_drvdata(phy);
9efb96bdd5e162 Vladimir Oltean 2023-07-28   947  	bool is_backplane = lane_mode == lane->supported_backplane_mode;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   948  	struct lynx_28g_priv *priv = lane->priv;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   949  	int powered_up = lane->powered_up;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   950  	int err = 0;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   951  
44b0b351ec4e87 Vladimir Oltean 2023-07-28   952  	if (lane->mode == LANE_MODE_UNKNOWN)
8f73b37cf3fbda Ioana Ciornei   2022-03-11   953  		return -EOPNOTSUPP;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   954  
44b0b351ec4e87 Vladimir Oltean 2023-07-28   955  	if (!lynx_28g_supports_lane_mode(priv, lane_mode))
8f73b37cf3fbda Ioana Ciornei   2022-03-11   956  		return -EOPNOTSUPP;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   957  
8f73b37cf3fbda Ioana Ciornei   2022-03-11   958  	/* If the lane is powered up, put the lane into the halt state while
8f73b37cf3fbda Ioana Ciornei   2022-03-11   959  	 * the reconfiguration is being done.
8f73b37cf3fbda Ioana Ciornei   2022-03-11   960  	 */
8f73b37cf3fbda Ioana Ciornei   2022-03-11   961  	if (powered_up)
2628c361d7fd90 Vladimir Oltean 2023-07-12   962  		lynx_28g_lane_halt(phy);
8f73b37cf3fbda Ioana Ciornei   2022-03-11   963  
6b1763a81cb51d Vladimir Oltean 2023-10-04   964  	spin_lock(&priv->pcc_lock);
6b1763a81cb51d Vladimir Oltean 2023-10-04   965  
44b0b351ec4e87 Vladimir Oltean 2023-07-28  @966  	switch (lane_mode) {
44b0b351ec4e87 Vladimir Oltean 2023-07-28   967  	case LANE_MODE_1000BASEX_SGMII:
2fe2978e3e0035 Vladimir Oltean 2023-08-01   968  	case LANE_MODE_1000BASEKX:
2fe2978e3e0035 Vladimir Oltean 2023-08-01   969  		lynx_28g_lane_set_1g(lane, lane_mode);
6f901f8448c6b2 Vladimir Oltean 2023-10-04   970  	spin_lock(&priv->pcc_lock);
6f901f8448c6b2 Vladimir Oltean 2023-10-04   971  
8f73b37cf3fbda Ioana Ciornei   2022-03-11   972  	switch (submode) {
8f73b37cf3fbda Ioana Ciornei   2022-03-11   973  	case PHY_INTERFACE_MODE_SGMII:
8f73b37cf3fbda Ioana Ciornei   2022-03-11   974  	case PHY_INTERFACE_MODE_1000BASEX:
8f73b37cf3fbda Ioana Ciornei   2022-03-11   975  		lynx_28g_lane_set_sgmii(lane);
8f73b37cf3fbda Ioana Ciornei   2022-03-11   976  		break;
8a66be0db8562b Vladimir Oltean 2023-07-28   977  	case LANE_MODE_10GBASER:
8a66be0db8562b Vladimir Oltean 2023-07-28   978  	case LANE_MODE_USXGMII:
2fe2978e3e0035 Vladimir Oltean 2023-08-01   979  	case LANE_MODE_10GBASEKR:
f665001bd4296b Vladimir Oltean 2023-09-22   980  	case LANE_MODE_40GBASEKR4:
8a66be0db8562b Vladimir Oltean 2023-07-28   981  		lynx_28g_lane_set_10g(lane, lane_mode);
8f73b37cf3fbda Ioana Ciornei   2022-03-11   982  		break;
44b0b351ec4e87 Vladimir Oltean 2023-07-28   983  	case LANE_MODE_25GBASER:
2fe2978e3e0035 Vladimir Oltean 2023-08-01   984  	case LANE_MODE_25GBASEKR:
2fe2978e3e0035 Vladimir Oltean 2023-08-01   985  		lynx_28g_lane_set_25g(lane, lane_mode);
e3f75f32ca00f6 Ioana Ciornei   2023-04-05   986  		break;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   987  	default:
f74d6747a377b7 Vladimir Oltean 2023-09-22   988  		if (lane_mode != lane->mode)
8f73b37cf3fbda Ioana Ciornei   2022-03-11   989  			err = -EOPNOTSUPP;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   990  		goto out;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   991  	}
8f73b37cf3fbda Ioana Ciornei   2022-03-11   992  
9efb96bdd5e162 Vladimir Oltean 2023-07-28   993  	/* Enable observation of SerDes status on all status registers */
9efb96bdd5e162 Vladimir Oltean 2023-07-28   994  	lynx_28g_lane_rmw(lane, LNaTCSR0,
9efb96bdd5e162 Vladimir Oltean 2023-07-28   995  			  is_backplane ? LYNX_28G_LNaTCSR0_SD_STAT_OBS_EN : 0,
9efb96bdd5e162 Vladimir Oltean 2023-07-28   996  			  LYNX_28G_LNaTCSR0_SD_STAT_OBS_EN);
9efb96bdd5e162 Vladimir Oltean 2023-07-28   997  
44b0b351ec4e87 Vladimir Oltean 2023-07-28   998  	lane->mode = lane_mode;
8f73b37cf3fbda Ioana Ciornei   2022-03-11   999  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1000  out:
6f901f8448c6b2 Vladimir Oltean 2023-10-04  1001  	spin_unlock(&priv->pcc_lock);
6f901f8448c6b2 Vladimir Oltean 2023-10-04  1002  
2628c361d7fd90 Vladimir Oltean 2023-07-12  1003  	/* Reset the lane if necessary */
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1004  	if (powered_up)
2628c361d7fd90 Vladimir Oltean 2023-07-12  1005  		lynx_28g_lane_reset(phy);
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1006  
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1007  	return err;
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1008  }
8f73b37cf3fbda Ioana Ciornei   2022-03-11  1009  

:::::: The code at line 966 was first introduced by commit
:::::: 44b0b351ec4e87ec0bd382ed74579d34adf7676f phy: lynx-28g: refactor lane->interface to lane->mode

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: Vladimir Oltean <vladimir.oltean@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
