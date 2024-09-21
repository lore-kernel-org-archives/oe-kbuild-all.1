Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56816DEDF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726932250; cv=none; b=frJ3Xw403Kvjn7PoSDRfihDO4WssU8Mvvs6EPG1LRIL0M9y6rzg6RxIvw/DozAUjFZ17AGCNLqDOighV0d5MbvgPWU2QkvQ3XhYwOjTsL0NyeHk+txpkqxAHhl3n2K5SxxGsWhKHH6ycWwEbxqzxqFVTLss9qbjiHGa81g1IBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726932250; c=relaxed/simple;
	bh=9M8xY4X6DlGBTIWQx481WUGS7WaIMhXPF5MZNj2Hggk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QbjmZLZN9GN1oE1hdedEWuOAh7712VtlmmbB1H1UmgToHqqCgydZyHsUOJFdOZZLYToXMNoairechIhCct09R6gtyElnnCrrayuQGyVrWpaDZ8xCWzqhMYy+VcO3YDtnyQLszZ3AcZLdvWtDAL1ReeVzCudnhPgmcl4fZ0LYT+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbbNHG//; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbbNHG//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726932248; x=1758468248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9M8xY4X6DlGBTIWQx481WUGS7WaIMhXPF5MZNj2Hggk=;
  b=HbbNHG//KN8S144ytTwoO8rigWdyMzZxVyWpsEf+L0NegsEkL20DUMyD
   AIbAG2k1c7iE91f6pbVH3wLm0eTGSQbTdUF74j8MgskUrM8jZn2p/ieP1
   mS+9aycWfYZ12SOE9VLj7+wQlQDHYqfg0pUyIMnYuotdwPBuwqCyk1q2f
   TkYXDRoPl+TChV9G+XSz3x9W5/mgdcfUxe/25fICjyCJFxAjnUjqHA2ll
   1ygUFVPZ2GogXiHuPtKhvuY+9abtjWHz8AK75bH9iKFVN89MSBJ8dijRF
   Pm9wg+ulVZuKC88bWbiaZ/DrV6tBWP+LGi7FrS2rC1J0qmv2jcPEZ4JUi
   Q==;
X-CSE-ConnectionGUID: DxbsIbI/RROmuq8VLSJ8nA==
X-CSE-MsgGUID: UAyCXKMHRCuA314EjAw7iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37296184"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="37296184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:23:55 -0700
X-CSE-ConnectionGUID: fBKpoB8VQCWyaZl3q1z4bQ==
X-CSE-MsgGUID: swrj/mANTD2HpzpX5M0kDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70650593"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Sep 2024 08:23:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1xe-000FX1-0P;
	Sat, 21 Sep 2024 15:23:50 +0000
Date: Sat, 21 Sep 2024 23:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 11265/12481]
 drivers/net/ethernet/cirrus/ep93xx_eth.c:805:40: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202409212354.9CiUem7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: 770e709e38bf90d3144d82218550730290bc1918 [11265/12481] net: cirrus: add DT support for Cirrus EP93xx
config: arm-randconfig-r112-20240921 (https://download.01.org/0day-ci/archive/20240921/202409212354.9CiUem7B-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce: (https://download.01.org/0day-ci/archive/20240921/202409212354.9CiUem7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212354.9CiUem7B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/cirrus/ep93xx_eth.c:805:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned char const [usertype] *addr @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/cirrus/ep93xx_eth.c:805:40: sparse:     expected unsigned char const [usertype] *addr
   drivers/net/ethernet/cirrus/ep93xx_eth.c:805:40: sparse:     got void [noderef] __iomem *

vim +805 drivers/net/ethernet/cirrus/ep93xx_eth.c

   766	
   767	static int ep93xx_eth_probe(struct platform_device *pdev)
   768	{
   769		struct net_device *dev;
   770		struct ep93xx_priv *ep;
   771		struct resource *mem;
   772		void __iomem *base_addr;
   773		struct device_node *np;
   774		u32 phy_id;
   775		int irq;
   776		int err;
   777	
   778		if (pdev == NULL)
   779			return -ENODEV;
   780	
   781		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   782		irq = platform_get_irq(pdev, 0);
   783		if (!mem || irq < 0)
   784			return -ENXIO;
   785	
   786		base_addr = ioremap(mem->start, resource_size(mem));
   787		if (!base_addr)
   788			return dev_err_probe(&pdev->dev, -EIO, "Failed to ioremap ethernet registers\n");
   789	
   790		np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
   791		if (!np)
   792			return dev_err_probe(&pdev->dev, -ENODEV, "Please provide \"phy-handle\"\n");
   793	
   794		err = of_property_read_u32(np, "reg", &phy_id);
   795		of_node_put(np);
   796		if (err)
   797			return dev_err_probe(&pdev->dev, -ENOENT, "Failed to locate \"phy_id\"\n");
   798	
   799		dev = alloc_etherdev(sizeof(struct ep93xx_priv));
   800		if (dev == NULL) {
   801			err = -ENOMEM;
   802			goto err_out;
   803		}
   804	
 > 805		eth_hw_addr_set(dev, base_addr + 0x50);
   806		dev->ethtool_ops = &ep93xx_ethtool_ops;
   807		dev->netdev_ops = &ep93xx_netdev_ops;
   808		dev->features |= NETIF_F_SG | NETIF_F_HW_CSUM;
   809	
   810		ep = netdev_priv(dev);
   811		ep->dev = dev;
   812		SET_NETDEV_DEV(dev, &pdev->dev);
   813		netif_napi_add(dev, &ep->napi, ep93xx_poll);
   814	
   815		platform_set_drvdata(pdev, dev);
   816	
   817		ep->res = request_mem_region(mem->start, resource_size(mem),
   818					     dev_name(&pdev->dev));
   819		if (ep->res == NULL) {
   820			dev_err(&pdev->dev, "Could not reserve memory region\n");
   821			err = -ENOMEM;
   822			goto err_out;
   823		}
   824	
   825		ep->base_addr = base_addr;
   826		ep->irq = irq;
   827	
   828		ep->mii.phy_id = phy_id;
   829		ep->mii.phy_id_mask = 0x1f;
   830		ep->mii.reg_num_mask = 0x1f;
   831		ep->mii.dev = dev;
   832		ep->mii.mdio_read = ep93xx_mdio_read;
   833		ep->mii.mdio_write = ep93xx_mdio_write;
   834		ep->mdc_divisor = 40;	/* Max HCLK 100 MHz, min MDIO clk 2.5 MHz.  */
   835	
   836		if (is_zero_ether_addr(dev->dev_addr))
   837			eth_hw_addr_random(dev);
   838	
   839		err = register_netdev(dev);
   840		if (err) {
   841			dev_err(&pdev->dev, "Failed to register netdev\n");
   842			goto err_out;
   843		}
   844	
   845		printk(KERN_INFO "%s: ep93xx on-chip ethernet, IRQ %d, %pM\n",
   846				dev->name, ep->irq, dev->dev_addr);
   847	
   848		return 0;
   849	
   850	err_out:
   851		ep93xx_eth_remove(pdev);
   852		return err;
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
