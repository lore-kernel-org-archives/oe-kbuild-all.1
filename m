Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9BEBF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiZmgysa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822611; x=1733358611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdXpbLSSPrhcTHgM8fSyObWcIrwsztSdnomr2m3TkXA=;
  b=aiZmgysa1pPytvqr94a/3ShYT3z7X2R20rKzWRbzL5MNvlPSke8MZCn9
   lwroB3VT2SI3XMh5MrtjfeLNJu4HpRA53CIYWmdYvruoXxzdL7kuMpbwW
   /Hf0W/284lGs8RtD+J/h6db+SX/kl7SaBYQ8nl+N0M6+/UpT5F742XdEy
   Wn4NvFzjEKd6pBlCFQ29inSAQT0g8nrB2P5ehSUVNgrP2SBY9MiN3Kdmd
   d+OAjWOfATp1lHqsHbF3rSMZf3wQvUKdPR+VYADNTKeb5O94xEJ4ZWoPm
   ilBsMhdAmWFzOisOgrp2IXYlC+/MEupk09AYaUDqBLuTJkn7MDq1FHoSt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374163886"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374163886"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771112925"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="771112925"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 16:30:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfnd-0009x4-1v;
	Wed, 06 Dec 2023 00:30:01 +0000
Date: Wed, 6 Dec 2023 08:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Serge Semin <fancer.lancer@gmail.com>, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 11/16] net: pcs: xpcs: Change
 xpcs_create_mdiodev() suffix to "byaddr"
Message-ID: <202312060843.C3pV7P8b-lkp@intel.com>
References: <20231205103559.9605-12-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205103559.9605-12-fancer.lancer@gmail.com>

Hi Serge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/net-pcs-xpcs-Drop-sentinel-entry-from-2500basex-ifaces-list/20231205-183808
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231205103559.9605-12-fancer.lancer%40gmail.com
patch subject: [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
config: x86_64-randconfig-006-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060843.C3pV7P8b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060843.C3pV7P8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060843.C3pV7P8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: In function 'txgbe_mdio_pcs_init':
   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:9: error: implicit declaration of function 'xpcs_create_mdiodev'; did you mean 'xpcs_create_byaddr'? [-Werror=implicit-function-declaration]
     xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
            ^~~~~~~~~~~~~~~~~~~
            xpcs_create_byaddr
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
          ^
   cc1: some warnings being treated as errors


vim +150 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c

854cace61387b6 Jiawen Wu      2023-06-06  121  
854cace61387b6 Jiawen Wu      2023-06-06  122  static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
854cace61387b6 Jiawen Wu      2023-06-06  123  {
854cace61387b6 Jiawen Wu      2023-06-06  124  	struct mii_bus *mii_bus;
854cace61387b6 Jiawen Wu      2023-06-06  125  	struct dw_xpcs *xpcs;
854cace61387b6 Jiawen Wu      2023-06-06  126  	struct pci_dev *pdev;
854cace61387b6 Jiawen Wu      2023-06-06  127  	struct wx *wx;
854cace61387b6 Jiawen Wu      2023-06-06  128  	int ret = 0;
854cace61387b6 Jiawen Wu      2023-06-06  129  
854cace61387b6 Jiawen Wu      2023-06-06  130  	wx = txgbe->wx;
854cace61387b6 Jiawen Wu      2023-06-06  131  	pdev = wx->pdev;
854cace61387b6 Jiawen Wu      2023-06-06  132  
854cace61387b6 Jiawen Wu      2023-06-06  133  	mii_bus = devm_mdiobus_alloc(&pdev->dev);
854cace61387b6 Jiawen Wu      2023-06-06  134  	if (!mii_bus)
854cace61387b6 Jiawen Wu      2023-06-06  135  		return -ENOMEM;
854cace61387b6 Jiawen Wu      2023-06-06  136  
854cace61387b6 Jiawen Wu      2023-06-06  137  	mii_bus->name = "txgbe_pcs_mdio_bus";
854cace61387b6 Jiawen Wu      2023-06-06  138  	mii_bus->read_c45 = &txgbe_pcs_read;
854cace61387b6 Jiawen Wu      2023-06-06  139  	mii_bus->write_c45 = &txgbe_pcs_write;
854cace61387b6 Jiawen Wu      2023-06-06  140  	mii_bus->parent = &pdev->dev;
854cace61387b6 Jiawen Wu      2023-06-06  141  	mii_bus->phy_mask = ~0;
854cace61387b6 Jiawen Wu      2023-06-06  142  	mii_bus->priv = wx;
854cace61387b6 Jiawen Wu      2023-06-06  143  	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
d8c21ef7b2b147 Xiongfeng Wang 2023-08-08  144  		 pci_dev_id(pdev));
854cace61387b6 Jiawen Wu      2023-06-06  145  
854cace61387b6 Jiawen Wu      2023-06-06  146  	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
854cace61387b6 Jiawen Wu      2023-06-06  147  	if (ret)
854cace61387b6 Jiawen Wu      2023-06-06  148  		return ret;
854cace61387b6 Jiawen Wu      2023-06-06  149  
854cace61387b6 Jiawen Wu      2023-06-06 @150  	xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
854cace61387b6 Jiawen Wu      2023-06-06  151  	if (IS_ERR(xpcs))
854cace61387b6 Jiawen Wu      2023-06-06  152  		return PTR_ERR(xpcs);
854cace61387b6 Jiawen Wu      2023-06-06  153  
854cace61387b6 Jiawen Wu      2023-06-06  154  	txgbe->xpcs = xpcs;
854cace61387b6 Jiawen Wu      2023-06-06  155  
854cace61387b6 Jiawen Wu      2023-06-06  156  	return 0;
854cace61387b6 Jiawen Wu      2023-06-06  157  }
854cace61387b6 Jiawen Wu      2023-06-06  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
