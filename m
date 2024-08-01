Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BE113DBA0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492561; cv=none; b=ULXCzfgnVlINufyxrZDu/BudmqUJZzxi/dC4EBzcg79AYTcZFVYnjc8Wb9xzWywmW9rYB5wqs0hviIGhbkYgoCJ+uNuRuH7foLYkO6+K0dEh8AWOvkcAl2mcLh47mMXnZTA82qnm9pqvotWZ4+L/5n08xJzvLKDNr3iHT/4J60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492561; c=relaxed/simple;
	bh=ZlvJJFjfgL2R6PfmAxoEULyohJq+0VdMngIa1q1pmMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdotaJX//ecKKPCa8bKyYv5Bhapt27O2zHkNiNGeKteBoOSYrstU4uAHHYvYarya8uwwjwnafbV4UU55aRfsyZNxDcQ7Wl610//c27VYlELZmdFT7WKppwfCO5XoVmH1sekLO8suglTIrRZB0s34++CGSfIAfHR3nTOqHKHN0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAayANA9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAayANA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722492559; x=1754028559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlvJJFjfgL2R6PfmAxoEULyohJq+0VdMngIa1q1pmMg=;
  b=QAayANA9aMi0fnb+kug9ARdtLX8wpR7fPi/5+2tLcJcnFPkmmJ0U6MYI
   oelLZVAOumFQ76lzW8RpWHboEFyC6LVGdCUdUq3zUOUeKCZlbjlEQd6OT
   ebMK5gAcAYdM6tVuDMvOb1DlIKfw/dbelg3xvUKVlWId8F9l0GBe47NIL
   hC54FnU+g0BHNj8iSWMRl/COROe+4Dgct1ZRAheCaiGzHQ4VGWlUf0Kws
   T3sopv0PM7+ewaNief8uuh/xfIVDA2VtVwB3+1a48ijRWazfhZWF7/oyJ
   tunY2wwH4Xz8+3nlUvdg/JblrUaGkS0YIW4py5kcmuyEwg6DDS7eC+Efj
   g==;
X-CSE-ConnectionGUID: qvFmxIMQQRqKigyUz8eDgA==
X-CSE-MsgGUID: 899xQRvrSImViEYMqKhhFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23339820"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="23339820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 23:09:18 -0700
X-CSE-ConnectionGUID: yVeYTSYdSUyqOOlMJxHASA==
X-CSE-MsgGUID: 20d94TfLSKedF35cM7RBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59247773"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2024 23:09:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZOzz-000vFg-0e;
	Thu, 01 Aug 2024 06:09:15 +0000
Date: Thu, 1 Aug 2024 14:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 25/36]
 drivers/net/ethernet/freescale/fman/fman_port.c:1751:22: warning: unused
 variable 'lenp'
Message-ID: <202408011450.QgsEDp0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   dca85e479f99af8c28bad5188e16f952381086ba
commit: 06e23934546b8bb404f2f6f7507c8cf31e323d15 [25/36] net: Use of_property_read_bool()
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240801/202408011450.QgsEDp0u-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011450.QgsEDp0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011450.QgsEDp0u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fman/fman_port.c: In function 'fman_port_probe':
>> drivers/net/ethernet/freescale/fman/fman_port.c:1751:22: warning: unused variable 'lenp' [-Wunused-variable]
    1751 |         int err = 0, lenp;
         |                      ^~~~


vim +/lenp +1751 drivers/net/ethernet/freescale/fman/fman_port.c

