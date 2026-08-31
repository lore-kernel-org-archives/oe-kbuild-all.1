Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818943A6B8A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 02:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144024; cv=none; b=NXXR3qYwpMN9u2A/6228fymRAa+NwqRnWbZTFYyPCa/vvfOUGhTWfkx7KzZN0DRlOKfOlIJWVbw1toFoww/etd6na4ycVXk41qdZ9WMojEOu6coPl5RDad3P2CJE/6GYQHbiazfIxukAhEn3eOQewcMF1KD4gSnaU7z2NtXy0b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144024; c=relaxed/simple;
	bh=2GdDY4UxHP5s4alvRqEhTZuMTKgL1HTeCxz3frokmSg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JFJNo+S4IKwm719l80/ffMNSyuo7TlRaCg1Nw+ZtgUxlvMsyOQDMEMGwHrkNASRC+ktAfq0/i5+qi8bFl3ulPk8dc8QP8awOblrKlAejeVgDKvN2SOlQpa/96eWpPEIqRldGM5F/GWVMthPVj2JA50dFl4akafoDjGpok6LD8Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJr6vN6Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJr6vN6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788144020; x=1819680020;
  h=date:from:to:cc:subject:message-id;
  bh=2GdDY4UxHP5s4alvRqEhTZuMTKgL1HTeCxz3frokmSg=;
  b=mJr6vN6QVRHfUDxPhf8s6r0EPnczCNBzSTbi4CWm8+LAOdkSzOw+2+0s
   SEDgJcniV3C/QJN+VooD6mL//8f+ag3SFQy+WHm77FV4OMaW2EWdGMv03
   l1dcdnOe5907dJmICDZTKLMbkxO5al0B6Filrs1Y0VcKwj2NxtWiJMJ43
   ifho/L7CoiihDiEaEAroHvbH/ISho5Je/hrn3R0wMR91XBzcbskYX6Hkh
   7LMJOIrohdTnPlYBZ+1RY7MtORKi0dbjwIFzXxeGyYycM3X466Cjpd1cg
   x0htWkeWEvCvI6OKKg+SECpwdf+dX1nnSmDw8Mr9r9P+OFA+60JLXNz9z
   g==;
X-CSE-ConnectionGUID: xNtSjp3gQ8e9IScU8mrtWw==
X-CSE-MsgGUID: wPfPMWFZSJqabAvm48ETAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87676824"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="87676824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 19:40:17 -0700
X-CSE-ConnectionGUID: xtCRf1oZSXGJjySLMFk3Hw==
X-CSE-MsgGUID: uu1NCWKfTxyJgh92OVpGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292167646"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 19:40:16 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0rwU-000000000Md-0qaz;
	Mon, 31 Aug 2026 02:40:14 +0000
Date: Mon, 31 Aug 2026 04:39:51 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@nabladev.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/usb/dwc3/dwc3-generic-plat.c:114:35: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202608310438.95i46Myq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-phy-Document-ST-STM32MP25-USB2-FEMTO-PHY/20260822-094634
head:   37913ed44bd5c9e2fe5e7bd8ea4188171e6740b7
commit: baaedb19717a9c195ea1823e134a40ac6ca68036 usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue
date:   8 days ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608310438.95i46Myq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310438.95i46Myq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310438.95i46Myq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/dwc3/dwc3-generic-plat.c: In function 'dwc3_stm32mp25_init':
>> drivers/usb/dwc3/dwc3-generic-plat.c:114:35: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     114 |                                   FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
         |                                   ^~~~~~~~~~


vim +/FIELD_PREP +114 drivers/usb/dwc3/dwc3-generic-plat.c

    93	
    94	static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
    95	{
    96		struct device *dev = dwc3g->dev;
    97		bool ovrcur_polarity_low = device_property_read_bool(dev, "over-current-active-low");
    98		bool prt_pwr_ctrl = device_property_read_bool(dev, "st,enable-port-power-control");
    99		bool usb2only_conf = device_property_match_string(dev, "phy-names", "usb3-phy") < 0;
   100		bool vbusen_polarity_low = device_property_read_bool(dev, "st,vbusen-active-low");
   101		struct regmap *regmap;
   102		u32 drcr;
   103	
   104		regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg", 1, &drcr);
   105		if (IS_ERR(regmap))
   106			return dev_err_probe(dev, PTR_ERR(regmap), "No st,syscfg phandle specified\n");
   107	
   108		return regmap_update_bits(regmap, drcr,
   109					  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
   110					  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
   111					  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
   112					  STM32MP2_USB3DRCR_USB2ONLYD |
   113					  STM32MP2_USB3DRCR_USB2ONLYH,
 > 114					  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
   115						     prt_pwr_ctrl) |
   116					  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
   117						     ovrcur_polarity_low) |
   118					  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
   119						     vbusen_polarity_low) |
   120					  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD,
   121						     !!usb2only_conf) |
   122					  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH,
   123						     !!usb2only_conf));
   124	}
   125	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
