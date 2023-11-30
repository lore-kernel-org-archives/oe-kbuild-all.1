Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AB4CB2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 05:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVE75lPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701320690; x=1732856690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFovUzAK/1X615RUH6MDlgAHZSILM8GrgwzPxIyJFtw=;
  b=WVE75lPSbL+OLHTOnvvuzhbKpfA2R35j/3k0FwFzIFFyFytYDcwtg9v/
   rGz3YpABFi/eQjayfV7I1a9Ea3kkZdeeCFtu68aUZHBjgd1Msq5OwYi8V
   trf0j8Ry62If0C/koF1NBuBgfG0XPiAy5b0BDMs60PUmyvazTY4g7Ieh6
   bUmRtSDsQ97/WeTLip4xkorFJFiVTGLK3w5Y600UfhqJX2hzJxw2x280X
   ZguagvYHWwUMr0BwOVsi4JKwbAFH8TUNuAtCpdyhiIyW6FJbmRCZ9LsnA
   s902TyyjNl4HRJCtZZZNxSHB2tNH8pHpcUVLDCRTxj3n+ifUoqIKTkyuS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396078913"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="396078913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 21:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745503684"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745503684"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 21:04:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ZED-0001OO-2v;
	Thu, 30 Nov 2023 05:04:45 +0000
Date: Thu, 30 Nov 2023 13:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/platform/mips/rs780e-acpi.c:47:6: warning: no previous
 prototype for 'pm2_iowrite'
Message-ID: <202311301354.Ga1imV7I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiaxun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 0cfd2440aa03ea3d4b04cc2565561cecadcb1257 MIPS: Loongson64: Make RS780E ACPI as a platform driver
date:   3 years, 7 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301354.Ga1imV7I-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301354.Ga1imV7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301354.Ga1imV7I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/mips/rs780e-acpi.c:35:6: warning: no previous prototype for 'pm_iowrite' [-Wmissing-prototypes]
      35 | void pm_iowrite(u8 reg, u8 value)
         |      ^~~~~~~~~~
   drivers/platform/mips/rs780e-acpi.c:41:4: warning: no previous prototype for 'pm_ioread' [-Wmissing-prototypes]
      41 | u8 pm_ioread(u8 reg)
         |    ^~~~~~~~~
>> drivers/platform/mips/rs780e-acpi.c:47:6: warning: no previous prototype for 'pm2_iowrite' [-Wmissing-prototypes]
      47 | void pm2_iowrite(u8 reg, u8 value)
         |      ^~~~~~~~~~~
>> drivers/platform/mips/rs780e-acpi.c:53:4: warning: no previous prototype for 'pm2_ioread' [-Wmissing-prototypes]
      53 | u8 pm2_ioread(u8 reg)
         |    ^~~~~~~~~~
   drivers/platform/mips/rs780e-acpi.c:72:6: warning: no previous prototype for 'acpi_registers_setup' [-Wmissing-prototypes]
      72 | void acpi_registers_setup(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/pm2_iowrite +47 drivers/platform/mips/rs780e-acpi.c

9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  46  
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29 @47  void pm2_iowrite(u8 reg, u8 value)
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  48  {
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  49  	pmio_write_index(PM2_INDEX, reg, value);
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  50  }
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  51  EXPORT_SYMBOL(pm2_iowrite);
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  52  
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29 @53  u8 pm2_ioread(u8 reg)
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  54  {
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  55  	return pmio_read_index(PM2_INDEX, reg);
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  56  }
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  57  EXPORT_SYMBOL(pm2_ioread);
9c057b3e02184b drivers/platform/mips/acpi_init.c Huacai Chen 2015-03-29  58  

:::::: The code at line 47 was first introduced by commit
:::::: 9c057b3e02184b111d3392be75efc7c94f0fdf20 MIPS: Loongson-3: Add chipset ACPI platform driver

:::::: TO: Huacai Chen <chenhc@lemote.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
