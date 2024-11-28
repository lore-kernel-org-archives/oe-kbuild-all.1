Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408C192D95
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732793338; cv=none; b=FKIwZef3AWlu5q3vzCXi90MGgc2ERvG7Jp7/rKP6VxuCVcSezraeVOKRGqmlU0501OXUZZsbTNkr2s83t3S4n9u+Ypf89nbm2WGCw6MHDw+0ywS9r4lsS10GtOTzVU9agsHQWhY7MHaye76K8Aw2Lf9ZecDDw6oPN9arhfZU2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732793338; c=relaxed/simple;
	bh=HyqMmRZQhkZexceY2yrxvly5Fjw1zX7+okKV4G5GHpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx6xIkoB+b2GMWdoi8cmqkWhDUmo6yTx9K/z2jmuDClMCUL/ZEdbX5lkx4p/G+z3tH42nFfOXNTtLTPp2f+gfo/tDylbtPqzf7wUSlSlZQnGqu2XcDJh0sSHqnoIMxYNR7CBIgM3YOILdpws7EWbttsIu/VsVIl9O8YjONRqw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8Wd0wDp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8Wd0wDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732793336; x=1764329336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HyqMmRZQhkZexceY2yrxvly5Fjw1zX7+okKV4G5GHpY=;
  b=N8Wd0wDpAbCWOAcXD/fkXD0Emt677PnlyPAN0/uu1IF60p95Y9Wp5pak
   TMBZA5aGT8XeASGd7BgDUf6f/He+TXmK6/4kKaGSwQDfy1eIpmM+QovQf
   4v5fkIDocA9TIvYgmVNcCAMlyf38kxDnretMRkI0s3eFdMKACouNqYrY7
   LhtKswljYMKpNJSPgu20Gx57jVWvtZHl8kFA5RTNp+NQEnHAf58l03g0I
   6uA9Krq2HnAk3jLoekumZmGU81x88fwFG/fiYfO5XxVCNLkUGyml6J/Ed
   VkaL9I3ChJt672U/FJW2H8LpwCHiw6fEsRsgWxFf3IZnQPWBid0FmtTTA
   Q==;
X-CSE-ConnectionGUID: 35K3r9lVT661AJT6xBHa+g==
X-CSE-MsgGUID: KkOoVn5TThmfG4xiOih+4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33076881"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33076881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 03:28:55 -0800
X-CSE-ConnectionGUID: rV4rkSPYQiilbV90ZzOr3A==
X-CSE-MsgGUID: pXTeGYOUQaaL6ARFV1T7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92020626"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2024 03:28:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGchX-0009WJ-2x;
	Thu, 28 Nov 2024 11:28:51 +0000
Date: Thu, 28 Nov 2024 19:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 05/23] net: phy: remove
 genphy_c45_eee_is_active()'s is_enabled arg
Message-ID: <202411281935.XRdfJRgN-lkp@intel.com>
References: <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King/net-phy-ensure-that-genphy_c45_an_config_eee_aneg-sees-new-value-of-phydev-eee_cfg-eee_enabled/20241128-140608
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tFv3U-005yhl-LJ%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 05/23] net: phy: remove genphy_c45_eee_is_active()'s is_enabled arg
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20241128/202411281935.XRdfJRgN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281935.XRdfJRgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281935.XRdfJRgN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy-c45.c:1479: warning: Excess function parameter 'is_enabled' description in 'genphy_c45_eee_is_active'


vim +1479 drivers/net/phy/phy-c45.c

493323416fed6b Piergiorgio Beruto    2023-01-09  1466  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1467  /**
022c3f87f88e2d Oleksij Rempel        2023-02-11  1468   * genphy_c45_eee_is_active - get EEE status
022c3f87f88e2d Oleksij Rempel        2023-02-11  1469   * @phydev: target phy_device struct
022c3f87f88e2d Oleksij Rempel        2023-02-11  1470   * @adv: variable to store advertised linkmodes
022c3f87f88e2d Oleksij Rempel        2023-02-11  1471   * @lp: variable to store LP advertised linkmodes
022c3f87f88e2d Oleksij Rempel        2023-02-11  1472   * @is_enabled: variable to store EEE enabled/disabled configuration value
022c3f87f88e2d Oleksij Rempel        2023-02-11  1473   *
022c3f87f88e2d Oleksij Rempel        2023-02-11  1474   * Description: this function will read local and link partner PHY
022c3f87f88e2d Oleksij Rempel        2023-02-11  1475   * advertisements. Compare them return current EEE state.
022c3f87f88e2d Oleksij Rempel        2023-02-11  1476   */
022c3f87f88e2d Oleksij Rempel        2023-02-11  1477  int genphy_c45_eee_is_active(struct phy_device *phydev, unsigned long *adv,
de71eda2a2fb82 Russell King (Oracle  2024-11-26  1478) 			     unsigned long *lp)
022c3f87f88e2d Oleksij Rempel        2023-02-11 @1479  {
022c3f87f88e2d Oleksij Rempel        2023-02-11  1480  	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_adv) = {};
022c3f87f88e2d Oleksij Rempel        2023-02-11  1481  	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_lp) = {};
022c3f87f88e2d Oleksij Rempel        2023-02-11  1482  	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
de71eda2a2fb82 Russell King (Oracle  2024-11-26  1483) 	bool eee_active;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1484  	int ret;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1485  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1486  	ret = genphy_c45_read_eee_adv(phydev, tmp_adv);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1487  	if (ret)
022c3f87f88e2d Oleksij Rempel        2023-02-11  1488  		return ret;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1489  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1490  	ret = genphy_c45_read_eee_lpa(phydev, tmp_lp);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1491  	if (ret)
022c3f87f88e2d Oleksij Rempel        2023-02-11  1492  		return ret;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1493  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1494  	linkmode_and(common, tmp_adv, tmp_lp);
de71eda2a2fb82 Russell King (Oracle  2024-11-26  1495) 	if (!linkmode_empty(tmp_adv) && !linkmode_empty(common))
022c3f87f88e2d Oleksij Rempel        2023-02-11  1496  		eee_active = phy_check_valid(phydev->speed, phydev->duplex,
022c3f87f88e2d Oleksij Rempel        2023-02-11  1497  					     common);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1498  	else
022c3f87f88e2d Oleksij Rempel        2023-02-11  1499  		eee_active = false;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1500  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1501  	if (adv)
022c3f87f88e2d Oleksij Rempel        2023-02-11  1502  		linkmode_copy(adv, tmp_adv);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1503  	if (lp)
022c3f87f88e2d Oleksij Rempel        2023-02-11  1504  		linkmode_copy(lp, tmp_lp);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1505  
022c3f87f88e2d Oleksij Rempel        2023-02-11  1506  	return eee_active;
022c3f87f88e2d Oleksij Rempel        2023-02-11  1507  }
022c3f87f88e2d Oleksij Rempel        2023-02-11  1508  EXPORT_SYMBOL(genphy_c45_eee_is_active);
022c3f87f88e2d Oleksij Rempel        2023-02-11  1509  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