880f874cf50568 Yangbo Lu         2018-06-25  1741  
18a6c85fcc78dd Igal Liberman     2015-12-21  1742  static int fman_port_probe(struct platform_device *of_dev)
18a6c85fcc78dd Igal Liberman     2015-12-21  1743  {
18a6c85fcc78dd Igal Liberman     2015-12-21  1744  	struct fman_port *port;
18a6c85fcc78dd Igal Liberman     2015-12-21  1745  	struct fman *fman;
18a6c85fcc78dd Igal Liberman     2015-12-21  1746  	struct device_node *fm_node, *port_node;
0572054617f326 Florinel Iordache 2020-08-03  1747  	struct platform_device *fm_pdev;
18a6c85fcc78dd Igal Liberman     2015-12-21  1748  	struct resource res;
18a6c85fcc78dd Igal Liberman     2015-12-21  1749  	struct resource *dev_res;
537a31658f8a01 Madalin Bucur     2016-05-16  1750  	u32 val;
18a6c85fcc78dd Igal Liberman     2015-12-21 @1751  	int err = 0, lenp;
18a6c85fcc78dd Igal Liberman     2015-12-21  1752  	enum fman_port_type port_type;
18a6c85fcc78dd Igal Liberman     2015-12-21  1753  	u16 port_speed;
18a6c85fcc78dd Igal Liberman     2015-12-21  1754  	u8 port_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1755  
18a6c85fcc78dd Igal Liberman     2015-12-21  1756  	port = kzalloc(sizeof(*port), GFP_KERNEL);
18a6c85fcc78dd Igal Liberman     2015-12-21  1757  	if (!port)
18a6c85fcc78dd Igal Liberman     2015-12-21  1758  		return -ENOMEM;
18a6c85fcc78dd Igal Liberman     2015-12-21  1759  
18a6c85fcc78dd Igal Liberman     2015-12-21  1760  	port->dev = &of_dev->dev;
18a6c85fcc78dd Igal Liberman     2015-12-21  1761  
18a6c85fcc78dd Igal Liberman     2015-12-21  1762  	port_node = of_node_get(of_dev->dev.of_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1763  
18a6c85fcc78dd Igal Liberman     2015-12-21  1764  	/* Get the FM node */
18a6c85fcc78dd Igal Liberman     2015-12-21  1765  	fm_node = of_get_parent(port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1766  	if (!fm_node) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1767  		dev_err(port->dev, "%s: of_get_parent() failed\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1768  		err = -ENODEV;
18a6c85fcc78dd Igal Liberman     2015-12-21  1769  		goto return_err;
18a6c85fcc78dd Igal Liberman     2015-12-21  1770  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1771  
0572054617f326 Florinel Iordache 2020-08-03  1772  	fm_pdev = of_find_device_by_node(fm_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1773  	of_node_put(fm_node);
0572054617f326 Florinel Iordache 2020-08-03  1774  	if (!fm_pdev) {
0572054617f326 Florinel Iordache 2020-08-03  1775  		err = -EINVAL;
0572054617f326 Florinel Iordache 2020-08-03  1776  		goto return_err;
0572054617f326 Florinel Iordache 2020-08-03  1777  	}
0572054617f326 Florinel Iordache 2020-08-03  1778  
0572054617f326 Florinel Iordache 2020-08-03  1779  	fman = dev_get_drvdata(&fm_pdev->dev);
18a6c85fcc78dd Igal Liberman     2015-12-21  1780  	if (!fman) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1781  		err = -EINVAL;
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1782  		goto put_device;
18a6c85fcc78dd Igal Liberman     2015-12-21  1783  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1784  
537a31658f8a01 Madalin Bucur     2016-05-16  1785  	err = of_property_read_u32(port_node, "cell-index", &val);
537a31658f8a01 Madalin Bucur     2016-05-16  1786  	if (err) {
f7ce91038d5278 Rob Herring       2017-07-18  1787  		dev_err(port->dev, "%s: reading cell-index for %pOF failed\n",
f7ce91038d5278 Rob Herring       2017-07-18  1788  			__func__, port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1789  		err = -EINVAL;
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1790  		goto put_device;
18a6c85fcc78dd Igal Liberman     2015-12-21  1791  	}
537a31658f8a01 Madalin Bucur     2016-05-16  1792  	port_id = (u8)val;
18a6c85fcc78dd Igal Liberman     2015-12-21  1793  	port->dts_params.id = port_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1794  
18a6c85fcc78dd Igal Liberman     2015-12-21  1795  	if (of_device_is_compatible(port_node, "fsl,fman-v3-port-tx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1796  		port_type = FMAN_PORT_TYPE_TX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1797  		port_speed = 1000;
06e23934546b8b Rob Herring (Arm  2024-07-26  1798) 		if (of_property_read_bool(port_node, "fsl,fman-10g-port"))
18a6c85fcc78dd Igal Liberman     2015-12-21  1799  			port_speed = 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1800  
18a6c85fcc78dd Igal Liberman     2015-12-21  1801  	} else if (of_device_is_compatible(port_node, "fsl,fman-v2-port-tx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1802  		if (port_id >= TX_10G_PORT_BASE)
18a6c85fcc78dd Igal Liberman     2015-12-21  1803  			port_speed = 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1804  		else
18a6c85fcc78dd Igal Liberman     2015-12-21  1805  			port_speed = 1000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1806  		port_type = FMAN_PORT_TYPE_TX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1807  
18a6c85fcc78dd Igal Liberman     2015-12-21  1808  	} else if (of_device_is_compatible(port_node, "fsl,fman-v3-port-rx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1809  		port_type = FMAN_PORT_TYPE_RX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1810  		port_speed = 1000;
06e23934546b8b Rob Herring (Arm  2024-07-26  1811) 		if (of_property_read_bool(port_node, "fsl,fman-10g-port"))
18a6c85fcc78dd Igal Liberman     2015-12-21  1812  			port_speed = 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1813  
18a6c85fcc78dd Igal Liberman     2015-12-21  1814  	} else if (of_device_is_compatible(port_node, "fsl,fman-v2-port-rx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1815  		if (port_id >= RX_10G_PORT_BASE)
18a6c85fcc78dd Igal Liberman     2015-12-21  1816  			port_speed = 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1817  		else
18a6c85fcc78dd Igal Liberman     2015-12-21  1818  			port_speed = 1000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1819  		port_type = FMAN_PORT_TYPE_RX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1820  
18a6c85fcc78dd Igal Liberman     2015-12-21  1821  	}  else {
18a6c85fcc78dd Igal Liberman     2015-12-21  1822  		dev_err(port->dev, "%s: Illegal port type\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1823  		err = -EINVAL;
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1824  		goto put_device;
18a6c85fcc78dd Igal Liberman     2015-12-21  1825  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1826  
18a6c85fcc78dd Igal Liberman     2015-12-21  1827  	port->dts_params.type = port_type;
18a6c85fcc78dd Igal Liberman     2015-12-21  1828  	port->dts_params.speed = port_speed;
18a6c85fcc78dd Igal Liberman     2015-12-21  1829  
18a6c85fcc78dd Igal Liberman     2015-12-21  1830  	if (port_type == FMAN_PORT_TYPE_TX) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1831  		u32 qman_channel_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1832  
18a6c85fcc78dd Igal Liberman     2015-12-21  1833  		qman_channel_id = fman_get_qman_channel_id(fman, port_id);
18a6c85fcc78dd Igal Liberman     2015-12-21  1834  		if (qman_channel_id == 0) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1835  			dev_err(port->dev, "%s: incorrect qman-channel-id\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1836  				__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1837  			err = -EINVAL;
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1838  			goto put_device;
18a6c85fcc78dd Igal Liberman     2015-12-21  1839  		}
18a6c85fcc78dd Igal Liberman     2015-12-21  1840  		port->dts_params.qman_channel_id = qman_channel_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1841  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1842  
18a6c85fcc78dd Igal Liberman     2015-12-21  1843  	err = of_address_to_resource(port_node, 0, &res);
18a6c85fcc78dd Igal Liberman     2015-12-21  1844  	if (err < 0) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1845  		dev_err(port->dev, "%s: of_address_to_resource() failed\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1846  			__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1847  		err = -ENOMEM;
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1848  		goto put_device;
18a6c85fcc78dd Igal Liberman     2015-12-21  1849  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1850  
18a6c85fcc78dd Igal Liberman     2015-12-21  1851  	port->dts_params.fman = fman;
18a6c85fcc78dd Igal Liberman     2015-12-21  1852  
18a6c85fcc78dd Igal Liberman     2015-12-21  1853  	of_node_put(port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1854  
18a6c85fcc78dd Igal Liberman     2015-12-21  1855  	dev_res = __devm_request_region(port->dev, &res, res.start,
18a6c85fcc78dd Igal Liberman     2015-12-21  1856  					resource_size(&res), "fman-port");
18a6c85fcc78dd Igal Liberman     2015-12-21  1857  	if (!dev_res) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1858  		dev_err(port->dev, "%s: __devm_request_region() failed\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1859  			__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1860  		err = -EINVAL;
18a6c85fcc78dd Igal Liberman     2015-12-21  1861  		goto free_port;
18a6c85fcc78dd Igal Liberman     2015-12-21  1862  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1863  
18a6c85fcc78dd Igal Liberman     2015-12-21  1864  	port->dts_params.base_addr = devm_ioremap(port->dev, res.start,
18a6c85fcc78dd Igal Liberman     2015-12-21  1865  						  resource_size(&res));
5df6f7fa47e030 Madalin Bucur     2016-03-22  1866  	if (!port->dts_params.base_addr)
18a6c85fcc78dd Igal Liberman     2015-12-21  1867  		dev_err(port->dev, "%s: devm_ioremap() failed\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1868  
18a6c85fcc78dd Igal Liberman     2015-12-21  1869  	dev_set_drvdata(&of_dev->dev, port);
18a6c85fcc78dd Igal Liberman     2015-12-21  1870  
18a6c85fcc78dd Igal Liberman     2015-12-21  1871  	return 0;
18a6c85fcc78dd Igal Liberman     2015-12-21  1872  
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1873  put_device:
bf2b09fedc1724 Miaoqian Lin      2021-12-30  1874  	put_device(&fm_pdev->dev);
18a6c85fcc78dd Igal Liberman     2015-12-21  1875  return_err:
18a6c85fcc78dd Igal Liberman     2015-12-21  1876  	of_node_put(port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1877  free_port:
18a6c85fcc78dd Igal Liberman     2015-12-21  1878  	kfree(port);
18a6c85fcc78dd Igal Liberman     2015-12-21  1879  	return err;
18a6c85fcc78dd Igal Liberman     2015-12-21  1880  }
18a6c85fcc78dd Igal Liberman     2015-12-21  1881  

:::::: The code at line 1751 was first introduced by commit
:::::: 18a6c85fcc78ddb63b0646a302e5ec8d6a9e29d6 fsl/fman: Add FMan Port Support

:::::: TO: Igal Liberman <igal.liberman@freescale.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
