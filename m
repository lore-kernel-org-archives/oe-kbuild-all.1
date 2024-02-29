Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75912FF7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215731; cv=none; b=U+92O67EfwnAsienAwuEoEemyg58SO2OxSam4ncULSYO+QzVqMIE22dlRBsL4HKSteu9ADGoOD9UVcFSdswU4wsYDbZ7fyCJnYSH+y+ZcAPUYi66w9gKhMmbcU5D2BFi/KprkhCh/cJPgGHOJOLLoojSkVdeLhn9SDXgXkIvGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215731; c=relaxed/simple;
	bh=VsAUhEOZON4qPGfHAQ6kn3iP28ZMCj8vL4tPbB2eAO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTdZw0lm1SWXPyDE95RedYEP61d4P/4HJ651YMK2iWOiS7XiWZ5qm4qrnXQzP31WQo3YT9QS+VHIRbBt8b8EXO/r8rkyB7ua5iMV68wh/CPeXnA8WovjMLmo30265GWZ6/97AE1gXwjlKqj4CwHlgwFN7l+3Tkp/avHEo5Leeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhjBHMiv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhjBHMiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215730; x=1740751730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsAUhEOZON4qPGfHAQ6kn3iP28ZMCj8vL4tPbB2eAO0=;
  b=KhjBHMivasKUJQL2wtSCB7zwzOoaXj7pWw1YcD3guQc6Jc5hOMTpRIQT
   8y4LX0VeWrqaaGJHsws2WU1WJz3BLBtnKFpY43FUoJbXcncG2akjncxZF
   gHPmlBqJL+PRv9bx/ouqkOj6dYaE20xBgw84pRRFNG2466GK3YH6ojTKU
   uXMKgmfkGhyrC+vEOV5/F1n0s+b7PJo8qz5aNxzLx/qyVb7eSF/ubU1Vu
   W7xn9ChDDYYw1HdDx2mQkm+w4BYAL9CMG3fSKi5/mwDN+VZ04Uafo1pfV
   JkQooGJZFuScFmcxOUeRbwEjZSdB2Er4rLS79yl2T8IFl4pIUZ5daDkVZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3851604"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3851604"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="31025185"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Feb 2024 06:08:48 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfh5Y-000Czj-2W;
	Thu, 29 Feb 2024 14:08:44 +0000
Date: Thu, 29 Feb 2024 22:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 6/6] drivers/acpi/bus.c:1451:undefined
 reference to `ghes_debugfs_init'
Message-ID: <202402292104.CIbyLyjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   6c540a23cb1194d67a9dcfefb702774a99afc3b1
commit: 6c540a23cb1194d67a9dcfefb702774a99afc3b1 [6/6] acpi/ghes: Add CXL CPER injection debugfs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240229/202402292104.CIbyLyjE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292104.CIbyLyjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292104.CIbyLyjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/acpi/bus.o: in function `acpi_init':
>> drivers/acpi/bus.c:1451:(.init.text+0x4b4): undefined reference to `ghes_debugfs_init'


vim +1451 drivers/acpi/bus.c

  1414	
  1415	static int __init acpi_init(void)
  1416	{
  1417		int result;
  1418	
  1419		if (acpi_disabled) {
  1420			pr_info("Interpreter disabled.\n");
  1421			return -ENODEV;
  1422		}
  1423	
  1424		acpi_kobj = kobject_create_and_add("acpi", firmware_kobj);
  1425		if (!acpi_kobj)
  1426			pr_debug("%s: kset create error\n", __func__);
  1427	
  1428		init_prmt();
  1429		acpi_init_pcc();
  1430		result = acpi_bus_init();
  1431		if (result) {
  1432			kobject_put(acpi_kobj);
  1433			disable_acpi();
  1434			return result;
  1435		}
  1436		acpi_init_ffh();
  1437	
  1438		pci_mmcfg_late_init();
  1439		acpi_viot_early_init();
  1440		acpi_hest_init();
  1441		acpi_ghes_init();
  1442		acpi_arm_init();
  1443		acpi_scan_init();
  1444		acpi_ec_init();
  1445		acpi_debugfs_init();
  1446		acpi_sleep_proc_init();
  1447		acpi_wakeup_device_init();
  1448		acpi_debugger_init();
  1449		acpi_setup_sb_notify_handler();
  1450		acpi_viot_init();
> 1451		ghes_debugfs_init();
  1452		return 0;
  1453	}
  1454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
