Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18CD281
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696318254; x=1727854254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rrqlFlRCltsI3CDzq15J2dAr8jH1MNhXjHDNMwtFi/I=;
  b=NDf0gGsPUb8FZRL/x6klCBRyMEwjq/a7DglOFt3+96OFgkVswoezz2dm
   slE31+u91uNiLsthX6YnHhfKRWsAJt/QP7NaQlqlHa8npVvjCb2eyNv71
   AXQ1qyaoIQrZ9j594kJ4HYIkHvkZcH4LThX+8+WLl3PNmRlqwjMRHYQZT
   QySSyVZCtR3YXJmpu3emRd25zZ1821ajbIjYw+VRmu3ZWlqOuIy5zdJyX
   TNIjGC49W3RTB7VjDx8ih4q3DxmqM3LDgrZTSrDYwRe3KOkiR+9l0BkJw
   JCLj+6dG6WqPAX9bAKxR40NqFjc66VL04HvNr61rnpZCuXGGat+8WcSYR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362183728"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="362183728"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 00:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866773948"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="866773948"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2023 00:30:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnZri-0006si-0e;
	Tue, 03 Oct 2023 07:30:46 +0000
Date: Tue, 3 Oct 2023 15:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Harsh Agarwal <quic_harshq@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.6.0-rc4 40/73]
 drivers/usb/dwc3/core.c:1377:53: warning: '%d' directive writing between 1
 and 11 bytes into a region of size 2
Message-ID: <202310031532.SS2HUcXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.6.0-rc4
head:   553fbd2f768ebcfef528ce8d42a1f082eef06d6f
commit: 2c63c6744c13f3bba3b5a405d57415bf420e3ded [40/73] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310031532.SS2HUcXu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031532.SS2HUcXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031532.SS2HUcXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
>> drivers/usb/dwc3/core.c:1377:53: warning: '%d' directive writing between 1 and 11 bytes into a region of size 2 [-Wformat-overflow=]
    1377 |                         sprintf(phy_name, "usb2-port%d", i);
         |                                                     ^~
   drivers/usb/dwc3/core.c:1377:43: note: directive argument in the range [-2147483641, 254]
    1377 |                         sprintf(phy_name, "usb2-port%d", i);
         |                                           ^~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1377:25: note: 'sprintf' output between 11 and 21 bytes into a destination of size 11
    1377 |                         sprintf(phy_name, "usb2-port%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1392:53: warning: '%d' directive writing between 1 and 11 bytes into a region of size 2 [-Wformat-overflow=]
    1392 |                         sprintf(phy_name, "usb3-port%d", i);
         |                                                     ^~
   drivers/usb/dwc3/core.c:1392:43: note: directive argument in the range [-2147483641, 254]
    1392 |                         sprintf(phy_name, "usb3-port%d", i);
         |                                           ^~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1392:25: note: 'sprintf' output between 11 and 21 bytes into a destination of size 11
    1392 |                         sprintf(phy_name, "usb3-port%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1377 drivers/usb/dwc3/core.c

  1340	
  1341	static int dwc3_core_get_phy(struct dwc3 *dwc)
  1342	{
  1343		struct device		*dev = dwc->dev;
  1344		struct device_node	*node = dev->of_node;
  1345		char phy_name[11];
  1346		int ret;
  1347		int i;
  1348	
  1349		if (node) {
  1350			dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
  1351			dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
  1352		} else {
  1353			dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1354			dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1355		}
  1356	
  1357		if (IS_ERR(dwc->usb2_phy)) {
  1358			ret = PTR_ERR(dwc->usb2_phy);
  1359			if (ret == -ENXIO || ret == -ENODEV)
  1360				dwc->usb2_phy = NULL;
  1361			else
  1362				return dev_err_probe(dev, ret, "no usb2 phy configured\n");
  1363		}
  1364	
  1365		if (IS_ERR(dwc->usb3_phy)) {
  1366			ret = PTR_ERR(dwc->usb3_phy);
  1367			if (ret == -ENXIO || ret == -ENODEV)
  1368				dwc->usb3_phy = NULL;
  1369			else
  1370				return dev_err_probe(dev, ret, "no usb3 phy configured\n");
  1371		}
  1372	
  1373		for (i = 0; i < dwc->num_usb2_ports; i++) {
  1374			if (dwc->num_usb2_ports == 1)
  1375				sprintf(phy_name, "usb2-phy");
  1376			else
> 1377				sprintf(phy_name, "usb2-port%d", i);
  1378	
  1379			dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
  1380			if (IS_ERR(dwc->usb2_generic_phy[i])) {
  1381				ret = PTR_ERR(dwc->usb2_generic_phy[i]);
  1382				if (ret == -ENOSYS || ret == -ENODEV)
  1383					dwc->usb2_generic_phy[i] = NULL;
  1384				else
  1385					return dev_err_probe(dev, ret,
  1386						"no %s phy configured\n", phy_name);
  1387			}
  1388	
  1389			if (dwc->num_usb2_ports == 1)
  1390				sprintf(phy_name, "usb3-phy");
  1391			else
  1392				sprintf(phy_name, "usb3-port%d", i);
  1393	
  1394			dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
  1395			if (IS_ERR(dwc->usb3_generic_phy[i])) {
  1396				ret = PTR_ERR(dwc->usb3_generic_phy[i]);
  1397				if (ret == -ENOSYS || ret == -ENODEV)
  1398					dwc->usb3_generic_phy[i] = NULL;
  1399				else
  1400					return dev_err_probe(dev, ret,
  1401						"no %s phy configured\n", phy_name);
  1402			}
  1403		}
  1404	
  1405		return 0;
  1406	}
  1407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
