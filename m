Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676011CA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693225128; x=1724761128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XqX9XYagTd1bbaWo9cBx4u0m1fVD6QfOPXSYBUPPUc=;
  b=DpmwlD5Snx/6eMeoZAI9Ug99AtLlBNDjx2VxqJHcsbIWowcqJtWFgct5
   B73GFjWYUnLYkkz1xPiqfjXpuB6BI13cJdJ8xQVQDvwu4AtIP5hNdn1dG
   QK1ueeksaO/OAwPmVpGt8I2lCy7sPy6rWg5hPQVBDG+B1dmYbbrli+na1
   EJUHFwIeQy5lfX2KHAsdId/mSiHb97RFcQpoIUAKphJJoJoOfeekTrKqB
   u2WYDyW/1pX0rJiJ0zJ5t3JSJ3TqzlLdagOsOTfvJTuooZ2E3cIU63BK1
   bvJM45rFXzEEHBW28I1vrX8CGnus3JgpTOYrgcE5gwRKgTIbVUkoPR3nc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="360082343"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360082343"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 05:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="741365001"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="741365001"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 05:18:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qabCe-0007pw-3D;
	Mon, 28 Aug 2023 12:18:44 +0000
Date: Mon, 28 Aug 2023 20:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: [avpatel:riscv_acpi_b2_v1 116/117]
 drivers/acpi/riscv/irqchip.c:501:13: warning: no previous prototype for
 'riscv_acpi_plic_platform_init'
Message-ID: <202308282006.Hp7X35Fr-lkp@intel.com>
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
commit: e4bcb591f1e8f5b1405285edb4ba76aca9a965b7 [116/117] RISC-V: ACPI: Create PLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230828/202308282006.Hp7X35Fr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230828/202308282006.Hp7X35Fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308282006.Hp7X35Fr-lkp@intel.com/

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
