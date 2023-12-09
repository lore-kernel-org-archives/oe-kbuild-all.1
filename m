Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341117991
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGDEtHEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702146309; x=1733682309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vbzVRtEGbyp8oBTsFgZyx6fBc9AnFGZwNj9K6jLYIKw=;
  b=gGDEtHEzQO2AY/1PLyLb0XfFJ7tCIOMUZEooU/J7REQfYQQPwhp8vchw
   wk/ZOA+B7A+ZagXa55uui/i+ioAXDuLEDGsSFuupyLjGsRx/bqIMs7rYy
   J/i2G2YfYiEoOmKmfZEjTUMHZqxTh83xvUhcryi4JCpxLM7tHCbkxI2TH
   CbpVaxXwrNnFm+TuIvasUP5xGwKtA9m6fizr0eD8G3zzvigspTSlwqRL8
   LU4bZEDSukCWPsBYZAKxYy0OqpnDIaFc5RXqWUuvdF7TssaR+UsiWMsIc
   Dm1TF5jDNz/swx9Qer0H46ArvTyKQnv20mpQcOiH1ZiDrrP3QJgEERmy2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1592442"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1592442"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 10:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="722202666"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="722202666"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Dec 2023 10:25:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC20c-000Fkv-03;
	Sat, 09 Dec 2023 18:25:02 +0000
Date: Sun, 10 Dec 2023 02:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: phy: at803x: add LED support for
 qca808x
Message-ID: <202312100229.wXUmV6MA-lkp@intel.com>
References: <20231209014828.28194-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209014828.28194-2-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-at803x-add-LED-support-for-qca808x/20231209-095014
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231209014828.28194-2-ansuelsmth%40gmail.com
patch subject: [net-next PATCH 2/2] net: phy: at803x: add LED support for qca808x
config: x86_64-randconfig-r132-20231209 (https://download.01.org/0day-ci/archive/20231210/202312100229.wXUmV6MA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100229.wXUmV6MA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100229.wXUmV6MA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/at803x.c:2270:11: error: use of undeclared identifier 'TRIGGER_NETDEV_LINK_2500'
                   set_bit(TRIGGER_NETDEV_LINK_2500, rules);
                           ^
   1 error generated.


vim +/TRIGGER_NETDEV_LINK_2500 +2270 drivers/net/phy/at803x.c

  2242	
  2243	static int qca808x_led_hw_control_get(struct phy_device *phydev, u8 index,
  2244					      unsigned long *rules)
  2245	{
  2246		u16 reg;
  2247		int val;
  2248	
  2249		if (index > 2)
  2250			return -EINVAL;
  2251	
  2252		/* Check if we have hw control enabled */
  2253		if (qca808x_led_hw_control_status(phydev, index))
  2254			return -EINVAL;
  2255	
  2256		reg = QCA808X_MMD7_LED_CTRL(index);
  2257	
  2258		val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
  2259		if (val & QCA808X_LED_TX_BLINK)
  2260			set_bit(TRIGGER_NETDEV_TX, rules);
  2261		if (val & QCA808X_LED_RX_BLINK)
  2262			set_bit(TRIGGER_NETDEV_RX, rules);
  2263		if (val & QCA808X_LED_SPEED10_ON)
  2264			set_bit(TRIGGER_NETDEV_LINK_10, rules);
  2265		if (val & QCA808X_LED_SPEED100_ON)
  2266			set_bit(TRIGGER_NETDEV_LINK_100, rules);
  2267		if (val & QCA808X_LED_SPEED1000_ON)
  2268			set_bit(TRIGGER_NETDEV_LINK_1000, rules);
  2269		if (val & QCA808X_LED_SPEED2500_ON)
> 2270			set_bit(TRIGGER_NETDEV_LINK_2500, rules);
  2271		if (val & QCA808X_LED_HALF_DUPLEX_ON)
  2272			set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
  2273		if (val & QCA808X_LED_FULL_DUPLEX_ON)
  2274			set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
  2275	
  2276		return 0;
  2277	}
  2278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
