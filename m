Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFDF2D7AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjyRyYep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697566469; x=1729102469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UtypPLEeP20F42/omdzPXJOExqjJYhPtHEueHqsAOs=;
  b=ZjyRyYepo3ZXyXb612b9IigsgIwR0yrSOPUGtKIboktcMeXR/nLOyeb7
   OFmGNmdHgubA1fX7PxvA3eV4b72SWW7yTMG1z1MD1FiOCBQcpCxOFHs6T
   vyR6l24tGKHr7vL6/RnEF9G7Ub/yrymbGkrKbMRdEXZV0VwWXjuonm1ff
   MGwVPwOREe1jvF9dgzZC6KKF8UKVMoDjx1bKISf1hQQdPkN48y+JXZulD
   FewHNOevRcsOFydTKSr/jsWh41rd61qdv9kbZEWPRBQ1D6t9qm3a5i+Y/
   1xSXhYu2Eacvu71IsZG1ioiaxIY9dBoSm5C9pP3DLqGkZtQp5F49sFFaO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452329621"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="452329621"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 11:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="846916031"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="846916031"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2023 11:14:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsoaG-0009vv-1N;
	Tue, 17 Oct 2023 18:14:24 +0000
Date: Wed, 18 Oct 2023 02:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 13535/30000]
 drivers/pci/controller/dwc/pci-imx6.c:1961: undefined reference to
 `dw_pcie_link_up'
Message-ID: <202310180233.5a9CDvki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 61b7aecf354c8e55cffc466be937c184b8aaadb0 [13535/30000] MA-17597-5 pci: controller: dwc: support module build
config: x86_64-randconfig-076-20231017 (https://download.01.org/0day-ci/archive/20231018/202310180233.5a9CDvki-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180233.5a9CDvki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180233.5a9CDvki-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_start_link':
>> drivers/pci/controller/dwc/pci-imx6.c:1961: undefined reference to `dw_pcie_link_up'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
>> ld: drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
>> ld: drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
>> ld: drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
>> drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_establish_link':
   drivers/pci/controller/dwc/pci-imx6.c:1816: undefined reference to `dw_pcie_wait_for_link'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:288: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_establish_link':
   drivers/pci/controller/dwc/pci-imx6.c:1864: undefined reference to `dw_pcie_wait_for_link'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:293: undefined reference to `dw_pcie_read_dbi'


vim +1961 drivers/pci/controller/dwc/pci-imx6.c

