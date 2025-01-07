Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4A4964F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214882; cv=none; b=rNHs6wKWjv28iHaeQtr7Ce4xWcWTGMCWZkgsJyUphpJaOTVvA6RJsdPMmyusQvwIBXBmzi6YDvgxByZVbu9OrR69Nsyqn567b83J5YkGGsDEDQimA1cpL6lVmuKZCn/XOGOFxS6Hl5xpRH9gTN1k8XB/kswaVznWX2dkCFFR/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214882; c=relaxed/simple;
	bh=lu9RCwfEdMtG9lY1bTZU9D0EDzmoI7yyfGiZ/8oj2cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edHWfaP/17Bps+wCwaDGx/yK/xa3gV8mjRgvpSQy7DW8OddE0tLbSdRn3a+QEr0YQ8uxsXPIgOvsG2o2IiEcc1AqQ03+Wvew3dz021Ym906/zDeNBA0sCRK2VE2GMCwq49XB7etCGlGIHsmHi4iapBu05rZbnDIko86SgOywMaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEWcfrwZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEWcfrwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736214879; x=1767750879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lu9RCwfEdMtG9lY1bTZU9D0EDzmoI7yyfGiZ/8oj2cc=;
  b=UEWcfrwZZNZHAIjyCKLwZwIi7GovxJFVj3ogcXy2Z2fEUaAOPv5ZiN7Y
   lS7/XSGvHuCZEbZKweFas6S6heoBuAdi2R6DNjEJahCVtUtafzjHHRYfP
   RBxo4ylxK7FSlScqSfqkdIPtWeETxY5xxLk/wAnyGNrG2w0mFykgJJG7r
   s8Eygi6QKv/puggRrpnnOQDJutyV7Han7mLMFON6TQ1krcqUEMiX5JxO1
   kszWe9gebFdLrRyTPx7X3lrlFxJB4U3h/Y/gSTv0aO+koVi8JwK1IQaza
   XBilMnzR2ah1TX1DGyRjuZthsEe1wqKCWXvNh48jLChRBbh5/4pvt8GRT
   g==;
X-CSE-ConnectionGUID: eL9zLxvuTJSyN6ihloppPw==
X-CSE-MsgGUID: OwKcBVoLTvumWgNpS129fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36258959"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36258959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:54:35 -0800
X-CSE-ConnectionGUID: SpxZlKq1Q4iuxmMxE/F2uA==
X-CSE-MsgGUID: SSvHP5QbRu6F41IjzpUm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133520285"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 17:54:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUyne-000E6p-2w;
	Tue, 07 Jan 2025 01:54:30 +0000
Date: Tue, 7 Jan 2025 09:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Koppera <divya.koppera@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 4671/6658] drivers/net/phy/microchip_t1.c:1592:
 undefined reference to `mchp_rds_ptp_handle_interrupt'
Message-ID: <202501070946.TSUxKgmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e16367cfe0ce395f29d0482b78970cce8e1db73
commit: 9fc3d6fe802923b026ecac16e59c0acdd6744d5d [4671/6658] net: phy: microchip_t1 : Add initialization of ptp for lan887x
config: i386-randconfig-006-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070946.TSUxKgmH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070946.TSUxKgmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070946.TSUxKgmH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_handle_interrupt':
>> drivers/net/phy/microchip_t1.c:1592: undefined reference to `mchp_rds_ptp_handle_interrupt'
   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_config_intr':
>> drivers/net/phy/microchip_t1.c:1564: undefined reference to `mchp_rds_ptp_top_config_intr'
   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_phy_init':
>> drivers/net/phy/microchip_t1.c:1283: undefined reference to `mchp_rds_ptp_probe'


vim +1592 drivers/net/phy/microchip_t1.c

  1537	
  1538	static int lan887x_config_intr(struct phy_device *phydev)
  1539	{
  1540		struct lan887x_priv *priv = phydev->priv;
  1541		int rc;
  1542	
  1543		if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
  1544			/* Clear the interrupt status before enabling interrupts */
  1545			rc = phy_read_mmd(phydev, MDIO_MMD_VEND1, LAN887X_INT_STS);
  1546			if (rc < 0)
  1547				return rc;
  1548	
  1549			/* Unmask for enabling interrupt */
  1550			rc = phy_write_mmd(phydev, MDIO_MMD_VEND1, LAN887X_INT_MSK,
  1551					   (u16)~LAN887X_MX_CHIP_TOP_ALL_MSK);
  1552		} else {
  1553			rc = phy_write_mmd(phydev, MDIO_MMD_VEND1, LAN887X_INT_MSK,
  1554					   GENMASK(15, 0));
  1555			if (rc < 0)
  1556				return rc;
  1557	
  1558			rc = phy_read_mmd(phydev, MDIO_MMD_VEND1, LAN887X_INT_STS);
  1559		}
  1560		if (rc < 0)
  1561			return rc;
  1562	
  1563		if (phy_is_default_hwtstamp(phydev)) {
> 1564			return mchp_rds_ptp_top_config_intr(priv->clock,
  1565						LAN887X_INT_MSK,
  1566						LAN887X_INT_MSK_P1588_MOD_INT_MSK,
  1567						(phydev->interrupts ==
  1568						 PHY_INTERRUPT_ENABLED));
  1569		}
  1570	
  1571		return 0;
  1572	}
  1573	
  1574	static irqreturn_t lan887x_handle_interrupt(struct phy_device *phydev)
  1575	{
  1576		struct lan887x_priv *priv = phydev->priv;
  1577		int rc = IRQ_NONE;
  1578		int irq_status;
  1579	
  1580		irq_status = phy_read_mmd(phydev, MDIO_MMD_VEND1, LAN887X_INT_STS);
  1581		if (irq_status < 0) {
  1582			phy_error(phydev);
  1583			return IRQ_NONE;
  1584		}
  1585	
  1586		if (irq_status & LAN887X_MX_CHIP_TOP_LINK_MSK) {
  1587			phy_trigger_machine(phydev);
  1588			rc = IRQ_HANDLED;
  1589		}
  1590	
  1591		if (irq_status & LAN887X_INT_MSK_P1588_MOD_INT_MSK)
> 1592			rc = mchp_rds_ptp_handle_interrupt(priv->clock);
  1593	
  1594		return rc;
  1595	}
  1596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
