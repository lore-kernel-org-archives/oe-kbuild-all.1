Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785151;
	b=dqaUAifCxjxL/Y+lSzhP8a0IwcrXVskRn8OUEGMgcgfbUIAKzpUBzMekUosW95Ii0e39
	 GcWeLAq2TyK6vGxusddSONyMMGMDFYRoKCWMGCFe80wDObOuE/I20jHLjozytfBtnweOL
	 +OtCMoqf/1ujjg1yifzyXrS03f7Ps9lowxe4GoTzDNjTQEsD1y1ZaPcElzN1req8uo2vl
	 M2+tokdctnNBRFgcyKDJXsI+mno4ouG3QLTrVTocvBgwkO9fEVqP+LckUHdpxX+tdM4Sr
	 Hcul/DJEZVfLDcKb7VxdxZGcQimbueIOYSzkrMFQdXLu5BhCgnhK+vwFPSYFbEB6CAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=r24Xqgu9RWWryNmSiGrv+qVupcxRhuFE8DU2Th+22Cs=;
	b=j7suZrWOQ73pwQBkAPEjBbMh3WT6wLwNukUY06CCxVhBI2J+jiKrwjfNP3KxOsXYHGSY
	 c16REDaE6UtQZlpTTbV323h9s7tf/woaZrDlRezKjOU9UO6k4RDZDq5Sz52VCnEIAecVR
	 hDr3wBK+HRsCIBfZ74fPAG6WR+9e0THzSZrCfx6Np3KdcIS/FTraCakYToYAIPnAtGRHh
	 WzMgjGlmIv+1TreTL4CfXWND9OPe3YSVhH3A11HerTDubsSS6Y6zdD5ZtdUamEEnmFdt2
	 yL5HUByBpg+IZldgB3qU3TZxqU+ZgQpDv2yR1CeTYO1HttawaSSMaDVOOVmXajGbkCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c80inWVf;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02546606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 23:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02546606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c80inWVf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794785150; x=1826321150;
  h=date:from:to:cc:subject:message-id;
  bh=G09ocJtTQaqtivdiatWtCWVjOj0U39513rpW41hvw2c=;
  b=c80inWVfICoclXSK0QIe6SC2kMUcfAR12VO6ZafWxx5q18tG4y/+0gEH
   00MzqQ7isidLd1UF4vYs1sbzaTTRBBa+txq5XoDNoBsuEj2L8P9rAHgic
   Kyq1HsX489pFolfIU0+UnBBfTjHt9yqfsOqCnYXz/CuTvkl5TqCXoAsrn
   dMI9KhfDqUftzRzDEx3D8USbB1slwuffGDqRKk7TpjEWS0qaq0FGI/5eN
   ZqEmzsWHCwAo9AIe6G1X+qsqWmz1mxKdO8OuZ4nEjy64x1xfm/COzemUj
   P6N1Ex7ehNt8+46XWcQjFfKh44l9m+zMOrJgY+1C726QdHKQ4y/BCvVIO
   Q==;
X-CSE-ConnectionGUID: fiGuNjmbQl2j7Kjr9CyNgg==
X-CSE-MsgGUID: PtDHxbn0SUmKc9oIHFo3Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3370951"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3370951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 15:25:50 -0800
X-CSE-ConnectionGUID: GW0kx3mxRgaH/cBSvpOOIA==
X-CSE-MsgGUID: AxPYUnTITXSLmc0xWa10Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9655778"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 15:25:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSjbV-000000002VL-2NwC;
	Sun, 15 Nov 2026 23:25:45 +0000
Date: Mon, 16 Nov 2026 00:24:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [broadcom-stblinux:drivers/next 5/22]
 drivers/firmware/raspberrypi.c:221 rpi_register_hwmon_driver() warn:
 inconsistent indenting
Message-ID: <202611160006.Lgyh7ZuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: c518d43026b6ca7d08fd9d3b23016b9f5d09f47c [5/22] firmware: raspberrypi: Store child devices in struct rpi_firmware
config: arm64-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160006.Lgyh7ZuO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160006.Lgyh7ZuO-lkp@intel.com/

smatch warnings:
drivers/firmware/raspberrypi.c:221 rpi_register_hwmon_driver() warn: inconsistent indenting
drivers/firmware/raspberrypi.c:247 rpi_register_clk_driver() warn: inconsistent indenting
drivers/firmware/raspberrypi.c:267 rpi_register_rtc_driver() warn: inconsistent indenting

vim +221 drivers/firmware/raspberrypi.c

   203	
   204	static void
   205	rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
   206	{
   207		struct platform_device *pdev;
   208		u32 packet;
   209		int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
   210						&packet, sizeof(packet));
   211	
   212		if (ret)
   213			return;
   214	
   215		pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
   216						     -1, NULL, 0);
   217	
   218		if (IS_ERR(pdev))
   219			return;
   220	
 > 221		 fw->hwmon_dev = pdev;
   222	}
   223	
   224	static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
   225	{
   226		struct device_node *firmware;
   227		struct platform_device *pdev;
   228	
   229		/*
   230		 * Earlier DTs don't have a node for the firmware clocks but
   231		 * rely on us creating a platform device by hand. If we do
   232		 * have a node for the firmware clocks, just bail out here.
   233		 */
   234		firmware = of_get_compatible_child(dev->of_node,
   235						   "raspberrypi,firmware-clocks");
   236		if (firmware) {
   237			of_node_put(firmware);
   238			return;
   239		}
   240	
   241		pdev = platform_device_register_data(dev, "raspberrypi-clk",
   242						     -1, NULL, 0);
   243	
   244		if (IS_ERR(pdev))
   245			return;
   246	
 > 247		 fw->clk_dev = pdev;
   248	}
   249	
   250	static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
   251	{
   252		struct platform_device *pdev;
   253	
   254		/*
   255		 * Check if our model of Raspberry Pi board is from the 5th gen
   256		 * as the RTC is only present on that model.
   257		 */
   258		if (!of_machine_is_compatible("brcm,bcm2712"))
   259			return;
   260	
   261		pdev = platform_device_register_data(dev, "raspberrypi-rtc",
   262						     -1, NULL, 0);
   263	
   264		if (IS_ERR(pdev))
   265			return;
   266	
 > 267		 fw->rtc_dev = pdev;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
