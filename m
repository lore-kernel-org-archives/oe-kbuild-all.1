Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F86F07C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294326; cv=none; b=kNcL9+ESNtYcHoEbjb0iJPFcCO4IV4CGAwP3k49OMgZRqsT4tiUcdx0Xr18J+0pfBFDt8EdRfYS2UFM18AOwR7Clo52+95KXwn6oWzFBrXaVd95ng4URU4Z9mmigmm5GXw/YXBZwTbbnbNz6wiqnu4/dOdIzNYWvGy93DSoRySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294326; c=relaxed/simple;
	bh=VPvvSxH9MtfxL1zql5vB2IFyHiyqhMrdGwR1X8PvNqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4TcM3mXLfEn3UctzdDpiGh9xQjNB6H3IJDS0BmRw+WiHKqIg2OLf0cZEncItxgB5VYXIcMUN86vW8AcLOXB5j/xUFz6kKWbKDJf94dOO9dp3XdF7lZ3zIM6BH5+b6JhX3nZBNjFbMJOkRNFVS9XIYykL2bXFfnUmbTr1JSM3U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUJs+HAu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUJs+HAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708294324; x=1739830324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VPvvSxH9MtfxL1zql5vB2IFyHiyqhMrdGwR1X8PvNqk=;
  b=WUJs+HAugEGFVAIJHqP4+3kBoT9TXCYpGMEjO5c3WYsUdq20armJhukq
   kU5wkyAVzno/ieip4zNGskBNUZBkjy3Bym48VmSDvr/GxbVcmR8ug1BKk
   4FMD+uXIUE31XODCvARapsG8JeNAQcp8Rlym/l8f/WpabhawOZb6Q7UKH
   2mxwzT6X4R01vP+xGfq5MXMst2aXN0fGqyh5Gfp67zgAI8Aki9TTqDkwQ
   LPSAUg59nnS4YxD9DvbcDHJd2yBMHYc7Fo5jz3da3g0882OSxCNYqYKyJ
   xVV4B4tA/nkuZP7gGa15owtJo86/CNd4Wb6JFEaE6JH2ImJvMAbZQbwBq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="12990488"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="12990488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 14:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="4717298"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Feb 2024 14:12:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbpOB-0003KM-0k;
	Sun, 18 Feb 2024 22:11:59 +0000
Date: Mon, 19 Feb 2024 06:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 1/3] net: phy: detach PHY driver OPs from
 phy_driver struct
