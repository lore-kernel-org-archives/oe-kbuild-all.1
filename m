Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253C2FBDF9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334653; cv=none; b=iyN5eeVWYS7JVlrYVssWavlO/Tf+o+tuTCeOWj2N30GInWaA9RK6GBe4H6PvpihxERdLn3++UhdSC6nX4x/R0lONmUZ1fDxSpBqFHeTX3zK10SEMil/3c99V5kkm1QyYy0O7KI6t29tfQ1xTOjcrKCnP3H9ESNJkJA8ayYgSLQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334653; c=relaxed/simple;
	bh=f2u08+RYYFb3XP4o1WF8GZqeA/EFN/zPoXD1jP7wUds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVKMEEgyRS6vmWf9uLXSsm5YHHHswyronwoKCP2zg2lZbdIZNsRv8Okl2VcquCmnwv0UM4Ap1be3PGnDr0ffJOaQ1Ryp/grtQnmMDV6n+/FGEPUjO8P57+SFkiMrOA3Cb7Y7mB1YTX1Vchi6ApP1rfcrjajjK61f/uuo2ABHu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORyJh5la; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORyJh5la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762334650; x=1793870650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f2u08+RYYFb3XP4o1WF8GZqeA/EFN/zPoXD1jP7wUds=;
  b=ORyJh5laNA5eSwOOifpJCKP+Ze36ClRmz0+ZowmEsFGsdQpyFuIIuV65
   1NVu+BjrstnDRP9M17TBuM9hj9Iy1WgJ5XPg7FO3JMPZA/5xCCxEtPavD
   ygTXf8ftGM0bDq1tT1HOFxY5itTde4NJJj/+CgEDJ2O9yH6Hes2B2i+ie
   YaTcAXjoDjHVL/8ToScOSlasDLqJwSljVuEKa4Ymi18xPw/WQvhFfyBNr
   WugsrADef3UshmDkb0paIh3ryJbeAHlPRHbgZcMzJBRuxqZ1/fmgj5LN7
   riLa90bf0Y1i0xf+MZMal4zCvEZ0+0M1tkboFpdSP8KpuFDOTVioX1Tbq
   g==;
X-CSE-ConnectionGUID: rKdtfPoxScKT9e0jx8INpQ==
X-CSE-MsgGUID: M6tGtGSPTz+zuYhyrLB+Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89906135"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="89906135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:23:38 -0800
X-CSE-ConnectionGUID: QJXmB5/0QM6xbbAas8JjKQ==
X-CSE-MsgGUID: mKeDEpWBQe+vJ9wwhyUWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="192569646"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2025 01:23:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGZjr-000SMW-0H;
	Wed, 05 Nov 2025 09:23:35 +0000
Date: Wed, 5 Nov 2025 17:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6 v7] ACPI: extlog: Trace CPER PCI Express Error Section
Message-ID: <202511051721.LfgJrwLO-lkp@intel.com>
References: <20251104182446.863422-3-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104182446.863422-3-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on c9cfc122f03711a5124b4aafab3211cf4d35a2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251105-022733
base:   c9cfc122f03711a5124b4aafab3211cf4d35a2ac
patch link:    https://lore.kernel.org/r/20251104182446.863422-3-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 2/6 v7] ACPI: extlog: Trace CPER PCI Express Error Section
config: i386-buildonly-randconfig-004-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051721.LfgJrwLO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051721.LfgJrwLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051721.LfgJrwLO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/pci-driver.c:1591:6: warning: no previous prototype for 'pci_uevent_ers' [-Wmissing-prototypes]
    1591 | void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
         |      ^~~~~~~~~~~~~~
--
   drivers/pci/pcie/aer.c: In function 'aer_root_reset':
>> drivers/pci/pcie/aer.c:1754:27: error: 'struct pci_dev' has no member named 'rcec'
    1754 |                 root = dev->rcec;
         |                           ^~
--
   drivers/pci/pcie/err.c: In function 'report_error_detected':
>> drivers/pci/pcie/err.c:83:9: error: implicit declaration of function 'pci_uevent_ers'; did you mean 'pci_select_bars'? [-Wimplicit-function-declaration]
      83 |         pci_uevent_ers(dev, vote);
         |         ^~~~~~~~~~~~~~
         |         pci_select_bars

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCIEAER
   Depends on [n]: PCI [=y] && PCIEPORTBUS [=n]
   Selected by [y]:
   - ACPI_EXTLOG [=y] && ACPI [=y] && X86_MCE [=y] && X86_LOCAL_APIC [=y]
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +1754 drivers/pci/pcie/aer.c

