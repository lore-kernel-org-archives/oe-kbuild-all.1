Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E225B095
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 01:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201569; cv=none; b=APtJ/u+dbF/echp+DLsfpr7inHobXnB0HLalOdq9+u1ivnu3DQflq/T9z2CCaCAsnUBinqyWVOKwFaxfN5CvwJDBPTHp+bF8daiW8SowmapBgZGSk5d2iTPS3XXwYshgSPd6VvcHQAPTuYlpOpl1Hdh7JYscp1k+tjDhcB8esVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201569; c=relaxed/simple;
	bh=rwyJbA7itEpV4hpPL6kTtsrgigNHQwXSw78uvKssne8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nZz7hMpmPdHwUZN7LIQsb8ftF9DyqJPJ5bHqppsw6Bd8wtSMHEt9MsWZN++lgcWPcI+MO1GWDBlq9jQk/gXyk5F5Q05VsTNNdvFivDaFng3OHVwRK8i4u7qMEJV44iKTEzaEDfIvp+1rdGZhDHL1dDm8GNzMu5ifLacsouYtg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drxm8aiJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drxm8aiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785201566; x=1816737566;
  h=date:from:to:cc:subject:message-id;
  bh=rwyJbA7itEpV4hpPL6kTtsrgigNHQwXSw78uvKssne8=;
  b=drxm8aiJYWWuDYDYfi9s7ReS7bi2N5OUsE+aKIA3BFIr/yh3qF89uQac
   hOUHmxV/WqAMV3u/QDDRmbQNI6da8PYK63JtkGiXn+AWSLY2vJJ/KbOBR
   OAnsLcvMAJm91htcaQhrZbP9z4ZYS8UNoHdJ5n8eXCWw9n3JZ/08ZwZii
   FVjKYTQ9poT5YPpphoGr1G2OSmhEWsvUlZEfHReAw4vR66KDB6qUPc6eD
   55s9ks7hnqmr/kGsPq5IKRowUVPW0GLTKnDqYElBJLhRGEkN8Jblocpb+
   UL0TtsuopeEdm3Jkr2EQOAErIuvRLvwOcaMV7cItHA13wucppqtAluBQs
   w==;
X-CSE-ConnectionGUID: Ne7tZ1VuSWa5zmY2/YU2zA==
X-CSE-MsgGUID: G6/xjEHiSU6wyxphnY88yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96933206"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="96933206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 18:19:26 -0700
X-CSE-ConnectionGUID: csDtz+dwQ6ug/XAIFTuMzw==
X-CSE-MsgGUID: 68FgBXDaSpWqFGn/238BHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263350207"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 18:19:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woWTb-000000001og-0bHz;
	Tue, 28 Jul 2026 01:19:23 +0000
Date: Tue, 28 Jul 2026 03:18:53 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/watchdog/w83627hf_wdt.c:477:76: warning: 'snprintf'
 output may be truncated before the last format character
Message-ID: <202607280322.11cbY6i7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paul-Louvel/watchdog-w83627hf_wdt-Replace-magic-numbers-with-descriptive-macros/20260727-030530
head:   755bcbc553aec8647f0f337daf2a12011b6e76b2
commit: 31600ea3f7702c3248b36b22a275225428a0092c watchdog: w83627hf_wdt: Convert to platform driver model
date:   30 hours ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260728/202607280322.11cbY6i7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280322.11cbY6i7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280322.11cbY6i7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/w83627hf_wdt.c: In function 'wdt_probe':
>> drivers/watchdog/w83627hf_wdt.c:477:76: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     477 |         snprintf(wdt_info.identity, sizeof(wdt_info.identity), "%s Watchdog",
         |                                                                            ^
   drivers/watchdog/w83627hf_wdt.c:477:9: note: 'snprintf' output between 10 and 33 bytes into a destination of size 32
     477 |         snprintf(wdt_info.identity, sizeof(wdt_info.identity), "%s Watchdog",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     478 |                  id->name);
         |                  ~~~~~~~~~


vim +/snprintf +477 drivers/watchdog/w83627hf_wdt.c

   467	
   468	static int wdt_probe(struct platform_device *pdev)
   469	{
   470		const struct platform_device_id *id = platform_get_device_id(pdev);
   471		enum chips chip = id->driver_data;
   472		struct device *dev = &pdev->dev;
   473		int ret;
   474	
   475		dev_info(dev, "WDT driver initialising\n");
   476	
 > 477		snprintf(wdt_info.identity, sizeof(wdt_info.identity), "%s Watchdog",
   478			 id->name);
   479	
   480		watchdog_init_timeout(&wdt_dev, timeout, NULL);
   481		watchdog_set_nowayout(&wdt_dev, nowayout);
   482		watchdog_stop_on_reboot(&wdt_dev);
   483	
   484		ret = w83627hf_init(&wdt_dev, chip);
   485		if (ret)
   486			return dev_err_probe(dev, ret, "failed to initialize watchdog\n");
   487	
   488		ret = devm_watchdog_register_device(&pdev->dev, &wdt_dev);
   489		if (ret)
   490			return ret;
   491	
   492		dev_info(dev, "initialized. timeout=%d sec (nowayout=%d)\n",
   493			 wdt_dev.timeout, nowayout);
   494	
   495		return ret;
   496	}
   497	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
