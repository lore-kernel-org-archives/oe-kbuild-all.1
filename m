Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939963DE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhHSd5oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698911560; x=1730447560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CuQr6cvDCu39LtMaJMQbf0eTCPMod+Skjq54Apt5i2c=;
  b=YhHSd5oc6TlKsXKALTBlAuzt8jnzJPeM8Po9K8CQ4hFcknbF9XS2R8j9
   ohZ4W0bmUrXS2UnxHZ5YWe7E/JJ7O76gVxcDvAGETy+8NcxkCrT1PTlTl
   l66oJMAoPDWNi4dLqSvF7BB/z4+ovteyKNfnElL3H8yJMP7WuQV1bhInE
   XZk4R0HSVeI6WKMenIflCEMB7UnFyYmVU18CNiNFoicye8mKcOrsi/m3E
   gioqmw2Y+jgryju4HnhnSjFq9+eylMRSh/UJlGZxu2QtwAXDudxBkR10n
   txyPEMFdhAiU9pY1EE43I7QtVFiql/FqDlCbW7QdIkNmtJIxBQ1y+XEOw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373700694"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="373700694"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 00:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884803428"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="884803428"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2023 00:52:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qySVH-0001Dz-1D;
	Thu, 02 Nov 2023 07:52:35 +0000
Date: Thu, 2 Nov 2023 15:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Agarwal <quic_harshq@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-linux-6.6.y 55/92]
 drivers/usb/dwc3/core.c:1412:53: warning: '%d' directive writing between 1
 and 11 bytes into a region of size 4
Message-ID: <202311021510.zaqxsnh4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.6.y
head:   2d02366a5b7fb59aa3ffd350124bdbbd6b15fe69
commit: 8b28b3fe314a69d1b3804400572ad75884614092 [55/92] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: powerpc-randconfig-002-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021510.zaqxsnh4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021510.zaqxsnh4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021510.zaqxsnh4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
>> drivers/usb/dwc3/core.c:1412:53: warning: '%d' directive writing between 1 and 11 bytes into a region of size 4 [-Wformat-overflow=]
    1412 |                         sprintf(phy_name, "usb2-port%d", i);
         |                                                     ^~
   drivers/usb/dwc3/core.c:1412:43: note: directive argument in the range [-2147483641, 254]
    1412 |                         sprintf(phy_name, "usb2-port%d", i);
         |                                           ^~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1412:25: note: 'sprintf' output between 11 and 21 bytes into a destination of size 13
    1412 |                         sprintf(phy_name, "usb2-port%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1427:53: warning: '%d' directive writing between 1 and 11 bytes into a region of size 4 [-Wformat-overflow=]
    1427 |                         sprintf(phy_name, "usb3-port%d", i);
         |                                                     ^~
   drivers/usb/dwc3/core.c:1427:43: note: directive argument in the range [-2147483641, 254]
    1427 |                         sprintf(phy_name, "usb3-port%d", i);
         |                                           ^~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1427:25: note: 'sprintf' output between 11 and 21 bytes into a destination of size 13
    1427 |                         sprintf(phy_name, "usb3-port%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1412 drivers/usb/dwc3/core.c

  1375	
  1376	static int dwc3_core_get_phy(struct dwc3 *dwc)
  1377	{
  1378		struct device		*dev = dwc->dev;
  1379		struct device_node	*node = dev->of_node;
  1380		char phy_name[13];
  1381		int ret;
  1382		int i;
  1383	
  1384		if (node) {
  1385			dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
  1386			dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
  1387		} else {
  1388			dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1389			dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1390		}
  1391	
  1392		if (IS_ERR(dwc->usb2_phy)) {
  1393			ret = PTR_ERR(dwc->usb2_phy);
  1394			if (ret == -ENXIO || ret == -ENODEV)
  1395				dwc->usb2_phy = NULL;
  1396			else
  1397				return dev_err_probe(dev, ret, "no usb2 phy configured\n");
  1398		}
  1399	
  1400		if (IS_ERR(dwc->usb3_phy)) {
  1401			ret = PTR_ERR(dwc->usb3_phy);
  1402			if (ret == -ENXIO || ret == -ENODEV)
  1403				dwc->usb3_phy = NULL;
  1404			else
  1405				return dev_err_probe(dev, ret, "no usb3 phy configured\n");
  1406		}
  1407	
  1408		for (i = 0; i < dwc->num_usb2_ports; i++) {
  1409			if (dwc->num_usb2_ports == 1)
  1410				sprintf(phy_name, "usb2-phy");
  1411			else
> 1412				sprintf(phy_name, "usb2-port%d", i);
  1413	
  1414			dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
  1415			if (IS_ERR(dwc->usb2_generic_phy[i])) {
  1416				ret = PTR_ERR(dwc->usb2_generic_phy[i]);
  1417				if (ret == -ENOSYS || ret == -ENODEV)
  1418					dwc->usb2_generic_phy[i] = NULL;
  1419				else
  1420					return dev_err_probe(dev, ret,
  1421						"failed to lookup phy %s\n", phy_name);
  1422			}
  1423	
  1424			if (dwc->num_usb2_ports == 1)
  1425				sprintf(phy_name, "usb3-phy");
  1426			else
  1427				sprintf(phy_name, "usb3-port%d", i);
  1428	
  1429			dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
  1430			if (IS_ERR(dwc->usb3_generic_phy[i])) {
  1431				ret = PTR_ERR(dwc->usb3_generic_phy[i]);
  1432				if (ret == -ENOSYS || ret == -ENODEV)
  1433					dwc->usb3_generic_phy[i] = NULL;
  1434				else
  1435					return dev_err_probe(dev, ret,
  1436						"failed to lookup phy %s\n", phy_name);
  1437			}
  1438		}
  1439	
  1440		return 0;
  1441	}
  1442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
