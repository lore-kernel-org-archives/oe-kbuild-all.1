Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6283C6AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705929960; cv=none; b=VG4hOK64D3fC0gFKcLP8VUfTwqQFV1N2+5By7mNEZefrHjxSw/LazN8GlGi7TsZ+/u2JqXmTD+l8iyHBI2WLhKe3AMok8h1bJ/Aiala043rSSsEGBJI6Jrg0tLFELQhLTb6PRHg6PKG5cKhpIJO+byWg5HczXnMEwN1L2PRm/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705929960; c=relaxed/simple;
	bh=h5OH0TG28+3RFCXrDwiRswlAn7/NOJ8PH6IuK4JMDxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYfoebhdGnYrrcVY/j6YldqLH4mGViAzA9hJS2aWIx5tjH0a0G4yaJZk+tLapirIhsEMKYC5sRWHzLFOVtxPuug48uhooqgTn5WqJjGE6dAzC3hji+Wrti+icUolhtFeGMqVt1ybKu/7Yi/c6L0CuBbwTAjH9IIbgMdPSrxwZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1GcGiD8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1GcGiD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705929958; x=1737465958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5OH0TG28+3RFCXrDwiRswlAn7/NOJ8PH6IuK4JMDxU=;
  b=R1GcGiD85DseZoWZmfBDUUCnoW7GV0a+4uK36AartBjZtTtEaaR/yYJ7
   FvyG1A05p7CG0srE2HVh3IiplcbA0SD+S5oso4ffGSey9H4cknM7MmDor
   ETfj/zimpbOIwSXDoLTXyj9gKQfdgqh/7rxX+pphrBT/eVLfpE+v3a3XF
   v/h7h5fCDf6ughZ3aBhVjnmp+Z4KuEtOm6ReAiDooK2vTec9gpGBHt55s
   AHU6TXLe5x0PVxoYP1VbNGcwfvOmFZhiuSY756msFxMd/znoqoLa/UjAB
   jRn553NerqcZeXZZueHneVO+62T3gSfXqkChZnkOHHB5F0LMEJDh/eW9o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22683934"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22683934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="34038080"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2024 05:25:55 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRuJD-0006co-2A;
	Mon, 22 Jan 2024 13:25:51 +0000
Date: Mon, 22 Jan 2024 21:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15455/21561]
 drivers/staging/gmjstcm/tcm_tis_spi.c:817:36: warning:
 'tcm_tis_spi_acpi_match' defined but not used
Message-ID: <202401222135.PnRKwawm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d7de179b5122c922d0dcae88231947a26f47b632
commit: 5ebbfc8c29eb5eb6dfdab853bdb2a622e0533d7e [15455/21561] staging: TCM: add GMJS(Nationz Tech) TCM driver.
config: arm64-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240122/202401222135.PnRKwawm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401222135.PnRKwawm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401222135.PnRKwawm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: warning: no previous prototype for 'tcm_tis_spi_transfer' [-Wmissing-prototypes]
     109 | int tcm_tis_spi_transfer(struct device *dev, u32 addr, u16 len,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'recv_data':
   drivers/staging/gmjstcm/tcm_tis_spi.c:423:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     423 |         int ret;
         |             ^~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: At top level:
>> drivers/staging/gmjstcm/tcm_tis_spi.c:817:36: warning: 'tcm_tis_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     817 | static const struct acpi_device_id tcm_tis_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'cleanup_tis':
>> drivers/staging/gmjstcm/tcm_tis_spi.c:249:17: warning: 'inten' may be used uninitialized [-Wmaybe-uninitialized]
     249 |                 tcm_tis_writel(chip->dev, TCM_INT_ENABLE(chip->vendor.locality),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                                 ~TCM_GLOBAL_INT_ENABLE & inten);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:237:13: note: 'inten' was declared here
     237 |         u32 inten;
         |             ^~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'tcm_tis_init':
>> drivers/staging/gmjstcm/tcm_tis_spi.c:264:21: warning: 'vendor' may be used uninitialized [-Wmaybe-uninitialized]
     264 |         if ((vendor & 0xffff) != 0x19f5 && (vendor & 0xffff) != 0x1B4E)
         |             ~~~~~~~~^~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:260:13: note: 'vendor' was declared here
     260 |         u32 vendor, intfcaps;
         |             ^~~~~~


vim +/tcm_tis_spi_acpi_match +817 drivers/staging/gmjstcm/tcm_tis_spi.c

   816	
 > 817	static const struct acpi_device_id tcm_tis_spi_acpi_match[] = {
   818		{"TCMS0001", 0},
   819		{"SMO0768", 0},
   820		{"ZIC0601", 0},
   821		{}
   822	};
   823	MODULE_DEVICE_TABLE(acpi, tcm_tis_spi_acpi_match);
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