Message-ID: <202402190645.Uwnc7GQ8-lkp@intel.com>
References: <20240217194116.8565-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217194116.8565-2-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-detach-PHY-driver-OPs-from-phy_driver-struct/20240218-034406
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240217194116.8565-2-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 1/3] net: phy: detach PHY driver OPs from phy_driver struct
config: i386-buildonly-randconfig-002-20240219 (https://download.01.org/0day-ci/archive/20240219/202402190645.Uwnc7GQ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190645.Uwnc7GQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190645.Uwnc7GQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ethtool/ioctl.c: In function 'ethtool_get_module_info_call':
>> net/ethtool/ioctl.c:2481:49: error: 'const struct phy_driver' has no member named 'module_info'
    2481 |         if (phydev && phydev->drv && phydev->drv->module_info)
         |                                                 ^~
   net/ethtool/ioctl.c:2482:35: error: 'const struct phy_driver' has no member named 'module_info'
    2482 |                 return phydev->drv->module_info(phydev, modinfo);
         |                                   ^~
   net/ethtool/ioctl.c: In function 'ethtool_get_module_eeprom_call':
>> net/ethtool/ioctl.c:2518:49: error: 'const struct phy_driver' has no member named 'module_eeprom'
    2518 |         if (phydev && phydev->drv && phydev->drv->module_eeprom)
         |                                                 ^~
   net/ethtool/ioctl.c:2519:35: error: 'const struct phy_driver' has no member named 'module_eeprom'
    2519 |                 return phydev->drv->module_eeprom(phydev, ee, data);
         |                                   ^~
   net/ethtool/ioctl.c: In function 'get_phy_tunable':
>> net/ethtool/ioctl.c:2762:63: error: 'const struct phy_driver' has no member named 'get_tunable'
    2762 |         phy_drv_tunable = phydev && phydev->drv && phydev->drv->get_tunable;
         |                                                               ^~
   net/ethtool/ioctl.c:2775:34: error: 'const struct phy_driver' has no member named 'get_tunable'
    2775 |                 ret = phydev->drv->get_tunable(phydev, &tuna, data);
         |                                  ^~
   net/ethtool/ioctl.c: In function 'set_phy_tunable':
   net/ethtool/ioctl.c:2801:63: error: 'const struct phy_driver' has no member named 'get_tunable'
    2801 |         phy_drv_tunable = phydev && phydev->drv && phydev->drv->get_tunable;
         |                                                               ^~
>> net/ethtool/ioctl.c:2815:34: error: 'const struct phy_driver' has no member named 'set_tunable'
    2815 |                 ret = phydev->drv->set_tunable(phydev, &tuna, data);
         |                                  ^~
--
   net/ethtool/linkstate.c: In function 'linkstate_get_sqi':
>> net/ethtool/linkstate.c:38:41: error: 'const struct phy_driver' has no member named 'get_sqi'
      38 |         if (!phydev->drv || !phydev->drv->get_sqi)
         |                                         ^~
   net/ethtool/linkstate.c:41:34: error: 'const struct phy_driver' has no member named 'get_sqi'
      41 |                 ret = phydev->drv->get_sqi(phydev);
         |                                  ^~
   net/ethtool/linkstate.c: In function 'linkstate_get_sqi_max':
>> net/ethtool/linkstate.c:56:41: error: 'const struct phy_driver' has no member named 'get_sqi_max'
      56 |         if (!phydev->drv || !phydev->drv->get_sqi_max)
         |                                         ^~
   net/ethtool/linkstate.c:59:34: error: 'const struct phy_driver' has no member named 'get_sqi_max'
      59 |                 ret = phydev->drv->get_sqi_max(phydev);
         |                                  ^~


vim +2481 net/ethtool/ioctl.c

c8f3a8c3106913 net/core/ethtool.c  Richard Cochran 2012-04-03  2471  
95dfc7effd88b4 net/ethtool/ioctl.c Andrew Lunn     2021-04-09  2472  int ethtool_get_module_info_call(struct net_device *dev,
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2473  				 struct ethtool_modinfo *modinfo)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2474  {
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2475  	const struct ethtool_ops *ops = dev->ethtool_ops;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2476  	struct phy_device *phydev = dev->phydev;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2477  
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2478  	if (dev->sfp_bus)
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2479  		return sfp_get_module_info(dev->sfp_bus, modinfo);
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2480  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02 @2481  	if (phydev && phydev->drv && phydev->drv->module_info)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2482  		return phydev->drv->module_info(phydev, modinfo);
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2483  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2484  	if (ops->get_module_info)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2485  		return ops->get_module_info(dev, modinfo);
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2486  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2487  	return -EOPNOTSUPP;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2488  }
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2489  
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2490  static int ethtool_get_module_info(struct net_device *dev,
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2491  				   void __user *useraddr)
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2492  {
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2493  	int ret;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2494  	struct ethtool_modinfo modinfo;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2495  
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2496  	if (copy_from_user(&modinfo, useraddr, sizeof(modinfo)))
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2497  		return -EFAULT;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2498  
95dfc7effd88b4 net/ethtool/ioctl.c Andrew Lunn     2021-04-09  2499  	ret = ethtool_get_module_info_call(dev, &modinfo);
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2500  	if (ret)
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2501  		return ret;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2502  
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2503  	if (copy_to_user(useraddr, &modinfo, sizeof(modinfo)))
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2504  		return -EFAULT;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2505  
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2506  	return 0;
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2507  }
41c3cb6d20f025 net/core/ethtool.c  Stuart Hodgson  2012-04-19  2508  
95dfc7effd88b4 net/ethtool/ioctl.c Andrew Lunn     2021-04-09  2509  int ethtool_get_module_eeprom_call(struct net_device *dev,
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2510  				   struct ethtool_eeprom *ee, u8 *data)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2511  {
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2512  	const struct ethtool_ops *ops = dev->ethtool_ops;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2513  	struct phy_device *phydev = dev->phydev;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2514  
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2515  	if (dev->sfp_bus)
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2516  		return sfp_get_module_eeprom(dev->sfp_bus, ee, data);
e679c9c1dbfdba net/core/ethtool.c  Russell King    2018-03-28  2517  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02 @2518  	if (phydev && phydev->drv && phydev->drv->module_eeprom)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2519  		return phydev->drv->module_eeprom(phydev, ee, data);
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2520  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2521  	if (ops->get_module_eeprom)
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2522  		return ops->get_module_eeprom(dev, ee, data);
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2523  
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2524  	return -EOPNOTSUPP;
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2525  }
2f4383667d57d1 net/core/ethtool.c  Ed Swierk       2015-01-02  2526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
