Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8F19ADA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732796991; cv=none; b=MJSkKcci2gGsiqAAhKJMoTO4+drTtZDGw31f2HP5AxShKLfWV4+sZgPaDFtnaL8y3PXEjzuRCsBSCBhyJwxe6IxAji2lEAAA7udU4nWIN5ojJf5GUDCo2GL6nG3wKmTo6L4R7rB/UPXGL6fAGncxs3Tz/xUDdi/pfY3WyyyvXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732796991; c=relaxed/simple;
	bh=RyBB0/gEyArUPgeoHCABS74nHQs9c1Yn2T2GHXUHc5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJ564YN3X1sqlFQLYluit6dfkQheIr3Q4XcbaJxbh3vpxZ4/msh/EndoHVeiImG3iY/5bMyasq39kTKC44oYjoDUSfXslJNNAwlqE3z0eHp5vz8GbUFXMDVpPZU6sXW9Rd+ONKavPervSbqG/Vbx3fEcO/TOzAqmIjDWqPypfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pmxk5Xzq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pmxk5Xzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732796989; x=1764332989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RyBB0/gEyArUPgeoHCABS74nHQs9c1Yn2T2GHXUHc5k=;
  b=Pmxk5Xzqq6v2zhoMcatkWgbYn1ukgWJcoeo+NVDdOUjJ/zrkjGA0+5Zx
   p2h2NvXdN97SlO8q9yJ3M02DA6mu6KmXaf/6XdDLgofCLrDUdx4aF/r0Z
   2/zLQOceAJbSIHTlk9r/xw7SEcwu7vGkpwJjktEH9dG2cmEPlEeRcj3lS
   SlDhk50iYAmGmxu297Qr8d37WCW2077dsLMQW9blvIwrFl6I7iu8GLzFz
   chQDVmsxN9CCgEJE1gm0PPdBQfI/Vlz1xNY2dIvdaEYGfv5w3jNtVlLfg
   j0thZ1huVgk+EIAFurlDiYYrHrBM1ATNAMqnC/Mxcjr9qRla9eGbSFlGi
   g==;
X-CSE-ConnectionGUID: o3O4K3LqTIKRm/SG5qyrQg==
X-CSE-MsgGUID: NMKU5RbgTrOcSLzxzYEOMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44405467"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44405467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 04:29:49 -0800
X-CSE-ConnectionGUID: vKj643i/SqeWA/Uzppun2w==
X-CSE-MsgGUID: +zU+Syz1RmOdhI30dQlK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="115516368"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 04:29:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGdeT-0009Yt-1X;
	Thu, 28 Nov 2024 12:29:45 +0000
Date: Thu, 28 Nov 2024 20:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 09/23] net: phy: add configuration of rx
 clock stop mode
Message-ID: <202411282000.d2XUgfg7-lkp@intel.com>
References: <E1tFv3p-005yi9-3F@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFv3p-005yi9-3F@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King/net-phy-ensure-that-genphy_c45_an_config_eee_aneg-sees-new-value-of-phydev-eee_cfg-eee_enabled/20241128-140608
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tFv3p-005yi9-3F%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 09/23] net: phy: add configuration of rx clock stop mode
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20241128/202411282000.d2XUgfg7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282000.d2XUgfg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282000.d2XUgfg7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy.c:1619: warning: Function parameter or struct member 'phydev' not described in 'phy_eee_rx_clock_stop'
>> drivers/net/phy/phy.c:1619: warning: Function parameter or struct member 'clk_stop_enable' not described in 'phy_eee_rx_clock_stop'


vim +1619 drivers/net/phy/phy.c

  1609	
  1610	/**
  1611	 * phy_eee_rx_clock_stop() - configure PHY receive clock in LPI
  1612	 * phydev: target phy_device struct
  1613	 *
  1614	 * Configure whether the PHY may disable its receive clock during LPI mode,
  1615	 * See IEEE 802.3 sections 22.2.2.2, 35.2.2.10, and 45.2.3.1.4. Returns 0 or
  1616	 * negative error.
  1617	 */
  1618	int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable)
> 1619	{
  1620		/* Configure the PHY to stop receiving xMII
  1621		 * clock while it is signaling LPI.
  1622		 */
  1623		return phy_modify_mmd(phydev, MDIO_MMD_PCS, MDIO_CTRL1,
  1624				      MDIO_PCS_CTRL1_CLKSTOP_EN,
  1625				      clk_stop_enable ? MDIO_PCS_CTRL1_CLKSTOP_EN : 0);
  1626	}
  1627	EXPORT_SYMBOL_GPL(phy_eee_rx_clock_stop);
  1628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
