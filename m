Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6B6126
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693223206; x=1724759206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/nnYmUEFXDW1LeldaK8ZR65ec5tXOT7fKLyj+r2J2s=;
  b=XHto3p9BWru9R7iRQOUrRQMOCqJ4c7LDMdOwv/nsZNZ98fZwOxfKGbDC
   udqVaRr92VsILdNIATjCjNqRSbRBqqcCs0b3p9qnanSY0VZq7mpmkPA1q
   ZENQEAKs4DbiUJS9UJovqwN13MAxPDgvGfi1Rp4iZo/Nfv1rE0WLkGuM7
   4aURKBSIVkiJq8Yx9VmMKXDuY6I2wv/ZcXO0sC993I2J3HRR5kuW3RoEw
   /5xmyIRi4q28mWIgx1RD6MuZdgtmBcmgu964meJvYXzNmIRE8AN8xndHj
   XGEVbnap6Scgk0Q6Lf8cG8aY+Em0jw8MFUkapywhaOGEPzD0W0KCbhOke
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354602548"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="354602548"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="912023354"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="912023354"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Aug 2023 04:46:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaahf-0007ox-1e;
	Mon, 28 Aug 2023 11:46:43 +0000
Date: Mon, 28 Aug 2023 19:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 113/117]
 drivers/acpi/riscv/irqchip.c:303:13: warning: no previous prototype for
 'riscv_acpi_aplic_platform_init'
Message-ID: <202308281923.HiGbudIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   0dfcf0819bb71244ce531288313d5d4dd1b834e8
commit: cb4dc09642b5d83e378f4635e7b776e1ceb9939b [113/117] ACPI: RISC-V: Create APLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230828/202308281923.HiGbudIN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230828/202308281923.HiGbudIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281923.HiGbudIN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irqchip.c:110:13: warning: no previous prototype for 'riscv_acpi_imsic_platform_init' [-Wmissing-prototypes]
     110 | void __init riscv_acpi_imsic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/irqchip.c:303:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     303 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_aplic_platform_init +303 drivers/acpi/riscv/irqchip.c

   302	
 > 303	void __init riscv_acpi_aplic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
