Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5047155C8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616447; cv=none; b=RJgsrVEMQHJ6L3GOcOuccwpAjck4XnR/nK0Yi1Z4mpYZlCCGqPa7jVxWda0aIbHogAyOFoL0pmV9+kagEycOFpXzbqZ9Oy+prstENS6jbv9mrwu+/QTpIYTs/p8r+jHgqT8myJZXPQTvUnnFwo0YfXLbPAM2zHqOXpKiK2Tvqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616447; c=relaxed/simple;
	bh=WVn6ADH+qE0/Bp3dg5VVmnVkSUe0rzKPS1hanGMDybc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPM3UipaSxTpgfnVwmdxlooZBA8xt6o9vF6/0SDCD1X23ptuFsENngVmJi6L0MtipsO5A+dklbgF4H2bXCmMaPBHjQEL+XOcyw5kmwEkzQqVGhoim5NTT/zkIemJm7awMQILQDdEriN+vySyp5bN3BrQ+vep9NnYk9KmWJfg/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcWBqzwu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcWBqzwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736616445; x=1768152445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVn6ADH+qE0/Bp3dg5VVmnVkSUe0rzKPS1hanGMDybc=;
  b=fcWBqzwuZ6NQ3pbFQWPMA4vEVfV8A769P+UXG2HEB1u7j6Fmj7fwct2h
   am1hZ04uvbgiil/eQjVkbOCYHV23IDN9ezmg+lZQfM0WlqDQFRBGnPvbS
   5C+yqI+63/tpDoFZoDvf5UnsykPMY7nFEIcz++0kirH+Qu34DQmW74SKh
   NEqPRcOB6t9vb4iNQLaWmv7eyLVdXOfvtkSpAwB1hPtJeb1GMiLtzG2m6
   fQ+PthCNR4Wd3daRKnVbe/BAeLbjRISVEzVej8VwJNFqoQiu8e0hAH4KB
   /kTd4g9vJGRCzA3p+Y/98VeimOXj1tjrfcHnKoSUK0trYkvycKkgiGMOb
   A==;
X-CSE-ConnectionGUID: NhsiIGs2R+OJew4wI/zKLA==
X-CSE-MsgGUID: hCZAV4ulSPWv/5RG0PKKbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36781037"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36781037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 09:27:24 -0800
X-CSE-ConnectionGUID: JPd57AQCRESd1akKUHuIVg==
X-CSE-MsgGUID: OMK3Y4AUR9WvG5nHbsFmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="134849232"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 09:27:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWfGa-000L32-0L;
	Sat, 11 Jan 2025 17:27:20 +0000
Date: Sun, 12 Jan 2025 01:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 433/504] drivers/mtd/spi-nor/swp.c:587
 spi_nor_try_unlock_all() warn: inconsistent indenting
Message-ID: <202501120103.MM777YTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 813cccfd34b37a250ae9b3857b11c77a2a0de203 [433/504] mtd: spi-nor: Avoid locking/unlocking unrequested memory blocks
config: i386-randconfig-141-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120103.MM777YTJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120103.MM777YTJ-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/swp.c:587 spi_nor_try_unlock_all() warn: inconsistent indenting

vim +587 drivers/mtd/spi-nor/swp.c

813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  555  
c4c795105f2924 Tudor Ambarus        2021-03-22  556  /**
c4c795105f2924 Tudor Ambarus        2021-03-22  557   * spi_nor_try_unlock_all() - Tries to unlock the entire flash memory array.
c4c795105f2924 Tudor Ambarus        2021-03-22  558   * @nor:	pointer to a 'struct spi_nor'.
c4c795105f2924 Tudor Ambarus        2021-03-22  559   *
c4c795105f2924 Tudor Ambarus        2021-03-22  560   * Some SPI NOR flashes are write protected by default after a power-on reset
c4c795105f2924 Tudor Ambarus        2021-03-22  561   * cycle, in order to avoid inadvertent writes during power-up. Backward
c4c795105f2924 Tudor Ambarus        2021-03-22  562   * compatibility imposes to unlock the entire flash memory array at power-up
c4c795105f2924 Tudor Ambarus        2021-03-22  563   * by default.
c4c795105f2924 Tudor Ambarus        2021-03-22  564   *
c4c795105f2924 Tudor Ambarus        2021-03-22  565   * Unprotecting the entire flash array will fail for boards which are hardware
c4c795105f2924 Tudor Ambarus        2021-03-22  566   * write-protected. Thus any errors are ignored.
c4c795105f2924 Tudor Ambarus        2021-03-22  567   */
c4c795105f2924 Tudor Ambarus        2021-03-22  568  void spi_nor_try_unlock_all(struct spi_nor *nor)
c4c795105f2924 Tudor Ambarus        2021-03-22  569  {
e0a3141aff2ef7 Amit Kumar Mahapatra 2024-12-05  570  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
c4c795105f2924 Tudor Ambarus        2021-03-22  571  	int ret;
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  572  	const struct flash_info *info = nor->info;
c4c795105f2924 Tudor Ambarus        2021-03-22  573  
c4c795105f2924 Tudor Ambarus        2021-03-22  574  	if (!(nor->flags & SNOR_F_HAS_LOCK))
c4c795105f2924 Tudor Ambarus        2021-03-22  575  		return;
c4c795105f2924 Tudor Ambarus        2021-03-22  576  
c4c795105f2924 Tudor Ambarus        2021-03-22  577  	dev_dbg(nor->dev, "Unprotecting entire flash array\n");
c4c795105f2924 Tudor Ambarus        2021-03-22  578  
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  579  	if (nor->info->id->bytes[0] == CFI_MFR_ATMEL ||
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  580  	    nor->info->id->bytes[0] == CFI_MFR_INTEL ||
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  581  	    nor->info->id->bytes[0] == CFI_MFR_SST ||
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  582  	    nor->flags & SNOR_F_HAS_LOCK) {
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  583  		if (info->flags & SST_GLOBAL_PROT_UNLK) {
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  584  			spi_nor_prot_unlock(nor);
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  585  		} else {
e0a3141aff2ef7 Amit Kumar Mahapatra 2024-12-05  586  			ret = spi_nor_unlock(&nor->mtd, 0, params->size);
c4c795105f2924 Tudor Ambarus        2021-03-22 @587  				if (ret)
c4c795105f2924 Tudor Ambarus        2021-03-22  588  					dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
c4c795105f2924 Tudor Ambarus        2021-03-22  589  		}
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  590  	}
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  591  }
c4c795105f2924 Tudor Ambarus        2021-03-22  592  

:::::: The code at line 587 was first introduced by commit
:::::: c4c795105f2924c80752c30ffd3c7029a8e0ef28 mtd: spi-nor: Move Software Write Protection logic out of the core

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
