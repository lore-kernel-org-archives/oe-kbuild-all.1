Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639618C023
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919733; cv=none; b=nZN+5TEaotNgzrxKaIXew9JFjo5PzojWf/xwexuQJHbBDPAvxBr1pag11ftjbeFUb4Puhb1htyznaDR3S4Oat/taDiAsbpszitK2UBUPkzs2Dx1tADlrKf6S8KMJUEMSXwdU4gWSB9WWM8BsZvMJ3JsNSQ85dBexDFhH2+sstf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919733; c=relaxed/simple;
	bh=1XRbFjivy2UI63n8hEF1xsoWJeiDJ7ShAwl1TtE4Osg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mc9drqcokcy95IzHAyOuseBd9PSnYgRk93Z3UmEa/sEx3Qrmz5242myhsFYTdTr6rWwhPS6wpKqTCUyUc1vxMJHk55pe08zn6FznKSIGP+kiSzRoD7bJHVANTMYH4cjrAt29aUUJtZtk+oBtso+xUJuFCOtH4uyT4P/0C7REylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJtiL6bd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJtiL6bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724919731; x=1756455731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XRbFjivy2UI63n8hEF1xsoWJeiDJ7ShAwl1TtE4Osg=;
  b=QJtiL6bdiTu0FbXG7PLFCcM6V06d/BVWAVipiVtHvuw+PXaFG/O+4x0a
   RQezh0IvmeXIrqjAviJDAWQ1t+4Gx9LC2g0RmMvDx6Fk6mRJtZ38EgcR+
   gNm29xjjhg6MOY+cF3R89YA74RUxeOrq7/ZIs5VEweJNDfuMaotz6zT16
   mYJt5E6kIgmzVHCMD7JNF3+0mz5WHUZPP+GlPeIXxoj/6KqI0TEGD31Am
   fPeJshXgR1SkLqIU5DClb1wpxH6LU8HeAXKPBG/CkBgaQw391vP8s+FfI
   0lgCmdM1szpfMes4GQUfduljPJwpc7RU3+MrWpn5gyACvLMcBuwBqb3WR
   A==;
X-CSE-ConnectionGUID: tzRBJfDDS46Fda1xmWfI/w==
X-CSE-MsgGUID: vbNJ4IDGRXiy2upUnnBJxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23071012"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23071012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 01:22:10 -0700
X-CSE-ConnectionGUID: 8DXLO4AIQombw/+ImEdEhg==
X-CSE-MsgGUID: aqBA81d0TayvJrcNI29olw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="67864050"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Aug 2024 01:22:09 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjaPu-00001O-2t;
	Thu, 29 Aug 2024 08:22:06 +0000
Date: Thu, 29 Aug 2024 16:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: ningyu <ningyu@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 22/24] arch/riscv/kernel/bus_error.c:123:3-8: No need
 to set .owner here. The core will do it.
Message-ID: <202408291635.JJwDxA53-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: d877fe698cc67af36c4281e018700c7c341efbf2 [22/24] drivers: bus-error: Added SiFive Bus Error driver
config: riscv-randconfig-r062-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291635.JJwDxA53-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291635.JJwDxA53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291635.JJwDxA53-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

   WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
>> WARNING: modpost: drivers/pci/controller/dwc/pcie-eswin: section mismatch in reference: eswin_pcie_driver+0x8 (section: .data) -> eswin_pcie_remove (section: .exit.text)
   ERROR: modpost: missing MODULE_LICENSE() in drivers/reset/reset-eswin-eic7700.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/reset-eswin-eic7700.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/rnull_mod.o
   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
>> ERROR: modpost: "eic7700_tbu_power" [drivers/pci/controller/dwc/pcie-eswin.ko] undefined!
>> ERROR: modpost: "eic7700_tbu_power" [drivers/ata/ahci_eswin.ko] undefined!
>> ERROR: modpost: "eic7700_dynm_sid_enable" [drivers/ata/ahci_eswin.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/bus_error.c:123:3-8: No need to set .owner here. The core will do it.

vim +123 arch/riscv/kernel/bus_error.c

   118	
   119	static struct platform_driver bus_error_driver = {
   120		.probe = bus_error_probe,
   121		.driver = {
   122			.name = "buserror",
 > 123			.owner = THIS_MODULE,
   124			.of_match_table = of_match_ptr(eswin_bus_error_of_match),},
   125	};
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
