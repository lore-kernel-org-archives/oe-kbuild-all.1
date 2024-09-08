Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942317107F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725822038; cv=none; b=RHsu1Wyp5IsCnxww9CnC1p2zrkO6ecLmtcp0ZnUfXRMWIqUSLvijgYEL0vhAWsuZfw4f5KbJfw+dtEM06jY2CAw8+uQNKO6eS6VOvivYx1Zup/B47nHOhAlgZCap2MnMXAs8iPh9F1lVQ7t55//3EBGgTgQO+Yc5r7MrWxlk5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725822038; c=relaxed/simple;
	bh=YS38vJOyYA9p1FkTM6kNg0CiQyD3ndGOMl79DOuvFYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4+mhe8IMCI89cqHhJHy1/20Kl8BxeUjEfKv6VJzehevoo7sm/OHbe0Uvn97iNNoRMBNRUjMZBY2UZxisLumWptqUFP4E9cYYcsLHDxm6XwnMaOiKH4uicFecN5oq2y1kfLQ/Rl1TLWoi5ZGfKfAuKK893Yc7W96xuIgzevIY5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyLm9jOz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyLm9jOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725822036; x=1757358036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YS38vJOyYA9p1FkTM6kNg0CiQyD3ndGOMl79DOuvFYw=;
  b=EyLm9jOzE19J7DqefloTEBESwB0eOOKWamCpwFriHoRSb9FMFPHVugaE
   /dPQ3eGjby84HZRLZujVeFjic2LB50NSOHhmzA/UF30VOcJZFsXzcS2ah
   FDaZZZjXer6i0Hs0dl1JpbHdCgluK2oBLeTouuUbq7KgfOPgEMlY36APK
   ybigdo/ieCSfrg3gU8lwW4cWo4KwkhXZm8rnIftSixU8Os4vz6X5ef3UH
   fzOtO3dWOzOUhsKgBFxOyRNdyvsIDOEZNLPTzBB7fASYTZ4sDk8aVy8Hw
   EhaRo5Y0QTXHmVfjAIScjywn9lmCQ3mN7K98iNCTKQKW5RMvgGa7Q3g8y
   g==;
X-CSE-ConnectionGUID: jQTqrxfZQYujB/SFtF3HPQ==
X-CSE-MsgGUID: sDuL163yTj+auIl6tjDZ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35652349"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35652349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 12:00:33 -0700
X-CSE-ConnectionGUID: iUUBhl53Ro2tjlqLnvf+ng==
X-CSE-MsgGUID: Ocl1ERzZQoqMhsd4MNEmVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66089037"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 12:00:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snN9B-000DrJ-2h;
	Sun, 08 Sep 2024 19:00:29 +0000
Date: Mon, 9 Sep 2024 02:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Maslanka <mmaslanka@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [linux-next:master 7987/10296]
 drivers/platform/x86/intel/pmc/core.c:1501:17: error: implicit declaration
 of function 'acpi_pmtmr_register_suspend_resume_callback'
Message-ID: <202409090259.6vsS5Bni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: e774696b1f95cc758fa7fdf2b700733cfc7b6fb9 [7987/10296] platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended
config: x86_64-buildonly-randconfig-002-20240514 (https://download.01.org/0day-ci/archive/20240909/202409090259.6vsS5Bni-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090259.6vsS5Bni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090259.6vsS5Bni-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/intel/pmc/core.c: In function 'pmc_core_probe':
>> drivers/platform/x86/intel/pmc/core.c:1501:17: error: implicit declaration of function 'acpi_pmtmr_register_suspend_resume_callback' [-Werror=implicit-function-declaration]
    1501 |                 acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/intel/pmc/core.c: In function 'pmc_core_remove':
>> drivers/platform/x86/intel/pmc/core.c:1517:17: error: implicit declaration of function 'acpi_pmtmr_unregister_suspend_resume_callback' [-Werror=implicit-function-declaration]
    1517 |                 acpi_pmtmr_unregister_suspend_resume_callback();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/acpi_pmtmr_register_suspend_resume_callback +1501 drivers/platform/x86/intel/pmc/core.c

  1433	
  1434	static int pmc_core_probe(struct platform_device *pdev)
  1435	{
  1436		static bool device_initialized;
  1437		struct pmc_dev *pmcdev;
  1438		const struct x86_cpu_id *cpu_id;
  1439		int (*core_init)(struct pmc_dev *pmcdev);
  1440		const struct pmc_reg_map *map;
  1441		struct pmc *primary_pmc;
  1442		int ret;
  1443	
  1444		if (device_initialized)
  1445			return -ENODEV;
  1446	
  1447		pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
  1448		if (!pmcdev)
  1449			return -ENOMEM;
  1450	
  1451		pmcdev->crystal_freq = pmc_core_get_crystal_freq();
  1452	
  1453		platform_set_drvdata(pdev, pmcdev);
  1454		pmcdev->pdev = pdev;
  1455	
  1456		cpu_id = x86_match_cpu(intel_pmc_core_ids);
  1457		if (!cpu_id)
  1458			return -ENODEV;
  1459	
  1460		core_init = (int (*)(struct pmc_dev *))cpu_id->driver_data;
  1461	
  1462		/* Primary PMC */
  1463		primary_pmc = devm_kzalloc(&pdev->dev, sizeof(*primary_pmc), GFP_KERNEL);
  1464		if (!primary_pmc)
  1465			return -ENOMEM;
  1466		pmcdev->pmcs[PMC_IDX_MAIN] = primary_pmc;
  1467	
  1468		/* The last element in msr_map is empty */
  1469		pmcdev->num_of_pkgc = ARRAY_SIZE(msr_map) - 1;
  1470		pmcdev->pkgc_res_cnt = devm_kcalloc(&pdev->dev,
  1471						    pmcdev->num_of_pkgc,
  1472						    sizeof(*pmcdev->pkgc_res_cnt),
  1473						    GFP_KERNEL);
  1474		if (!pmcdev->pkgc_res_cnt)
  1475			return -ENOMEM;
  1476	
  1477		/*
  1478		 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
  1479		 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
  1480		 * in this case.
  1481		 */
  1482		if (core_init == spt_core_init && !pci_dev_present(pmc_pci_ids))
  1483			core_init = cnp_core_init;
  1484	
  1485		mutex_init(&pmcdev->lock);
  1486		ret = core_init(pmcdev);
  1487		if (ret) {
  1488			pmc_core_clean_structure(pdev);
  1489			return ret;
  1490		}
  1491	
  1492		pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(primary_pmc);
  1493		pmc_core_do_dmi_quirks(primary_pmc);
  1494	
  1495		pmc_core_dbgfs_register(pmcdev);
  1496		pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
  1497				       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
  1498	
  1499		map = primary_pmc->map;
  1500		if (map->acpi_pm_tmr_ctl_offset)
> 1501			acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
  1502								 pmcdev);
  1503	
  1504		device_initialized = true;
  1505		dev_info(&pdev->dev, " initialized\n");
  1506	
  1507		return 0;
  1508	}
  1509	
  1510	static void pmc_core_remove(struct platform_device *pdev)
  1511	{
  1512		struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
  1513		const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
  1514		const struct pmc_reg_map *map = pmc->map;
  1515	
  1516		if (map->acpi_pm_tmr_ctl_offset)
> 1517			acpi_pmtmr_unregister_suspend_resume_callback();
  1518	
  1519		pmc_core_dbgfs_unregister(pmcdev);
  1520		pmc_core_clean_structure(pdev);
  1521	}
  1522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
