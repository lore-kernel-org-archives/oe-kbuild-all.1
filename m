Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586191D54D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694714122; x=1726250122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gzfVVIobtTpl1eHZSDj6c6tRUfIiK+KylZo67vSwMZk=;
  b=QJtLiif9NYSfhsDpE9m9dsMvwfGyOtZ2kJvlljplPQbvCQ7XP3a4SkKB
   ZPxlGn1Ar+eXBXtXoYtq9BHyBZzLG8xh1boKm8CZWgro8rT8b6zj/eolx
   CuN9B6Bn/OyzDxnHinIa78dONkKEkAQV20hGQFNXXu0f2HbtHZqQ72cNQ
   2RijGO+ZAaMnhZ5bu7xtiNOQvSt2GT/mHeVu4V9OI3iclYUOU0RoSXNwA
   jkS2EqSBMCXmB/frjlhpX2XmmbmESkAr1q+xoummfEyOTHDyzNK5nPsXU
   qz2Kh47wlsVLXwSaSqEfOPWQZLF8JSKSL1Zp5JblU8FKx8NOd/nqmQmjP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="409971102"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="409971102"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 10:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859807519"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="859807519"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2023 10:55:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgqYg-0001vA-0O;
	Thu, 14 Sep 2023 17:55:18 +0000
Date: Fri, 15 Sep 2023 01:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v1 81/85]
 drivers/acpi/riscv/irqchip.c:303:13: warning: no previous prototype for
 'riscv_acpi_aplic_platform_init'
Message-ID: <202309150155.8XXzWYkR-lkp@intel.com>
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
commit: de841019973531afedb65df33910fbaaa92eedbc [81/85] ACPI: RISC-V: Create APLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230915/202309150155.8XXzWYkR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150155.8XXzWYkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150155.8XXzWYkR-lkp@intel.com/

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
