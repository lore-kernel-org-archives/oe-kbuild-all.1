Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082E3BF680
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372199; cv=none; b=RXHGSl6ZUWAn/8nky1Hx8GL3Cy0ca5+OScQdVltpLxcihzif4K50pwBJvkJUxlpLKmaTEbVGtS7DdpXbmBqC4XInBgKUrf4wdLvwxcLHIEGF55npZV6+C/ia6gneFG5oIhj0koZ2GXsAj1hrNLMWJ8dlCi2bWP4i1nxTudyCKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372199; c=relaxed/simple;
	bh=UZwYC/56dt+DTkBrkZYbxydc4QZn3l7PBtVxOE7nFjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R69a7nfl/DS31EvS1zggNP8UGOfMv0epBuB9/q7Q1BZj0OBjROtONxGdeTeKZIF9MtbhT/8j/2N52PdQ1ms+73zSDVmUdIfUXayRLsw9LIk+s7gm2WvZ0qWyQ1tVRSXLBD4nrHklgJMCvv04yoOiLDRgtaFsDGDmwTKwOJq/VjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clLSzC6n; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clLSzC6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782372198; x=1813908198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZwYC/56dt+DTkBrkZYbxydc4QZn3l7PBtVxOE7nFjM=;
  b=clLSzC6nzTRjftPh1poQMX4geO+ldQBs6S07IxIwKPveLHciBzVu/e+A
   jDUIfV+bkdSWxmUg5eHFkiBfiDxWFskKk7N40BKTsrf812RGu8vBvZm5u
   md1IFUQ80ID2DvfLGBAn2yGeX4Ptdc+aTcZx8GBL6+WMmS+6oxD+kghQF
   62/AHOP1N4Y6bwzgJKxJoC4Nh5bBto5MoDG+gSmmZsU2z/5dNnXHUkAHV
   xLZR9qmAgbohFoLaxwf2DSXtgfoWlltRv3BE9wPZCbKgmUb4GokfpqNdE
   +Rp5rjYRkzUC1nrRASECGzpzWGot82qNcmMM8JK/jSYbw/1En4NRJ1twy
   A==;
X-CSE-ConnectionGUID: dCBxTENfTSGqLAAy1Ug5fA==
X-CSE-MsgGUID: dkh9kxwOR0uJAVsWp7wLUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83334839"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83334839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:23:17 -0700
X-CSE-ConnectionGUID: dPHkHK7rQiqrkLIX3HQjmA==
X-CSE-MsgGUID: E6DUo6QkQQiQv+5oyjApRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250144578"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 00:23:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wceQR-000000003zh-12hD;
	Thu, 25 Jun 2026 07:23:05 +0000
Date: Thu, 25 Jun 2026 15:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gibson <daniel@gibson.sh>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s'
 directive argument is null
Message-ID: <202606251540.Nr2BtaNu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
commit: 428b9fd2dce50b4dc5cd9ade10b92efcf57ce7aa platform/x86/amd/pmc: Add delay_suspend module parameter
date:   2 weeks ago
config: x86_64-buildonly-randconfig-006-20260625 (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251540.Nr2BtaNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251540.Nr2BtaNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/platform/x86/amd/pmc/pmc.c:13:
   In function 'amd_pmc_want_suspend_delay',
       inlined from 'amd_pmc_s2idle_check' at drivers/platform/x86/amd/pmc/pmc.c:763:6:
>> drivers/platform/x86/amd/pmc/pmc.c:717:37: warning: '%s' directive argument is null [-Wformat-overflow=]
     717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/platform/x86/amd/pmc/pmc.c:717:17: note: in expansion of macro 'dev_info'
     717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
         |                 ^~~~~~~~
   drivers/platform/x86/amd/pmc/pmc.c: In function 'amd_pmc_s2idle_check':
   drivers/platform/x86/amd/pmc/pmc.c:717:279: note: format string is defined here
     717 |                 dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
         |                                                                                                                                                                                                                                                                                       ^~


vim +717 drivers/platform/x86/amd/pmc/pmc.c

   691	
   692	static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
   693	{
   694		/*
   695		 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
   696		 * me-time before sleeping or they get uncooperative after waking
   697		 * up and don't send events for keyboard and lid switch anymore.
   698		 *
   699		 * Unfortunately this doesn't entirely fix the problem: It can still
   700		 * happen when resuming with a timer (wakealarm), but at least the
   701		 * more common usecases (wakeup by opening lid or pressing a key)
   702		 * work fine with this workaround.
   703		 *
   704		 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
   705		 */
   706		if (amd_pmc_quirk_need_suspend_delay(pdev)) {
   707			/*
   708			 * delay_suspend=1 force-enables this, otherwise it can be
   709			 * disabled with disable_workarounds or delay_suspend=0
   710			 */
   711			if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
   712				dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
   713				return true;
   714			}
   715			dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
   716		} else if (delay_suspend == 1) {
 > 717			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
   718				 dmi_get_system_info(DMI_SYS_VENDOR),
   719				 dmi_get_system_info(DMI_PRODUCT_NAME),
   720				 dmi_get_system_info(DMI_PRODUCT_FAMILY),
   721				 dmi_get_system_info(DMI_BOARD_VENDOR),
   722				 dmi_get_system_info(DMI_BOARD_NAME));
   723			return true;
   724		}
   725		return false;
   726	}
   727	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
