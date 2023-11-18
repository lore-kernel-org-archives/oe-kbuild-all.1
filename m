Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2D02CA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2oUvqaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700343344; x=1731879344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VymuWaacWeaq2SD97m0ZVzFc3UXoH/u+NQk7MnUnAL0=;
  b=Y2oUvqaKSjnOf5TwWfR0sjDXH3719vME8Y3RFmXo75s1uRDGICAAVIWP
   b7b68QkFuDwhFiwtQy/s1w8cpqHmJKJuaSYDxIW7ISABIrX4QO0IuColX
   5gDWwYEN71IlpjZwrj/gzHHIYLUM7L81KFa2HR0uUwPoQZvfopLycpssa
   oD3Er6jCqzmKYr2lyJm4XcTCU+X0FjKfYfRDHF2QDgjNmMFmy0kLqbj76
   sytNu2/Ym3/63zpV88JNvGN4uJspy0c92N9HBnhd039aeoLIOJEANyIoS
   FaNYeDqCjQehttGqNIfyBMCBV3ywWV/J5EI2gGnl4/qqC0ywHOzCm3JmI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="422548551"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="422548551"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 13:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="7342321"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2023 13:35:42 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4SyZ-0004Jl-1y;
	Sat, 18 Nov 2023 21:35:39 +0000
Date: Sun, 19 Nov 2023 05:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/accel/bmc150-accel-i2c.c:64:36: warning:
 'bmc150_accel_acpi_match' defined but not used
Message-ID: <202311190544.BAldQrGA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: 55637c38377a301cd0768cee73021e43d05de543 iio: bmc150: Split the driver into core and i2c
date:   8 years ago
config: x86_64-buildonly-randconfig-004-20230906 (https://download.01.org/0day-ci/archive/20231119/202311190544.BAldQrGA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190544.BAldQrGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190544.BAldQrGA-lkp@intel.com/

All warnings (new ones prefixed by >>):

     806 |         PVOP_VCALLEE1(pv_irq_ops.restore_fl, f);
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_irq_disable':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:542:33: note: in expansion of macro 'BUG_ON'
     542 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:592:17: note: in expansion of macro 'PVOP_TEST_NULL'
     592 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:609:9: note: in expansion of macro '____PVOP_VCALL'
     609 |         ____PVOP_VCALL(op.func, CLBR_RET_REG,                           \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:623:9: note: in expansion of macro '__PVOP_VCALLEESAVE'
     623 |         __PVOP_VCALLEESAVE(op, "", "")
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:811:9: note: in expansion of macro 'PVOP_VCALLEE0'
     811 |         PVOP_VCALLEE0(pv_irq_ops.irq_disable);
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'arch_local_irq_enable':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   arch/x86/include/asm/paravirt_types.h:542:33: note: in expansion of macro 'BUG_ON'
     542 | #define PVOP_TEST_NULL(op)      BUG_ON(op == NULL)
         |                                 ^~~~~~
   arch/x86/include/asm/paravirt_types.h:592:17: note: in expansion of macro 'PVOP_TEST_NULL'
     592 |                 PVOP_TEST_NULL(op);                                     \
         |                 ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:609:9: note: in expansion of macro '____PVOP_VCALL'
     609 |         ____PVOP_VCALL(op.func, CLBR_RET_REG,                           \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:623:9: note: in expansion of macro '__PVOP_VCALLEESAVE'
     623 |         __PVOP_VCALLEESAVE(op, "", "")
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:816:9: note: in expansion of macro 'PVOP_VCALLEE0'
     816 |         PVOP_VCALLEE0(pv_irq_ops.irq_enable);
         |         ^~~~~~~~~~~~~
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   include/asm-generic/fixmap.h: In function 'virt_to_fix':
   include/asm-generic/bug.h:145:47: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     145 | #define BUG_ON(condition) do { if (condition) ; } while (0)
         |                                               ^
   include/asm-generic/fixmap.h:37:9: note: in expansion of macro 'BUG_ON'
      37 |         BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
         |         ^~~~~~
   drivers/iio/accel/bmc150-accel-i2c.c: At top level:
   drivers/iio/accel/bmc150-accel-i2c.c:65:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      65 |         {"BSBA0150",    bmc150},
         |         ^
   In file included from drivers/iio/accel/bmc150-accel-i2c.c:23:
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:66:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      66 |         {"BMC150A",     bmc150},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:67:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      67 |         {"BMI055A",     bmi055},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:68:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      68 |         {"BMA0255",     bma255},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:69:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      69 |         {"BMA250E",     bma250e},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:70:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      70 |         {"BMA222E",     bma222e},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-i2c.c:71:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      71 |         {"BMA0280",     bma280},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
>> drivers/iio/accel/bmc150-accel-i2c.c:64:36: warning: 'bmc150_accel_acpi_match' defined but not used [-Wunused-const-variable=]
      64 | static const struct acpi_device_id bmc150_accel_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bmc150_accel_acpi_match +64 drivers/iio/accel/bmc150-accel-i2c.c

    63	
  > 64	static const struct acpi_device_id bmc150_accel_acpi_match[] = {
    65		{"BSBA0150",	bmc150},
    66		{"BMC150A",	bmc150},
    67		{"BMI055A",	bmi055},
    68		{"BMA0255",	bma255},
    69		{"BMA250E",	bma250e},
    70		{"BMA222E",	bma222e},
    71		{"BMA0280",	bma280},
    72		{ },
    73	};
    74	MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
