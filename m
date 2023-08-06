Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421219C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691304366; x=1722840366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+FpB1dM0KPsJjahH80ahWCYxvBXzVX3RK6OpgxYq6g=;
  b=ZdQTc4NRQDUI7u2u6ixxDvxz0OK/16GKo/VkmRdv5N660O9hRkI2/4E3
   amc37FA8OFQEmN0qi/f3bnz5ttqaXTFFLTMGWFf9PoVVJCdmUSu/YbquA
   WrsAO77LOoJAGK1Co+3AI6mC6E00na6ZYDDs/ta1zrFPs5dAR2FTD1yYL
   awRA4FHBBbDc8O3J+wtJ7RoUo/2iQlh9nE7/dK8WJH9NBMsI/iek4pFQg
   fl1Xf9Aph1jKFw0OQlduT/rHvihTKdg5VOOc7SW8cVumwVcxDyJ/SczXD
   X1ysUJ4gz8frPNaav++wHPhdLr/TCow1rZqnRKH3coUloybMj8Kf/DMRB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="370353979"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="370353979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 23:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873874972"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2023 23:46:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSXWe-00046K-0K;
	Sun, 06 Aug 2023 06:46:04 +0000
Date: Sun, 6 Aug 2023 14:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: [avpatel:riscv_acpi_b2_v1 90/91]
 drivers/acpi/riscv/irqchip.c:501:13: warning: no previous prototype for
 'riscv_acpi_plic_platform_init'
Message-ID: <202308061451.PbuOnsYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   b09364548457cec51680b8f8b1a5e917b5e74cf5
commit: 463b2eb34cc5cbdf2009f67f06e325ef42d1f204 [90/91] RISC-V: ACPI: Create PLIC platform device
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230806/202308061451.PbuOnsYf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061451.PbuOnsYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061451.PbuOnsYf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irqchip.c:112:13: warning: no previous prototype for 'riscv_acpi_imsic_platform_init' [-Wmissing-prototypes]
     112 | void __init riscv_acpi_imsic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/riscv/irqchip.c:305:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     305 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/irqchip.c:501:13: warning: no previous prototype for 'riscv_acpi_plic_platform_init' [-Wmissing-prototypes]
     501 | void __init riscv_acpi_plic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_plic_platform_init +501 drivers/acpi/riscv/irqchip.c

   500	
 > 501	void __init riscv_acpi_plic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
