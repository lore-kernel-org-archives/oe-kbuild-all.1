Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C730D4C83
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693216450; x=1724752450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xsfx/y2PfjP//KGxagVKOu9KAGdfUKoVRNu637fhX0Q=;
  b=atwUGbRiTbBN3cDIhnnq57TKEWr7PTn7m/izGcli3kJjYDtUKEJGVYeZ
   gJShQN47AXGYP0GCVytTVKwjgcnP06dxUQqinTA5pV6PEPfmusduY4dpT
   xJGm4c46uQqhAoEectDztfc0/xEyP0+QlEZaDTx2hxFgW9ANgfnCbkJuV
   oOj0eK4KqAvQQZpwfueqNdofFsS5cmpRURNm0BB0cEDOt76S76U3Xzfc/
   JAZ/HLKE5qf2elJ9/7g3/2ogIW8BZj20JTxvfuw9c1fNhJBe11GTrI9FD
   6OGBFEORPQ2H2j6ndKFMQBBKKM8IPHMOBRq69MdCRNiYLhDPdW9T62vU7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372469703"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372469703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 02:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852780035"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="852780035"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2023 02:54:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaYwa-0007lf-0t;
	Mon, 28 Aug 2023 09:54:02 +0000
Date: Mon, 28 Aug 2023 17:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 111/117]
 drivers/acpi/riscv/irqchip.c:108:13: warning: no previous prototype for
 'riscv_acpi_imsic_platform_init'
Message-ID: <202308281740.CAHAbQVw-lkp@intel.com>
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
commit: adcbd6cb047ccabe073253cde722e902ecf458e2 [111/117] ACPI: RISC-V: Create IMSIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230828/202308281740.CAHAbQVw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281740.CAHAbQVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281740.CAHAbQVw-lkp@intel.com/

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
