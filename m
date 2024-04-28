Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B417F28F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714289063; cv=none; b=OmRM8DZ3lCVVrawGeXIoEBPdFq/OvwH77AOambDYbwJsYcwzqRjHEvLkCbehbetXD5XwfNjmmoNi6YmqDGxnf+Y7spC8dNhHXoiwbQ+YhVaKLxNxP2A3YCHRX7J4+066P1zcMnZlpunVOjUFLrtbHPpSz/Gz6x71I7Yf2z1Q3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714289063; c=relaxed/simple;
	bh=kGOtdIhtiw7+KW8kDlOb4ox0WQfHeWAjtAQxtRDD860=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cngLqxcjbVzAfsH//KuTHXzfg8K+FtVEM5y6MNH/u9uCv2jyrzFCLvWe31MaBiV37+EaGdborpqpO4IMRcdMmZlyLmdaZHvJkiIwO1rcVVQIbyDvjpEGAzcMSiKxvf9+o87DgEPwn8cPTka8FhgAZqCFgcAwrhzG7YDSmI23CPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLE1LGpX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLE1LGpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714289062; x=1745825062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGOtdIhtiw7+KW8kDlOb4ox0WQfHeWAjtAQxtRDD860=;
  b=fLE1LGpXuY/IUmnQg+gdFxohd+8lBnhkucgfcgYh7gIyGu7+Ig8QQdEy
   y88bEzEhaHMcQyf0q29XS4uhBqPmcpeIfikYuHqbqxvBof/FcWCAIV1ru
   zyQJt5NdYHAQMFN6+BrXA92/2Ddgsw9OTHRUpHSZsBzv8Y91PVecfe6sa
   gVDnKqjK4vBFU6zdsjme6GeVoBl4lzmBlR3Hwr+OzWa7KDRvW8Zdm8E2Z
   dWERyHtThLjaAi/5qNKniwXnYGms3vOjhC4O6V/VNXagLDDCoy901+V6C
   ZN2CORjzTdupXY2JHsX6ldJt8HrpoBDS07dbNVE3UsxbjTGWnuW5typi4
   g==;
X-CSE-ConnectionGUID: iOvV6cV9TpOHbA+aNed1Gg==
X-CSE-MsgGUID: d0Ty7QYPTxKVWROSYQPP2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21389371"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="21389371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:24:21 -0700
X-CSE-ConnectionGUID: XWJPMFx5TFuwd93ztEucqg==
X-CSE-MsgGUID: Edr8El6UQWGAILDsCDqGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25807920"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2024 00:24:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0ytV-0005xm-0x;
	Sun, 28 Apr 2024 07:24:17 +0000
Date: Sun, 28 Apr 2024 15:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 78/91] drivers/net/phy/phylink.c:3769:40: error:
 'link_config' undeclared; did you mean 'phylink_config'?
Message-ID: <202404281521.bQRPAxhl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   a98a469e79c72ce3b4d0d35d9f4c6799c2848749
commit: 338a60c57d4cd93a06091616323db3a899da75e1 [78/91] net: phylink: use phy interface mode bitmaps for SFP PHYs
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404281521.bQRPAxhl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281521.bQRPAxhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281521.bQRPAxhl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/phylink.c: In function 'phylink_sfp_connect_phy':
>> drivers/net/phy/phylink.c:3769:40: error: 'link_config' undeclared (first use in this function); did you mean 'phylink_config'?
    3769 |                              phy_modes(link_config.interface));
         |                                        ^~~~~~~~~~~
   drivers/net/phy/phylink.c:98:67: note: in definition of macro 'phylink_printk'
      98 |                         netdev_printk(level, (pl)->netdev, fmt, ##__VA_ARGS__); \
         |                                                                   ^~~~~~~~~~~
   drivers/net/phy/phylink.c:3767:17: note: in expansion of macro 'phylink_info'
    3767 |                 phylink_info(pl, "switched to %s/%s link mode\n",
         |                 ^~~~~~~~~~~~
   drivers/net/phy/phylink.c:3769:40: note: each undeclared identifier is reported only once for each function it appears in
    3769 |                              phy_modes(link_config.interface));
         |                                        ^~~~~~~~~~~
   drivers/net/phy/phylink.c:98:67: note: in definition of macro 'phylink_printk'
      98 |                         netdev_printk(level, (pl)->netdev, fmt, ##__VA_ARGS__); \
         |                                                                   ^~~~~~~~~~~
   drivers/net/phy/phylink.c:3767:17: note: in expansion of macro 'phylink_info'
    3767 |                 phylink_info(pl, "switched to %s/%s link mode\n",
         |                 ^~~~~~~~~~~~


vim +3769 drivers/net/phy/phylink.c

  3706	
  3707	static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
  3708	{
  3709		DECLARE_PHY_INTERFACE_MASK(interfaces);
  3710		struct phylink *pl = upstream;
  3711		phy_interface_t interface;
  3712		int ret;
  3713	
  3714		/*
  3715		 * This is the new way of dealing with flow control for PHYs,
  3716		 * as described by Timur Tabi in commit 529ed1275263 ("net: phy:
  3717		 * phy drivers should not set SUPPORTED_[Asym_]Pause") except
  3718		 * using our validate call to the MAC, we rely upon the MAC
  3719		 * clearing the bits from both supported and advertising fields.
  3720		 */
  3721		phy_support_asym_pause(phy);
  3722	
  3723		/* Set the PHY's host supported interfaces */
  3724		phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
  3725				  pl->config->supported_interfaces);
  3726	
  3727		if (phy_interface_empty(phy->supported_interfaces)) {
  3728			phylink_dbg(pl, "copper SFP: PHY provides empty supported_interfaces\n");
  3729	
  3730			/* Do the initial configuration */
  3731			return phylink_sfp_config_phy(pl, phy);
  3732		}
  3733	
  3734		phylink_dbg(pl, "copper SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
  3735			    (int)PHY_INTERFACE_MODE_MAX,
  3736			    pl->config->supported_interfaces,
  3737			    (int)PHY_INTERFACE_MODE_MAX,
  3738			    phy->supported_interfaces);
  3739	
  3740		phy_interface_and(interfaces, phy->supported_interfaces,
  3741				  pl->config->supported_interfaces);
  3742		interface = phylink_choose_sfp_interface(pl, interfaces);
  3743		if (interface == PHY_INTERFACE_MODE_NA) {
  3744			phylink_err(pl,
  3745				    "selection of interface for PHY failed\n");
  3746			return -EINVAL;
  3747		}
  3748	
  3749		phylink_dbg(pl, "copper SFP: chosen %s interface\n",
  3750			    phy_modes(interface));
  3751	
  3752		ret = phylink_attach_phy(pl, phy, interface);
  3753		if (ret < 0)
  3754			return ret;
  3755	
  3756		ret = phylink_bringup_phy(pl, phy, interface);
  3757		if (ret) {
  3758			phy_detach(phy);
  3759			return ret;
  3760		}
  3761	
  3762		if (pl->req_link_an_mode != MLO_AN_INBAND ||
  3763		    pl->link_config.interface != interface) {
  3764			pl->link_config.interface = interface;
  3765			pl->req_link_an_mode = MLO_AN_INBAND;
  3766	
  3767			phylink_info(pl, "switched to %s/%s link mode\n",
  3768				     phylink_an_mode_str(pl->req_link_an_mode),
> 3769				     phy_modes(link_config.interface));
  3770		}
  3771	
  3772		if (!test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
  3773			phylink_mac_initial_config(pl, false);
  3774	
  3775		return 0;
  3776	}
  3777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
