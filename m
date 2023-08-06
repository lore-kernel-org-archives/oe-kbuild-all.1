Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512261C26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691299983; x=1722835983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T54keNRBmppTTOP9eCVYJpwrGoEGNg+b3PP8fAFfxHc=;
  b=Uf9NSbrsnjgm5JQXgR9yDIh5YefLZnYpY6IqFElfHgkHPa0Gjua5rSyx
   ELf2Zl7XO6bCIuQv/cAS2h032rZpMmzQEeSl/IWlCVOvYQNffDFcSaqcp
   /aPrVCsoVH+S8ci6AQTvqNsdw8kjtKmwL4lD+INxHfpR6k4TRqOVU+nIM
   UrPPvv0OUcqzAPjSXifJXLvxPPfqDxbbUrJ6S39wsYoismxn2EorMfvL+
   RnYkVKKioHfsVDGNW2g7TFN1zuGPaltceI1hz5lulvVxIjPhSrY2MImzQ
   YS8HJNvlZ2ZY1baS6qh8B7ySV0Nlb+EtXN9uoD9LfKXfhCRX/9jHJrQwr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="434197758"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="434197758"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 22:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="904316766"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="904316766"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Aug 2023 22:33:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSWNw-00042x-2S;
	Sun, 06 Aug 2023 05:33:00 +0000
Date: Sun, 6 Aug 2023 13:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 85/91]
 drivers/acpi/riscv/irqchip.c:108:13: warning: no previous prototype for
 'riscv_acpi_imsic_platform_init'
Message-ID: <202308061355.J4iCgjsy-lkp@intel.com>
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
commit: 75fa07fe3312197bd6b84b95d3dcdf3a54155f84 [85/91] ACPI: RISC-V: Create IMSIC platform device
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230806/202308061355.J4iCgjsy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061355.J4iCgjsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061355.J4iCgjsy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/irqchip.c:108:13: warning: no previous prototype for 'riscv_acpi_imsic_platform_init' [-Wmissing-prototypes]
     108 | void __init riscv_acpi_imsic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_imsic_platform_init +108 drivers/acpi/riscv/irqchip.c

   107	
 > 108	void __init riscv_acpi_imsic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
