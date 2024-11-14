Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B41AC885
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731622858; cv=none; b=h/UVr9GgeTf35MjvaFXJkHcFeYLnZAbyvB1om+E+fHxJ4Ut9DgXUKDr+5tZU9ROMuBhImPp+AiKQb7u92C6DiZM07Pw/OQTnLEikboJf5FbBd1/bJaniAQ1jlzABYLJVSim7qeNdndVxap6ZPCvWJpg7/z5UngrGSFgg1DaT508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731622858; c=relaxed/simple;
	bh=zqK4AuAY9s6BOM5i3Og+Jc1UxeLH2AwHdcOYAgp4XS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RydFOlsGmAlAKcfGnqTMafZsZ0IhuCBQWIjhxD0e3RmrgGOXxzMRb4/3li9ltukb/PfE0fIsL17H+YLtV52jq3lhPxwltbVW7d9Jtrb/ILRQzxCB2j4jBBInDt89IyOSoa/cJpGfi1ftfIwvCutHWo4u/Ss/67C5IPp8a6CbHvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBAnsHsu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBAnsHsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731622856; x=1763158856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqK4AuAY9s6BOM5i3Og+Jc1UxeLH2AwHdcOYAgp4XS4=;
  b=VBAnsHsuZpCgJ0kawXtqIYoFja+TQC9SxvnlhIo6o5TNlyu7A0VnCY59
   Ydh7SC9z6Pz1NuY0TEe1KYwKJ14QaN61vF7WCCQTzFRab0f+gHE3X8gEO
   7vVMRZS0CVJHoIsznS0VHT+foTneZtTfpR/VUgoo8MmOGbHxtO40jFHtf
   nTY1tKPUlnE/pgwJe/VFzsn64Y4PP68pQkq0onFPgUG3by+VU4dyzJeqH
   2CwjK5vyY+8mFjYnQQfunn0TjJit8Oi10g1Ta5rZsHdT6JxG8HhYGprEs
   OaLoV7HIIHBzpcqjAY6AiSnsGBY7rg5/iOPmIjHTPLYkjj4kvI7T9grAL
   A==;
X-CSE-ConnectionGUID: KfPSaCkaQWOxGks+sor0hA==
X-CSE-MsgGUID: X3UjCOPfQHu1KN7AcRdt7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42240364"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42240364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 14:20:55 -0800
X-CSE-ConnectionGUID: 8P5PwYcBQUG+cjrXCtR8jw==
X-CSE-MsgGUID: 9jco5vP9TNu+rDTXZdQORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="93420969"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Nov 2024 14:20:55 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBiCq-00004d-0b;
	Thu, 14 Nov 2024 22:20:52 +0000
Date: Fri, 15 Nov 2024 06:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 3/5] drivers/usb/dwc3/core.c:1447:69:
 warning: '%d' directive output may be truncated writing between 1 and 11
 bytes into a region of size 4
Message-ID: <202411150636.xFNoPeak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5f814d6bb4626aa0e59c08e51ac7c604601b8a4b
commit: 9f49b974c86db9070c108e904ead1aadddb7e5a6 [3/5] BACKPORT: usb: dwc3: core: Refactor PHY logic to support Multiport Controller
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150636.xFNoPeak-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150636.xFNoPeak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150636.xFNoPeak-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_hs_phy_setup':
   drivers/usb/dwc3/core.c:771:22: warning: variable 'hw_mode' set but not used [-Wunused-but-set-variable]
     771 |         unsigned int hw_mode;
         |                      ^~~~~~~
   drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
>> drivers/usb/dwc3/core.c:1447:69: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
    1447 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                                                                     ^~
   drivers/usb/dwc3/core.c:1447:63: note: directive argument in the range [-2147483641, 254]
    1447 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                                                               ^~~~~~~~~
   drivers/usb/dwc3/core.c:1447:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
    1447 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1464:68: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
    1464 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                                                                    ^~
   drivers/usb/dwc3/core.c:1464:62: note: directive argument in the range [-2147483641, 254]
    1464 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                                                              ^~~~~~~~~
   drivers/usb/dwc3/core.c:1464:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
    1464 |                         snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1447 drivers/usb/dwc3/core.c

  1410	
  1411	static int dwc3_core_get_phy(struct dwc3 *dwc)
  1412	{
  1413		struct device		*dev = dwc->dev;
  1414		struct device_node	*node = dev->of_node;
  1415		char phy_name[9];
  1416		int ret;
  1417		int i;
  1418	
  1419		if (node) {
  1420			dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
  1421			dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
  1422		} else {
  1423			dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1424			dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1425		}
  1426	
  1427		if (IS_ERR(dwc->usb2_phy)) {
  1428			ret = PTR_ERR(dwc->usb2_phy);
  1429			if (ret == -ENXIO || ret == -ENODEV)
  1430				dwc->usb2_phy = NULL;
  1431			else
  1432				return dev_err_probe(dev, ret, "no usb2 phy configured\n");
  1433		}
  1434	
  1435		if (IS_ERR(dwc->usb3_phy)) {
  1436			ret = PTR_ERR(dwc->usb3_phy);
  1437			if (ret == -ENXIO || ret == -ENODEV)
  1438				dwc->usb3_phy = NULL;
  1439			else
  1440				return dev_err_probe(dev, ret, "no usb3 phy configured\n");
  1441		}
  1442	
  1443		for (i = 0; i < dwc->num_usb2_ports; i++) {
  1444			if (dwc->num_usb2_ports == 1)
  1445				snprintf(phy_name, sizeof(phy_name), "usb2-phy");
  1446			else
> 1447				snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
  1448	
  1449			dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
  1450			if (IS_ERR(dwc->usb2_generic_phy[i])) {
  1451				ret = PTR_ERR(dwc->usb2_generic_phy[i]);
  1452				if (ret == -ENOSYS || ret == -ENODEV)
  1453					dwc->usb2_generic_phy[i] = NULL;
  1454				else
  1455					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1456								phy_name);
  1457			}
  1458		}
  1459	
  1460		for (i = 0; i < dwc->num_usb3_ports; i++) {
  1461			if (dwc->num_usb3_ports == 1)
  1462				snprintf(phy_name, sizeof(phy_name), "usb3-phy");
  1463			else
  1464				snprintf(phy_name, sizeof(phy_name), "usb3-%d", i);
  1465	
  1466			dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
  1467			if (IS_ERR(dwc->usb3_generic_phy[i])) {
  1468				ret = PTR_ERR(dwc->usb3_generic_phy[i]);
  1469				if (ret == -ENOSYS || ret == -ENODEV)
  1470					dwc->usb3_generic_phy[i] = NULL;
  1471				else
  1472					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1473								phy_name);
  1474			}
  1475		}
  1476	
  1477		return 0;
  1478	}
  1479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
