Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E814F6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694717318; x=1726253318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yg+I/BVGCaZ4KlxyuSeOvYdV2GUZhpINsTvKj4PlK08=;
  b=FaNjFF8pOrkkUSn9M1x+C1Uj9xdKmFIwdP6WpTbWTmUuSg78J4mXaTyW
   7FU7+kMQgpWmR9AJPVg7/EBjv0J2JbbiaXmyIRunXoXrIyosP7hl831Ts
   E4jdRhXt9s1JQDSvpgxWTcqTm801EOVDf0gzPPCHCXJ9BlbsZf/ATOCMU
   0MAr2ldW/yPmnOi2XMToES7Hwh0eCr/I2vdeZqBehqJxETSuldV+Nzquv
   zbSgel+I+CQ6VmV3r+PuLZyDuS3Yi3za2GmOwr1EVo8Ns1NHzSY+Q4cSh
   cAr6eYVumCY9tnFS1zWWHOYz6Ly5wxoJNiBjdeu0e6PI5crwre4xC4dXq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443088393"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="443088393"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="747865937"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="747865937"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Sep 2023 11:48:36 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgrOA-0001xL-0v;
	Thu, 14 Sep 2023 18:48:31 +0000
Date: Fri, 15 Sep 2023 02:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: [avpatel:riscv_acpi_b2_v1 84/85]
 drivers/acpi/riscv/irqchip.c:501:13: warning: no previous prototype for
 'riscv_acpi_plic_platform_init'
Message-ID: <202309150252.mDBYTV3Y-lkp@intel.com>
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
commit: 792f8c8826b7f9211f8efd32cf7ff649a6d182c0 [84/85] RISC-V: ACPI: Create PLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230915/202309150252.mDBYTV3Y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150252.mDBYTV3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150252.mDBYTV3Y-lkp@intel.com/

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
