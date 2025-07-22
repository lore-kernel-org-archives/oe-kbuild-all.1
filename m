Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07972B644
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211793; cv=none; b=YddLnLpmh8oRqFHE+u39pen5PSwAS7ITN1A8U17HVwV4fff/ya6AC2mIb9hxXiGMaS/BMNt898VewCLMgW6iPlQgfsOy2Vp+6+768Cr04Ybc+aoLIBKeNVHMsuMzyGItmpBGS2sjlCTL0qKOc2YUroNVEjS4FUJ/L2IXNOtCugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211793; c=relaxed/simple;
	bh=OvBL/Vs7lgDawPWzd2FZxtUmGMZppbUUfmWOgdoxTtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ij1WhVUo6opys9lVrpKLy7sONieeCSbMok59J6KA3VswLzG2YS5PhZVjs0PKnvJSX/RbdMX6IPYJQvoSrJPq5b1w9rz8CVEAsEWnvHCro1Mr08dFxZzUmizkpnmVP+r62+HcD5vqeCh7Z8BWHFbUplvNjn6jCCv98kS/ewXMIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQsL5xfi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQsL5xfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753211792; x=1784747792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OvBL/Vs7lgDawPWzd2FZxtUmGMZppbUUfmWOgdoxTtE=;
  b=CQsL5xfisJzbAChh7rrYpRmgiEGi0SJhJg2RrIBewShzLb5XSmbBfeXI
   eNRIgLCD5AegIBx+tAR7nxtj+pkIlTnqxCrjKDIscDBV7sxWSgdPASNLs
   lCL2y2CTULbI5BogIqx2eLQ6zeJxnC+BiCi3G7SgBRbE3JZJcPNQd1xjF
   s19pbuEk4gSEX9vcCYWX3k1EtPdkP+v9VqtuXeSFr4NouqDewdB4WyHGJ
   BJR2+q5P6EQFoZy3pa6DajJCXZktMGZaZ11g7/aCvGlFLE0Q8yUES9z0o
   zw+36QIQSoBjDWQf1TF0tG/v2XDweTwDyHnzlBPDuMnLnLTdxmEcsSQnn
   Q==;
X-CSE-ConnectionGUID: uHjlMVuxTSOw6KjXa5MRpg==
X-CSE-MsgGUID: 3gQw32qPSVCyEc4NvcBOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66546677"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="66546677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:16:32 -0700
X-CSE-ConnectionGUID: 6kIAalx/Tkib1U9U5fJo7Q==
X-CSE-MsgGUID: 9aEInDRTR7+H7Mg/BASwRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="159960614"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2025 12:16:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueITU-000Idb-2D;
	Tue, 22 Jul 2025 19:16:28 +0000
Date: Wed, 23 Jul 2025 03:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.16.y 8/44]
 drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart'
 undeclared
Message-ID: <202507230322.mHt3DKH7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: ae8f39e1d572c4a923777ad79a242261a2dc6fe2 [8/44] ODROID-COMMON: power:reset: Add odroid support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250723/202507230322.mHt3DKH7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230322.mHt3DKH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230322.mHt3DKH7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c: In function 'odroid_restart_probe':
>> drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart' undeclared (first use in this function)
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c:141:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/arm_pm_restart +141 drivers/power/reset/odroid-reboot.c

   133	
   134	static int odroid_restart_probe(struct platform_device *pdev)
   135	{
   136		struct device_node *of_node;
   137		u32 id;
   138	
   139		if (!of_property_read_u32(pdev->dev.of_node, "sys_reset", &id)) {
   140			psci_function_id_restart = id;
 > 141			arm_pm_restart = do_odroid_restart;
   142		}
   143	
   144		if (!of_property_read_u32(pdev->dev.of_node, "sys_poweroff", &id)) {
   145			psci_function_id_poweroff = id;
   146			pm_power_off = do_odroid_poweroff;
   147		}
   148	
   149		of_node = pdev->dev.of_node;
   150	
   151		sd_vqsw = of_get_named_gpio(of_node, "sd-vqsw", 0);
   152		if (!gpio_is_valid(sd_vqsw)) sd_vqsw = 0;
   153	
   154		sd_vmmc = of_get_named_gpio(of_node, "sd-vmmc", 0);
   155		if (!gpio_is_valid(sd_vmmc)) sd_vmmc = 0;
   156	
   157		sd_vqen = of_get_named_gpio(of_node, "sd-vqen", 0);
   158		if (!gpio_is_valid(sd_vqen)) sd_vqen = 0;
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