0ee2c1f2429f74 drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-08-27  1794  
e7d7705ace9494 drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-11  1795  static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1796  {
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1797  	struct dw_pcie *pci = imx6_pcie->pci;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1798  	struct device *dev = pci->dev;
1c7fae18a1fb6b drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2015-06-12  1799  	u32 tmp;
a0427464cf4c4a drivers/pci/host/pci-imx6.c           Troy Kisky             2015-06-12  1800  	int ret;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1801  
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1802  	/*
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1803  	 * Force Gen1 operation when starting the link.  In case the link is
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1804  	 * started in Gen2 mode, there is a possibility the devices on the
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1805  	 * bus will not be detected at all.  This happens with PCIe switches.
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1806  	 */
af235be4424b00 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-08  1807  	if (!IS_ENABLED(CONFIG_PCI_IMX6_COMPLIANCE_TEST)) {
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1808  		tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCR);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1809  		tmp &= ~PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1810  		tmp |= PCIE_RC_LCR_MAX_LINK_SPEEDS_GEN1;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1811  		dw_pcie_writel_dbi(pci, PCIE_RC_LCR, tmp);
af235be4424b00 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-08  1812  	}
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1813  
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1814  	/* Start LTSSM. */
0ee2c1f2429f74 drivers/pci/controller/dwc/pci-imx6.c Leonard Crestez        2018-08-27  1815  	imx6_pcie_ltssm_enable(dev);
ee6f37175b3f7a drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-04-14 @1816  	ret = dw_pcie_wait_for_link(pci);
caf3f562e1161a drivers/pci/host/pci-imx6.c           Fabio Estevam          2016-12-27  1817  	if (ret)
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1818  		goto err_reset_phy;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1819  
e76f906f9773bc drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-01-25  1820  	if (imx6_pcie->link_gen >= 2) {
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1821  		/* Fill up target link speed before speed change. */
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1822  		tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LC2SR);
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1823  		tmp &= ~PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK;
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1824  		tmp |= imx6_pcie->link_gen;
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1825  		dw_pcie_writel_dbi(pci, PCIE_RC_LC2SR, tmp);
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1826  
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1827  		tmp = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1828  		tmp &= ~PORT_LOGIC_SPEED_CHANGE;
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1829  		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
12589ba98b1145 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-06-22  1830  
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1831  		/* Allow Gen2 mode after the link is up. */
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1832  		tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCR);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1833  		tmp &= ~PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK;
e76f906f9773bc drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-01-25  1834  		tmp |= imx6_pcie->link_gen;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1835  		dw_pcie_writel_dbi(pci, PCIE_RC_LCR, tmp);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1836  
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1837  		/*
93b226f9c65a95 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1838  		 * Start Directed Speed Change so the best possible
93b226f9c65a95 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1839  		 * speed both link partners support can be negotiated.
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1840  		 */
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1841  		tmp = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1842  		tmp |= PORT_LOGIC_SPEED_CHANGE;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1843  		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1844  
4c458bb347ae01 drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-02-01  1845  		if (imx6_pcie->drvdata->flags &
4c458bb347ae01 drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-02-01  1846  		    IMX6_PCIE_FLAG_IMX6_SPEED_CHANGE) {
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1847  			/*
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1848  			 * On i.MX7, DIRECT_SPEED_CHANGE behaves differently
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1849  			 * from i.MX6 family when no link speed transition
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1850  			 * occurs and we go Gen1 -> yep, Gen1. The difference
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1851  			 * is that, in such case, it will not be cleared by HW
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1852  			 * which will cause the following code to report false
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1853  			 * failure.
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1854  			 */
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1855  
e7d7705ace9494 drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-11  1856  			ret = imx6_pcie_wait_for_speed_change(imx6_pcie);
a0427464cf4c4a drivers/pci/host/pci-imx6.c           Troy Kisky             2015-06-12  1857  			if (ret) {
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1858  				dev_err(dev, "Failed to bring link up!\n");
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1859  				goto err_reset_phy;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1860  			}
e6dcd87fff69a9 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1861  		}
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1862  
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1863  		/* Make sure link training is finished as well! */
ee6f37175b3f7a drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-04-14  1864  		ret = dw_pcie_wait_for_link(pci);
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1865  		if (ret) {
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1866  			dev_err(dev, "Failed to bring link up!\n");
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1867  			goto err_reset_phy;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1868  		}
93b226f9c65a95 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1869  	} else {
93b226f9c65a95 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1870  		dev_info(dev, "Link: Gen2 disabled\n");
93b226f9c65a95 drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1871  	}
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1872  
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1873  	tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCSR);
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1874  	dev_info(dev, "Link up, Gen%i\n", (tmp >> 16) & 0xf);
a0427464cf4c4a drivers/pci/host/pci-imx6.c           Troy Kisky             2015-06-12  1875  	return 0;
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1876  
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1877  err_reset_phy:
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1878  	dev_dbg(dev, "PHY DEBUG_R0=0x%08x DEBUG_R1=0x%08x\n",
60ef4b072ba089 drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-04-14  1879  		dw_pcie_readl_dbi(pci, PCIE_PORT_DEBUG0),
60ef4b072ba089 drivers/pci/controller/dwc/pci-imx6.c Andrey Smirnov         2019-04-14  1880  		dw_pcie_readl_dbi(pci, PCIE_PORT_DEBUG1));
2a6a85d5368e55 drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-11  1881  	imx6_pcie_reset_phy(imx6_pcie);
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1882  	if (!IS_ENABLED(CONFIG_PCI_IMX6_COMPLIANCE_TEST)) {
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1883  		imx6_pcie_clk_disable(imx6_pcie);
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1884  		if (imx6_pcie->vpcie != NULL)
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1885  			regulator_disable(imx6_pcie->vpcie);
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1886  		if (imx6_pcie->epdev_on != NULL)
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1887  			regulator_disable(imx6_pcie->epdev_on);
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1888  	}
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1889  
54a47a83421a3b drivers/pci/host/pci-imx6.c           Lucas Stach            2016-01-25  1890  	return ret;
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1891  }
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1892  
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1893  static void pci_imx_set_msi_en(struct pcie_port *pp)
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1894  {
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1895  	u16 val;
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1896  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1897  
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1898  	if (pci_msi_enabled()) {
7b842d74f6f105 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-02-20  1899  		dw_pcie_dbi_ro_wr_en(pci);
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1900  		val = dw_pcie_readw_dbi(pci, PCIE_RC_IMX6_MSI_CAP +
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1901  					PCI_MSI_FLAGS);
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1902  		val |= PCI_MSI_FLAGS_ENABLE;
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1903  		val &= ~PCI_MSI_FLAGS_64BIT;
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1904  		dw_pcie_writew_dbi(pci, PCIE_RC_IMX6_MSI_CAP + PCI_MSI_FLAGS,
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1905  				   val);
7b842d74f6f105 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-02-20  1906  		dw_pcie_dbi_ro_wr_dis(pci);
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1907  	}
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1908  }
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1909  
4a301766f5263d drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1910  static int imx6_pcie_host_init(struct pcie_port *pp)
fa33a6d87eac1a drivers/pci/host/pci-imx6.c           Marek Vasut            2013-12-12  1911  {
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1912  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1913  	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1914  
d95659f2bbd85d drivers/pci/controller/dwc/pci-imx6.c Fugang Duan            2019-11-02  1915  	if (gpio_is_valid(imx6_pcie->dis_gpio))
d95659f2bbd85d drivers/pci/controller/dwc/pci-imx6.c Fugang Duan            2019-11-02  1916  		gpio_set_value_cansleep(imx6_pcie->dis_gpio, 1);
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1917  	dw_pcie_setup_rc(pp);
f503843f85d287 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-22  1918  	pci_imx_set_msi_en(pp);
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1919  	if (imx6_pcie_establish_link(imx6_pcie))
d1fcbc345b82cd drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2019-11-28  1920  		return -ENODEV;
6e8f69523e69ae drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-10-19  1921  	dw_pcie_msi_init(pp);
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1922  
4a301766f5263d drivers/pci/dwc/pci-imx6.c            Bjorn Andersson        2017-07-15  1923  	return 0;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1924  }
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1925  
4ab2e7c0df6b8b drivers/pci/dwc/pci-imx6.c            Jisheng Zhang          2017-06-05  1926  static const struct dw_pcie_host_ops imx6_pcie_host_ops = {
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1927  	.host_init = imx6_pcie_host_init,
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1928  };
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1929  
bde4a5a00e761f drivers/pci/dwc/pci-imx6.c            Andrey Smirnov         2017-03-28  1930  static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1931  			      struct platform_device *pdev)
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1932  {
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1933  	struct dw_pcie *pci = imx6_pcie->pci;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1934  	struct pcie_port *pp = &pci->pp;
442ec4c04d1235 drivers/pci/dwc/pci-imx6.c            Kishon Vijay Abraham I 2017-02-15  1935  	struct device *dev = &pdev->dev;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1936  	int ret;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1937  
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1938  	if (IS_ENABLED(CONFIG_PCI_MSI)) {
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1939  		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1940  		if (pp->msi_irq <= 0) {
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1941  			dev_err(dev, "failed to get MSI irq\n");
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1942  			return -ENODEV;
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1943  		}
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1944  	}
d1dc9749a5b823 drivers/pci/host/pci-imx6.c           Lucas Stach            2014-03-28  1945  
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1946  	pp->ops = &imx6_pcie_host_ops;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1947  
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1948  	ret = dw_pcie_host_init(pp);
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1949  	if (ret) {
13957652f7242a drivers/pci/host/pci-imx6.c           Bjorn Helgaas          2016-10-06  1950  		dev_err(dev, "failed to initialize host\n");
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1951  		return ret;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1952  	}
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1953  
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1954  	return 0;
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1955  }
bb38919ec56e07 drivers/pci/host/pci-imx6.c           Sean Cross             2013-09-26  1956  
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1957  static int imx6_pcie_start_link(struct dw_pcie *pci)
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1958  {
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1959  	struct device *dev = pci->dev;
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1960  
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14 @1961  	if (dw_pcie_link_up(pci)) {
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1962  		dev_dbg(dev, "link is already up\n");
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1963  		return 0;
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1964  	}
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1965  
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1966  	/* Start LTSSM. */
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1967  	imx6_pcie_ltssm_enable(dev);
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1968  
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1969  	return 0;
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1970  }
112ade807b909b drivers/pci/controller/dwc/pci-imx6.c Richard Zhu            2020-05-14  1971  

:::::: The code at line 1961 was first introduced by commit
:::::: 112ade807b909b5bb44dd16eca0313a2085b4c0c MLK-24012-12 pci: imx: add the imx8qxp ep support

:::::: TO: Richard Zhu <hongxing.zhu@nxp.com>
:::::: CC: Richard Zhu <hongxing.zhu@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
