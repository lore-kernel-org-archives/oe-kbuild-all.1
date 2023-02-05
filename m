Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3015C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 03:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675566248; x=1707102248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJ0G3/+qZOMhhZDgoMaJDIPW7ehxTPgDNPhzq0KuHZk=;
  b=Lm0sJHk5ZUh726/FtS+23zAvi7sw+wsF2WXrBMxNEP3dKH2bzqfhBJtP
   Yx1dsMw4KlngAkAghcaPxfpJ/sVgdVeUp9fqXd8HSvU1POEkfvRt2PujM
   CEdLmFNC63HuGYJbCV3yOwJ0zhUKAOMQN/nlhRV9JYuhvXI+BIUuHsJXT
   s6jH2h/GE63JjtNlvw4oaH4OtXSDtMAgqvDHSehcaJ1RTWBJzXY/ZAfne
   dXqqlCIIJGJayNLYUUkXsSDAK2r6a9Lm5SRNn9dJ/Y7P6f8g35BLfOKkO
   th+Xc+BOTPGv6rh8bslrL0im15110eW0uBNOUaaA4FCKE4fQBk//lwTPA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317017273"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317017273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 19:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="696525196"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="696525196"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 19:04:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOVK1-0001hQ-2k;
	Sun, 05 Feb 2023 03:04:05 +0000
Date: Sun, 5 Feb 2023 11:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_nested_v1 35/76]
 arch/riscv/include/asm/acpi.h:80:5: warning: no previous prototype for
 'acpi_get_riscv_isa'
Message-ID: <202302051035.L0veLRjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   27e6109638389f74b42fe02858caa9c7a381cbbe
commit: db4952f58ebd70e99ec95af6c8139e52f809a32a [35/76] RISC-V: ACPI: cpufeature: Add ACPI support in riscv_fill_hwcap()
config: riscv-randconfig-r035-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051035.L0veLRjj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/db4952f58ebd70e99ec95af6c8139e52f809a32a
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout db4952f58ebd70e99ec95af6c8139e52f809a32a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/cpufeature.c:16:
>> arch/riscv/include/asm/acpi.h:80:5: warning: no previous prototype for 'acpi_get_riscv_isa' [-Wmissing-prototypes]
      80 | int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
         |     ^~~~~~~~~~~~~~~~~~


vim +/acpi_get_riscv_isa +80 arch/riscv/include/asm/acpi.h

f6ce6a00404b8e Sunil V L 2023-01-30  67  
d8a08750a4fecf Sunil V L 2023-01-30  68  struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu);
d8a08750a4fecf Sunil V L 2023-01-30  69  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
d8a08750a4fecf Sunil V L 2023-01-30  70  static inline u32 get_acpi_id_for_cpu(int cpu)
d8a08750a4fecf Sunil V L 2023-01-30  71  {
d8a08750a4fecf Sunil V L 2023-01-30  72  	return	acpi_cpu_get_madt_rintc(cpu)->uid;
d8a08750a4fecf Sunil V L 2023-01-30  73  }
04edd69e833b9d Sunil V L 2023-01-30  74  int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa);
d8a08750a4fecf Sunil V L 2023-01-30  75  #else
d8a08750a4fecf Sunil V L 2023-01-30  76  static inline u32 get_acpi_id_for_cpu(int cpu)
d8a08750a4fecf Sunil V L 2023-01-30  77  {
d8a08750a4fecf Sunil V L 2023-01-30  78  	return -1;
d8a08750a4fecf Sunil V L 2023-01-30  79  }
04edd69e833b9d Sunil V L 2023-01-30 @80  int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const char **isa)
04edd69e833b9d Sunil V L 2023-01-30  81  {
04edd69e833b9d Sunil V L 2023-01-30  82  	return -1;
04edd69e833b9d Sunil V L 2023-01-30  83  }
d8a08750a4fecf Sunil V L 2023-01-30  84  

:::::: The code at line 80 was first introduced by commit
:::::: 04edd69e833b9da8cbae5866214e4891626072ae ACPI: RISC-V: drivers/acpi: Add RHCT related code

:::::: TO: Sunil V L <sunilvl@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
