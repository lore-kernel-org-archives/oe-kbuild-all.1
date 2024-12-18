Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B63597A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 04:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734496627; cv=none; b=PN1PYfDp7yoyd9UNNEUzgFMbGZfBzOZwVqZymzAMNXxbdKGGoH25Y3vmjdGBtZaigwYcpKrXrrohiz46pLSoVrrebACvkrcN0LDfsEnL6FwhIR1xNTKfflmgqaG3nubxtdW0es/J7dc1odNbkZzD7hAmBBjIS53G45sJe4QT3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734496627; c=relaxed/simple;
	bh=SsHx+mum4MU3PyjatDgs6OqZT2mcpCJirwe0ohylzJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EA0ByZG0e/e5jvK9Jfsyblm9EajMIkym0bJB7cYAkLGoeiUv+qk8QUu/MDCjs2KyOHTSJHBVlQLdP4JiQsETuED6lF7rQy7WRXvMNEIEx8lvzgSY32GzSNQidmTu485eSnSFiWPRjzVGckF/uFiawlRJZ1CZxsKAvjTZq8zMhjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPigvtwg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPigvtwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734496625; x=1766032625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsHx+mum4MU3PyjatDgs6OqZT2mcpCJirwe0ohylzJw=;
  b=WPigvtwgkgLUr6G8pK0Vy9AxEyXcMPEpl1Cl1qrNhEC3jBWZJ/JeUxHt
   jZxqdC4vJcWisEK7fV00EGlOlxYnIgy4Fy7RrrsqiA6fSunYpjs2yrO0S
   YV6KDGx3T5BC3lV51fN2FkSda6e5bWEwRquuuA+0hAmfokbKmbYTyKlEB
   wKzGcyikvm+jW0L5ePckrh+OJckqunShNXWqycR9qqBGSBAIxvjqgVwco
   aOHmylGMrPaVLyGesu+2XiwkuKXir2EPGLuq2taz0i8sm6o/yHAQO5G6b
   QLT+kI4tuvQX5YJ/+WeUeEeQdqq5M9i14kuzD1Qlubs7K2xQ/R4ptWQY1
   A==;
X-CSE-ConnectionGUID: +wLdvgZkQXyvGbOKQoPR/Q==
X-CSE-MsgGUID: twP4ifu9R/msq2jZg5KMtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38631577"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="38631577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 20:37:05 -0800
X-CSE-ConnectionGUID: bHOE0ya5R/Ga2/WEuOJDQw==
X-CSE-MsgGUID: bhEEjo36SzGgvP0xqfsF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="98170032"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2024 20:37:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNlnx-000G3w-0E;
	Wed, 18 Dec 2024 04:37:01 +0000
Date: Wed, 18 Dec 2024 12:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 1/42] drivers/net/pcs/pcs-xpcs.c:1528:
 warning: Function parameter or struct member 'skip_reset' not described in
 'xpcs_create_mdiodev'
Message-ID: <202412181235.tD0yIoPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   cc39c53db6bcd7f04407f1cae883e5d0af6db765
commit: a361dbacb6c107542963833516c5799a158876f0 [1/42] net: pcs: xpcs: enable xpcs reset skipping
config: arm-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181235.tD0yIoPq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181235.tD0yIoPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181235.tD0yIoPq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:1528: warning: Function parameter or struct member 'skip_reset' not described in 'xpcs_create_mdiodev'


vim +1528 drivers/net/pcs/pcs-xpcs.c

2cac15dae2f6e2 Vladimir Oltean       2021-06-02  1513  
9cad7275463ab9 Serge Semin           2024-07-01  1514  /**
9cad7275463ab9 Serge Semin           2024-07-01  1515   * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
9cad7275463ab9 Serge Semin           2024-07-01  1516   * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
9cad7275463ab9 Serge Semin           2024-07-01  1517   * @addr: device MDIO-bus ID
9cad7275463ab9 Serge Semin           2024-07-01  1518   * @interface: requested PHY interface
9cad7275463ab9 Serge Semin           2024-07-01  1519   *
9cad7275463ab9 Serge Semin           2024-07-01  1520   * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
9cad7275463ab9 Serge Semin           2024-07-01  1521   * the PCS device couldn't be found on the bus and other negative errno related
9cad7275463ab9 Serge Semin           2024-07-01  1522   * to the data allocation and MDIO-bus communications.
9cad7275463ab9 Serge Semin           2024-07-01  1523   */
a361dbacb6c107 Michael Sit Wei Hong  2021-06-09  1524  struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus,
a361dbacb6c107 Michael Sit Wei Hong  2021-06-09  1525  				    int addr,
a361dbacb6c107 Michael Sit Wei Hong  2021-06-09  1526  				    phy_interface_t interface,
a361dbacb6c107 Michael Sit Wei Hong  2021-06-09  1527  				    bool skip_reset)
9a5d500cffdb36 Russell King (Oracle  2023-05-26 @1528) {
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1529) 	struct mdio_device *mdiodev;
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1530) 	struct dw_xpcs *xpcs;
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1531) 
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1532) 	mdiodev = mdio_device_create(bus, addr);
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1533) 	if (IS_ERR(mdiodev))
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1534) 		return ERR_CAST(mdiodev);
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1535) 
a361dbacb6c107 Michael Sit Wei Hong  2021-06-09  1536  	xpcs = xpcs_create(mdiodev, interface, skip_reset);
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1537) 
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1538) 	/* xpcs_create() has taken a refcount on the mdiodev if it was
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1539) 	 * successful. If xpcs_create() fails, this will free the mdio
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1540) 	 * device here. In any case, we don't need to hold our reference
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1541) 	 * anymore, and putting it here will allow mdio_device_put() in
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1542) 	 * xpcs_destroy() to automatically free the mdio device.
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1543) 	 */
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1544) 	mdio_device_put(mdiodev);
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1545) 
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1546) 	return xpcs;
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1547) }
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1548) EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
9a5d500cffdb36 Russell King (Oracle  2023-05-26  1549) 

:::::: The code at line 1528 was first introduced by commit
:::::: 9a5d500cffdb3652215172b7c5829ca7b41e9efe net: pcs: xpcs: add xpcs_create_mdiodev()

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
