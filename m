Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17616DEB1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774485049; cv=none; b=abGdu0wy0AtekUfsC/RynPf2L4ti2mTW8Ytt/LUvC6Kqi9KM8CAGcSB5piu5fGUxP71vWz76JAWNk3nfmFqi0rLNyAMuKPQK8UmfnuYkXhOy8uXqyfxmvnOBxeLNMQfWpYmxOHJ0d/GTprn0FvI2ls56tVNgv7tElRIXc4t1mWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774485049; c=relaxed/simple;
	bh=7b2PUSjfrSYX9pU3cZDGmhYmHCrOPszxNx9/Bcy3gQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apfDMLsa6CWhoPHEVLjdJShRUCZBIoVrwIoAoILDlZ6J2P6qZ/FKTMvJfs6FRUOC0pEWJKmphpMOkPJzqnfT9wPpjVsO8l13vwlUt3NyKOjk2eQSJfAYI6pHOTGhttUScoNC/WOnbuP9hKH+1YEi1rlq96OOzXtlnJ6l+WrxDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZW0Zn10; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZW0Zn10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774485047; x=1806021047;
  h=date:from:to:cc:subject:message-id;
  bh=7b2PUSjfrSYX9pU3cZDGmhYmHCrOPszxNx9/Bcy3gQI=;
  b=mZW0Zn1077A5UjHPgG0Ld3x980garMRRVoFPjFiYeFJgfPk0dnnDXJe+
   yCez6LDl552mEKlJOYN7erpD0A/eh71QiWfT8RJb0jwPGtov7yneIWhmB
   4sWNLmPXae9evqqNk4tAzrfOeflrV6RJQGibsIgNUh8qXmdyUgtnrogV+
   GOWpiMNKaCWAg59ITt3SxxuaRAiBijaIR8PsuCsfThQxxIbj1azOw1iRW
   F5xiw3ofoGuRQLdFau+VE7HBJyyld8I1l4xfyenLHgyDjcYxLQNqikBk0
   NnjMKHjc3YrpaRkgIn7CUoXHqSC4K8EnoYrkaBwcz+3ocKI4HnYVov7d3
   A==;
X-CSE-ConnectionGUID: 8st7ZB8SQF2XfGI71fE1Ag==
X-CSE-MsgGUID: nrA5AuFtSEmig5JKTaKm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63087622"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="63087622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 17:30:46 -0700
X-CSE-ConnectionGUID: F3NVfRAeQmmlEyI2RMUAEw==
X-CSE-MsgGUID: MsBcQhEDSSSonpJXJzjAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="247870982"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2026 17:30:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5YcU-000000007tt-35Jx;
	Thu, 26 Mar 2026 00:30:42 +0000
Date: Thu, 26 Mar 2026 08:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 4962/9273]
 drivers/net/ethernet/broadcom/b44.c:2273:undefined reference to
 `fixed_phy_register_100fd'
Message-ID: <202603260809.wOJgK7GC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66ba480978ce390e631e870b740a3406e3eb6b01
commit: b87249aab4c0cbc8d9e4e745dcd1cb45ca29b8bd [4962/9273] net: mdio: remove selecting FIXED_PHY for FWNODE_MDIO
config: x86_64-randconfig-074-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260809.wOJgK7GC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260809.wOJgK7GC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260809.wOJgK7GC-lkp@intel.com/

Note: the linux-next/master HEAD 66ba480978ce390e631e870b740a3406e3eb6b01 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `b44_register_phy_one':
>> drivers/net/ethernet/broadcom/b44.c:2273:(.text+0x125a0f4): undefined reference to `fixed_phy_register_100fd'
   ld: vmlinux.o: in function `b44_unregister_phy_one':
