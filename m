Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D72208A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694711600; x=1726247600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gb/murww2m2rXkLgUOYpT+OXa+2yE2STaLUXULh/Qt0=;
  b=j45lmXkU0yUelNVcskWmJQQ/+gJ5mlzg03rmbnhYWDb7M0zpI5PJn8Wl
   RfqVhxyRL6vilhtTdYTfhcxR0lf4SoZGzSSt80vCyG7rC7qXtzrPPiVq5
   GkUAKRyssg8ZvYDyxiEzqRw7z2jqXJkLilwM+PL02yEiTDLSuZf4ftPKs
   6Gdopf5idvOITfBafULAeIwgWyLckyu1CgdWb84EloIdvK3Uv++9Uo/tQ
   FnAKDtB3mlLNNGwPpUqkJHf3y8qMF7OgZV95oaXNLY6Ge9GhhmVw9aiA3
   B2SvTBzFK5n6eWNvCeeGMryW/8/4imKpMpMOESUTr0Cbl8fPPd+7epbEo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369317800"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="369317800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 10:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="773954769"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="773954769"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2023 10:13:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgpu0-0001sL-11;
	Thu, 14 Sep 2023 17:13:16 +0000
Date: Fri, 15 Sep 2023 01:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 79/85]
 drivers/acpi/riscv/irqchip.c:108:13: warning: no previous prototype for
 'riscv_acpi_imsic_platform_init'
Message-ID: <202309150142.bCfjbZ1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   20e056e5bd7a90eb271eb43d1138de5bdb7bf20d
commit: e150f4a167ab1d6d836fc031ed44411e1050c622 [79/85] ACPI: RISC-V: Create IMSIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230915/202309150142.bCfjbZ1q-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150142.bCfjbZ1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150142.bCfjbZ1q-lkp@intel.com/

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
