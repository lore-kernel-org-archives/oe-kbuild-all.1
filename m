Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D751F5859
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742036320; cv=none; b=MIY/Q9qpK9B5g9jiGa0EXW7Gg6nphbtKddaZ43nFsam1ea22qDnQrRXHojvtGSjtQPdTy5meBlO+I2CJKVYVqR+ofzzw+iQkfGrk9gwYiLfMSjZ7ZfILYP6QXOTbrDLsb+uEVGpCJjPE+qfzMgUZ13JH9YAPtuWakcg0UXhT2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742036320; c=relaxed/simple;
	bh=zPk2Re0M9KaNbfwrY4fyGI1YDs36bkwYcu+v0qYpRcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLEDlsddrEKQzRsL+OX0LFJuRm5G5lBmyYlFqIejoRtbjKrH0641FIoNLBwcpiVhJlhOCyKpC+F1WRuZsJFWbNZ0ZgJ9/BodfrK1BY9feW4aKXDBVmLp7W29oIUgtIsGnWfC51dX47EBkT+dn4wreYZlntT5w+L4kH9uSTPFxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvwyMGSn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvwyMGSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742036318; x=1773572318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zPk2Re0M9KaNbfwrY4fyGI1YDs36bkwYcu+v0qYpRcA=;
  b=nvwyMGSn8aYcGE7lKqDE0ofnu+a5/2m7ivBPJCyQk77iFwd9g19FQPp+
   oIASVcgQWMvCwzykb45SpyyKgM5KcooVX+vpjXMz4G2a4VbCOvsdrgyDK
   O0YYoKNQopIijhnGAlqrgrrIwaaVkaZkCZIrADBSy8gaNFlv+HGl41QY5
   h0VlJ8sA/Ukipg2oOztm2Ye33M3IgA/2f/xw2gX4U4nPkJJp2PsEcIA91
   ORMBRh1zWotYkVRKepCtL2EMzIIxWYmc+/7IBsDq+oyqr694pDS9D4Qq3
   sLTO70RoSJvZ+LU1rcpQR/n3RSHWlaNq3p/XxTUCxFNuQZSWbcrSto4zB
   g==;
X-CSE-ConnectionGUID: rUCG+iuaToOV6oiT+2s+lA==
X-CSE-MsgGUID: w+pqAdjtTvigahsguQqjgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60585517"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="60585517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 03:58:24 -0700
X-CSE-ConnectionGUID: Elox2mw/SgOIIoSim2DqAQ==
X-CSE-MsgGUID: bD9fuRWLQiGuBnYOKRxH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121550360"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2025 03:58:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPDf-000BI3-0n;
	Sat, 15 Mar 2025 10:58:19 +0000
Date: Sat, 15 Mar 2025 18:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
	Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH net-next v3 6/7] net: usb: lan78xx: Transition
 get/set_pause to phylink
Message-ID: <202503151846.f7B5hHIU-lkp@intel.com>
References: <20250310115737.784047-7-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310115737.784047-7-o.rempel@pengutronix.de>

Hi Oleksij,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-usb-lan78xx-Convert-to-PHYlink-for-improved-PHY-and-MAC-management/20250310-200116
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250310115737.784047-7-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v3 6/7] net: usb: lan78xx: Transition get/set_pause to phylink
config: i386-randconfig-006-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151846.f7B5hHIU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151846.f7B5hHIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151846.f7B5hHIU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_set_link_ksettings':
   drivers/net/usb/lan78xx.c:1874: undefined reference to `phylink_ethtool_ksettings_set'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_get_link_ksettings':
   drivers/net/usb/lan78xx.c:1866: undefined reference to `phylink_ethtool_ksettings_get'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_set_pause':
>> drivers/net/usb/lan78xx.c:1890: undefined reference to `phylink_ethtool_set_pauseparam'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_get_pause':
>> drivers/net/usb/lan78xx.c:1882: undefined reference to `phylink_ethtool_get_pauseparam'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_open':
   drivers/net/usb/lan78xx.c:3205: undefined reference to `phylink_start'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_stop':
   drivers/net/usb/lan78xx.c:3275: undefined reference to `phylink_stop'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_disconnect':
   drivers/net/usb/lan78xx.c:4300: undefined reference to `phylink_stop'
   ld: drivers/net/usb/lan78xx.c:4301: undefined reference to `phylink_disconnect_phy'
   ld: drivers/net/usb/lan78xx.c:4312: undefined reference to `phylink_destroy'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_reset_resume':
   drivers/net/usb/lan78xx.c:5098: undefined reference to `phylink_start'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_phy_init':
   drivers/net/usb/lan78xx.c:2603: undefined reference to `phylink_connect_phy'
   ld: drivers/net/usb/lan78xx.c:2571: undefined reference to `phylink_set_fixed_link'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_phylink_setup':
   drivers/net/usb/lan78xx.c:2541: undefined reference to `phylink_create'
   ld: drivers/net/usb/lan78xx.o: in function `lan78xx_probe':
   drivers/net/usb/lan78xx.c:4534: undefined reference to `phylink_disconnect_phy'
   ld: drivers/net/usb/lan78xx.c:4536: undefined reference to `phylink_destroy'


vim +1890 drivers/net/usb/lan78xx.c

  1876	
  1877	static void lan78xx_get_pause(struct net_device *net,
  1878				      struct ethtool_pauseparam *pause)
  1879	{
  1880		struct lan78xx_net *dev = netdev_priv(net);
  1881	
> 1882		phylink_ethtool_get_pauseparam(dev->phylink, pause);
  1883	}
  1884	
  1885	static int lan78xx_set_pause(struct net_device *net,
  1886				     struct ethtool_pauseparam *pause)
  1887	{
  1888		struct lan78xx_net *dev = netdev_priv(net);
  1889	
> 1890		return phylink_ethtool_set_pauseparam(dev->phylink, pause);
  1891	}
  1892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
