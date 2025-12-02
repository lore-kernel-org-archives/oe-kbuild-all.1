Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC44262FF6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764689377; cv=none; b=E93lxwVqdqNP5wIeZZGZlaq5YErNj2VECGCyZLohTr37NmrF3Rq2chBMJyOXmganaxeHNjxpgC7Vk78iMEi1o1kvpNo5QKRNrc7RdDz9PchPJVu5l02NVDN0UFpYOaPz0QA1riCCcvKwQVTJ/f4rFoTsICS/gO2BG4Bys8p9RrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764689377; c=relaxed/simple;
	bh=JaUQeqb7SSeLkQrHo8irvmqvtIF1VmwXPQcmc+sDbdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNu1F53GAZDZcuThLG8oDGqggNuydXoEWyxx2lfYjUIbka13e6AR/DdryYtKGnA1F4IIguCY3bxw/gvcPYrcxBlkZPSi1Gg1jbcUTT/Y/+Ic0cvNM+E3Ftyx34H65bmp/F9vjlkxVYe1Q4hxF6s7cw/DH8qqmdSOKFsKDaxpDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ce4gRv5h; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ce4gRv5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764689376; x=1796225376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JaUQeqb7SSeLkQrHo8irvmqvtIF1VmwXPQcmc+sDbdc=;
  b=ce4gRv5hJnYl2YWFXe0pFQb7R6PXf+MuchAebYCx/nXukzYhbksFdueT
   Mj/viKMDVDDL3V1u2cUcetInVKBvfAkp9acCYafhmZaTTqDuYeVgAZcCC
   n6dK7euR/Al5g/hdakuSpcpXfQcNGJqQzQ5p1CNuQnrwNpjz1Hc/T1F9R
   KCpAAk44LefIqIQlEoTLin1UDxigJcXg+Vj5ZzNwUDy1wZ60gHIXN8eub
   OThMljJaMuLqegL1RyWMcJo5vPU7Noea05Ms5DWYKBqKkqFsf5jlKfKXG
   zGtiwPYfGr3U+tEpSvgGlLA8aJpXQuh3Sl7JD5lc0rGh7iQ0HzN4d7cj8
   g==;
X-CSE-ConnectionGUID: nRlviCaxR+agLEwtwZlCxw==
X-CSE-MsgGUID: lLukQOpQRmaYE5kUe/IHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84259626"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="84259626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 07:29:35 -0800
X-CSE-ConnectionGUID: du14816aQ7WT1RmUVuqwJA==
X-CSE-MsgGUID: mBT+VWxaTcO7Q4P5xvXz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199532430"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 07:29:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQSJn-000000009vp-1Mz0;
	Tue, 02 Dec 2025 15:29:31 +0000
Date: Tue, 2 Dec 2025 23:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [broonie-ci:v6_20251125_haibo_chen_add_support_for_nxp_xspi 2/2]
 drivers/spi/spi-nxp-xspi.c:997:9: error: implicit declaration of function
 'PM_RUNTIME_ACQUIRE_AUTOSUSPEND'
Message-ID: <202512022326.iso1XJvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20251125_haibo_chen_add_support_for_nxp_xspi
head:   4105df382bd80d3ea5431c6065afe270a55a6dda
commit: 4105df382bd80d3ea5431c6065afe270a55a6dda [2/2] spi: add driver for NXP XSPI controller
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251202/202512022326.iso1XJvN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022326.iso1XJvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512022326.iso1XJvN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-nxp-xspi.c: In function 'nxp_xspi_exec_op':
>> drivers/spi/spi-nxp-xspi.c:997:9: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE_AUTOSUSPEND' [-Wimplicit-function-declaration]
     997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-nxp-xspi.c:997:51: error: 'pm' undeclared (first use in this function); did you mean 'tm'?
     997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
         |                                                   ^~
         |                                                   tm
   drivers/spi/spi-nxp-xspi.c:997:51: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/spi/spi-nxp-xspi.c:998:15: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE_ERR' [-Wimplicit-function-declaration]
     998 |         err = PM_RUNTIME_ACQUIRE_ERR(&pm);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-nxp-xspi.c: In function 'nxp_xspi_probe':
   drivers/spi/spi-nxp-xspi.c:1265:45: error: 'pm' undeclared (first use in this function); did you mean 'tm'?
    1265 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
         |                                             ^~
         |                                             tm


vim +/PM_RUNTIME_ACQUIRE_AUTOSUSPEND +997 drivers/spi/spi-nxp-xspi.c

   987	
   988	static int nxp_xspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
   989	{
   990		struct nxp_xspi *xspi = spi_controller_get_devdata(mem->spi->controller);
   991		void __iomem *base = xspi->iobase;
   992		u32 reg;
   993		int err;
   994	
   995		guard(mutex)(&xspi->lock);
   996	
 > 997		PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
 > 998		err = PM_RUNTIME_ACQUIRE_ERR(&pm);
   999		if (err)
  1000			return err;
  1001	
  1002		/* Wait for controller being ready. */
  1003		err = readl_poll_timeout(base + XSPI_SR, reg,
  1004				      !(reg & XSPI_SR_BUSY), 1, POLL_TOUT_US);
  1005		if (err) {
  1006			dev_err(xspi->dev, "SR keeps in BUSY!");
  1007			return err;
  1008		}
  1009	
  1010		nxp_xspi_select_mem(xspi, mem->spi, op);
  1011	
  1012		nxp_xspi_prepare_lut(xspi, op);
  1013	
  1014		/*
  1015		 * For read:
  1016		 *     the address in AHB mapped range will use AHB read.
  1017		 *     the address out of AHB mapped range will use IP read.
  1018		 * For write:
  1019		 *     all use IP write.
  1020		 */
  1021		if ((op->data.dir == SPI_MEM_DATA_IN) && !needs_ip_only(xspi)
  1022			&& ((op->addr.val + op->data.nbytes) <= xspi->memmap_phy_size))
  1023			err = nxp_xspi_ahb_read(xspi, op);
  1024		else
  1025			err = nxp_xspi_do_op(xspi, op);
  1026	
  1027		nxp_xspi_sw_reset(xspi);
  1028	
  1029		return err;
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