>> drivers/net/ethernet/broadcom/b44.c:2323:(.text+0x1260042): undefined reference to `fixed_phy_unregister'


vim +2273 drivers/net/ethernet/broadcom/b44.c

86f4ea63e696db Hauke Mehrtens  2013-12-20  2233  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2234  static int b44_register_phy_one(struct b44 *bp)
86f4ea63e696db Hauke Mehrtens  2013-12-20  2235  {
3c1bcc8614db10 Andrew Lunn     2018-11-10  2236  	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
86f4ea63e696db Hauke Mehrtens  2013-12-20  2237  	struct mii_bus *mii_bus;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2238  	struct ssb_device *sdev = bp->sdev;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2239  	struct phy_device *phydev;
b04138b335203b Hauke Mehrtens  2013-12-20  2240  	struct ssb_sprom *sprom = &sdev->bus->sprom;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2241  	int err;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2242  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2243  	mii_bus = mdiobus_alloc();
86f4ea63e696db Hauke Mehrtens  2013-12-20  2244  	if (!mii_bus) {
86f4ea63e696db Hauke Mehrtens  2013-12-20  2245  		dev_err(sdev->dev, "mdiobus_alloc() failed\n");
86f4ea63e696db Hauke Mehrtens  2013-12-20  2246  		err = -ENOMEM;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2247  		goto err_out;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2248  	}
86f4ea63e696db Hauke Mehrtens  2013-12-20  2249  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2250  	mii_bus->priv = bp;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2251  	mii_bus->read = b44_mdio_read_phylib;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2252  	mii_bus->write = b44_mdio_write_phylib;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2253  	mii_bus->name = "b44_eth_mii";
86f4ea63e696db Hauke Mehrtens  2013-12-20  2254  	mii_bus->parent = sdev->dev;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2255  	mii_bus->phy_mask = ~(1 << bp->phy_addr);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2256  	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "%x", instance);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2257  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2258  	bp->mii_bus = mii_bus;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2259  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2260  	err = mdiobus_register(mii_bus);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2261  	if (err) {
86f4ea63e696db Hauke Mehrtens  2013-12-20  2262  		dev_err(sdev->dev, "failed to register MII bus\n");
e7f4dc3536a400 Andrew Lunn     2016-01-06  2263  		goto err_out_mdiobus;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2264  	}
86f4ea63e696db Hauke Mehrtens  2013-12-20  2265  
10d2f15afba239 Heiner Kallweit 2025-10-30  2266  	phydev = mdiobus_get_phy(bp->mii_bus, bp->phy_addr);
10d2f15afba239 Heiner Kallweit 2025-10-30  2267  	if (!phydev &&
10d2f15afba239 Heiner Kallweit 2025-10-30  2268  	    sprom->boardflags_lo & (B44_BOARDFLAG_ROBO | B44_BOARDFLAG_ADM)) {
b04138b335203b Hauke Mehrtens  2013-12-20  2269  		dev_info(sdev->dev,
b04138b335203b Hauke Mehrtens  2013-12-20  2270  			 "could not find PHY at %i, use fixed one\n",
b04138b335203b Hauke Mehrtens  2013-12-20  2271  			 bp->phy_addr);
b04138b335203b Hauke Mehrtens  2013-12-20  2272  
10d2f15afba239 Heiner Kallweit 2025-10-30 @2273  		phydev = fixed_phy_register_100fd();
10d2f15afba239 Heiner Kallweit 2025-10-30  2274  		if (!IS_ERR(phydev))
10d2f15afba239 Heiner Kallweit 2025-10-30  2275  			bp->phy_addr = phydev->mdio.addr;
b04138b335203b Hauke Mehrtens  2013-12-20  2276  	}
86f4ea63e696db Hauke Mehrtens  2013-12-20  2277  
10d2f15afba239 Heiner Kallweit 2025-10-30  2278  	if (IS_ERR_OR_NULL(phydev))
10d2f15afba239 Heiner Kallweit 2025-10-30  2279  		err = -ENODEV;
10d2f15afba239 Heiner Kallweit 2025-10-30  2280  	else
10d2f15afba239 Heiner Kallweit 2025-10-30  2281  		err = phy_connect_direct(bp->dev, phydev, &b44_adjust_link,
86f4ea63e696db Hauke Mehrtens  2013-12-20  2282  					 PHY_INTERFACE_MODE_MII);
10d2f15afba239 Heiner Kallweit 2025-10-30  2283  	if (err) {
86f4ea63e696db Hauke Mehrtens  2013-12-20  2284  		dev_err(sdev->dev, "could not attach PHY at %i\n",
86f4ea63e696db Hauke Mehrtens  2013-12-20  2285  			bp->phy_addr);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2286  		goto err_out_mdiobus_unregister;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2287  	}
86f4ea63e696db Hauke Mehrtens  2013-12-20  2288  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2289  	/* mask with MAC supported features */
3c1bcc8614db10 Andrew Lunn     2018-11-10  2290  	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, mask);
3c1bcc8614db10 Andrew Lunn     2018-11-10  2291  	linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, mask);
3c1bcc8614db10 Andrew Lunn     2018-11-10  2292  	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, mask);
3c1bcc8614db10 Andrew Lunn     2018-11-10  2293  	linkmode_set_bit(ETHTOOL_LINK_MODE_MII_BIT, mask);
3c1bcc8614db10 Andrew Lunn     2018-11-10  2294  	linkmode_and(phydev->supported, phydev->supported, mask);
3c1bcc8614db10 Andrew Lunn     2018-11-10  2295  	linkmode_copy(phydev->advertising, phydev->supported);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2296  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2297  	bp->old_link = 0;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2298  
2220943a21e26d Andrew Lunn     2016-01-06  2299  	phy_attached_info(phydev);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2300  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2301  	return 0;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2302  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2303  err_out_mdiobus_unregister:
86f4ea63e696db Hauke Mehrtens  2013-12-20  2304  	mdiobus_unregister(mii_bus);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2305  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2306  err_out_mdiobus:
86f4ea63e696db Hauke Mehrtens  2013-12-20  2307  	mdiobus_free(mii_bus);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2308  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2309  err_out:
86f4ea63e696db Hauke Mehrtens  2013-12-20  2310  	return err;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2311  }
86f4ea63e696db Hauke Mehrtens  2013-12-20  2312  
86f4ea63e696db Hauke Mehrtens  2013-12-20  2313  static void b44_unregister_phy_one(struct b44 *bp)
86f4ea63e696db Hauke Mehrtens  2013-12-20  2314  {
86f4ea63e696db Hauke Mehrtens  2013-12-20  2315  	struct mii_bus *mii_bus = bp->mii_bus;
10d2f15afba239 Heiner Kallweit 2025-10-30  2316  	struct net_device *dev = bp->dev;
10d2f15afba239 Heiner Kallweit 2025-10-30  2317  	struct phy_device *phydev;
10d2f15afba239 Heiner Kallweit 2025-10-30  2318  
10d2f15afba239 Heiner Kallweit 2025-10-30  2319  	phydev = dev->phydev;
86f4ea63e696db Hauke Mehrtens  2013-12-20  2320  
10d2f15afba239 Heiner Kallweit 2025-10-30  2321  	phy_disconnect(phydev);
10d2f15afba239 Heiner Kallweit 2025-10-30  2322  	if (phy_is_pseudo_fixed_link(phydev))
10d2f15afba239 Heiner Kallweit 2025-10-30 @2323  		fixed_phy_unregister(phydev);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2324  	mdiobus_unregister(mii_bus);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2325  	mdiobus_free(mii_bus);
86f4ea63e696db Hauke Mehrtens  2013-12-20  2326  }
86f4ea63e696db Hauke Mehrtens  2013-12-20  2327  

:::::: The code at line 2273 was first introduced by commit
:::::: 10d2f15afba2391471576846fd22d49631e34b21 net: b44: register a fixed phy using fixed_phy_register_100fd if needed

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