5afc2f763edc5d drivers/pci/pcie/aer.c        Kai-Heng Feng  2024-04-16  1732  
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1733  /**
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1734   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1735   * @dev: pointer to Root Port, RCEC, or RCiEP
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1736   *
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1737   * Invoked by Port Bus driver when performing reset.
f6d37800612830 drivers/pci/pcie/aer/aerdrv.c Hidetoshi Seto 2010-04-15  1738   */
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1739  static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1740  {
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1741  	int type = pci_pcie_type(dev);
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1742  	struct pci_dev *root;
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1743  	int aer;
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1744  	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
c6d34eddecb34f drivers/pci/pcie/aer/aerdrv.c Hidetoshi Seto 2010-04-15  1745  	u32 reg32;
1842623850d09b drivers/pci/pcie/aer.c        Sinan Kaya     2018-07-19  1746  	int rc;
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1747  
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1748  	/*
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1749  	 * Only Root Ports and RCECs have AER Root Command and Root Status
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1750  	 * registers.  If "dev" is an RCiEP, the relevant registers are in
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1751  	 * the RCEC.
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1752  	 */
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1753  	if (type == PCI_EXP_TYPE_RC_END)
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20 @1754  		root = dev->rcec;
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1755  	else
7a8a22be35a505 drivers/pci/pcie/aer.c        Keith Busch    2021-01-04  1756  		root = pcie_find_root_port(dev);
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1757  
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1758  	/*
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1759  	 * If the platform retained control of AER, an RCiEP may not have
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1760  	 * an RCEC visible to us, so dev->rcec ("root") may be NULL.  In
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1761  	 * that case, firmware is responsible for these registers.
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1762  	 */
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1763  	aer = root ? root->aer_cap : 0;
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1764  
13cf36c648df0c drivers/pci/pcie/aer.c        Kai-Heng Feng  2023-05-12  1765  	if ((host->native_aer || pcie_ports_native) && aer)
13cf36c648df0c drivers/pci/pcie/aer.c        Kai-Heng Feng  2023-05-12  1766  		aer_disable_irq(root);
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1767  
5790862255028c drivers/pci/pcie/aer.c        Qiuxu Zhuo     2020-11-20  1768  	if (type == PCI_EXP_TYPE_RC_EC || type == PCI_EXP_TYPE_RC_END) {
9bdc81ce440ec6 drivers/pci/pcie/aer.c        Amey Narkhede  2021-08-17  1769  		rc = pcie_reset_flr(dev, PCI_RESET_DO_RESET);
56f107d7813f11 drivers/pci/pcie/aer.c        Amey Narkhede  2021-08-17  1770  		if (!rc)
56f107d7813f11 drivers/pci/pcie/aer.c        Amey Narkhede  2021-08-17  1771  			pci_info(dev, "has been reset\n");
56f107d7813f11 drivers/pci/pcie/aer.c        Amey Narkhede  2021-08-17  1772  		else
56f107d7813f11 drivers/pci/pcie/aer.c        Amey Narkhede  2021-08-17  1773  			pci_info(dev, "not reset (no FLR support: %d)\n", rc);
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1774  	} else {
c4eed62a214330 drivers/pci/pcie/aer.c        Keith Busch    2018-09-20  1775  		rc = pci_bus_error_reset(dev);
33ac78bd3b509d drivers/pci/pcie/aer.c        Keith Busch    2021-01-04  1776  		pci_info(dev, "%s Port link has been reset (%d)\n",
33ac78bd3b509d drivers/pci/pcie/aer.c        Keith Busch    2021-01-04  1777  			pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1778  	}
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1779  
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1780  	if ((host->native_aer || pcie_ports_native) && aer) {
c6d34eddecb34f drivers/pci/pcie/aer/aerdrv.c Hidetoshi Seto 2010-04-15  1781  		/* Clear Root Error Status */
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1782  		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
a175102b0a82fc drivers/pci/pcie/aer.c        Sean V Kelley  2020-12-02  1783  		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
c6d34eddecb34f drivers/pci/pcie/aer/aerdrv.c Hidetoshi Seto 2010-04-15  1784  
13cf36c648df0c drivers/pci/pcie/aer.c        Kai-Heng Feng  2023-05-12  1785  		aer_enable_irq(root);
50cc18fcd3053f drivers/pci/pcie/aer.c        Sean V Kelley  2020-11-20  1786  	}
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1787  
1842623850d09b drivers/pci/pcie/aer.c        Sinan Kaya     2018-07-19  1788  	return rc ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1789  }
6c2b374d74857e drivers/pci/pcie/aer/aerdrv.c Zhang, Yanmin  2006-07-31  1790  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
