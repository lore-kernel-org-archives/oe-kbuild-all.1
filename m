Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA927EC99
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491186; cv=none; b=dge91gCuvnUerkKVxLNLAcqPxQ8PejhPaOO56vP+CIKqt7PvU7FQKpbp1pb1rtGsXwp/iQcNW1eBtw8Cwm94vbuFRkEGd+oEBxw+SNlY2xRDNH4gbA6Y8fMCcDftb9LHQF5/Uor0Vm/pDyi3I/9p+MgETphpkC+MX83JhWGib8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491186; c=relaxed/simple;
	bh=r/ry++pB5ypOdmZUdCZyKtUe1qFpgAesdGa/or0qJdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdGajaAMoRdLgGX/LXKtX6d2Y3xM62iOoQ+Y+Hxx4waFtlvoU37Ep94QgO5IcyBXoqcftvYFvDepYaepfvqZzdRuJrYHudv6VqXlfydw/yO+B7PkpemmerxXPzLY9g+5pQQHe5P67eunb0GvB7M/7bcRqJydn+vCK6dIDzairB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy4qFAp3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy4qFAp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759491184; x=1791027184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/ry++pB5ypOdmZUdCZyKtUe1qFpgAesdGa/or0qJdk=;
  b=Fy4qFAp3ftgqiatuW072ChfHnDSm+2hpdQc8rQCAH3cp5e92izV//G9B
   6kwsGvGBRIPVBT8iegHcx/p9vIZgnLe+HzwMqpTbL8k2hXZa710Kn6ZyP
   R6BayBprWIjdpm9yTpRAahC8hms9/9glsf7TfVkPmOaF5sFRIjs3SejzC
   V63S6e5nFKVXZBxTUCbZobKlWvVSMCF0QUDd2nl5T8vR3CwFTJWqvJD54
   SgC4V/X17HS7miDzHk4MBRdP1uNg1CzzV3H/m/IX/KrfRk7oFfK5o5MQJ
   tnbDYf+KbeaigvtB1U7WCFyme5KbE4yavTHd3a5tnwmBNr+1FWoWcVlkZ
   w==;
X-CSE-ConnectionGUID: Rt7lZhWGTEyc5kUXJktK8g==
X-CSE-MsgGUID: 1VgvxSlDQbmuerUmQa2zRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="64387982"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="64387982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 04:33:03 -0700
X-CSE-ConnectionGUID: RrSBXiZaQGKf9RLPQRQMtg==
X-CSE-MsgGUID: VK+LP/EZR96sjfRfqO8hRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="209948407"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2025 04:33:02 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4e1z-0004Vy-1d;
	Fri, 03 Oct 2025 11:32:59 +0000
Date: Fri, 3 Oct 2025 19:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.17.y 7/42]
 drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart'
 undeclared
Message-ID: <202510031952.KMBKO3TZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.17.y
head:   59883f5092542f2ddea60beae00e640a10004243
commit: e96c61e9270dc19119d7c31f7d5a71e65dd9fb41 [7/42] ODROID-COMMON: power:reset: Add odroid support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251003/202510031952.KMBKO3TZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031952.KMBKO3TZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031952.KMBKO3TZ-lkp@intel.com/

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
