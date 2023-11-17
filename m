Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B74C6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL1SrRLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700191601; x=1731727601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53PZKnvtpMVoxFCGNPIQU5mNR3oNNOFSWNURwr8x7G4=;
  b=OL1SrRLhVY4p7bTUZMEIZVp14E51XUt6YWZV3ELeUBfmadGfU1ULugol
   nf4p/jui1SGU03WWxFlfm+44VfE0TiwIzb5MR9GuuB3KyiIkZAB2xmDUC
   sdbXuD8wE01g4y3H5brEsO0DiwNafSyCNOKOUIidI54TN8EPKn97Q4p6C
   iSKi7M0yZBGnjeG1mFdcc8vfkuBeqaDWzvpQe9pJe7I8eXBT4P9d8RDAz
   khsfRScml0w3STTX0/xd3KOeLLwLIznaAQcQZ+GqVY3zMltMZRlub8Bep
   b4MjE++5NPqKrB078bxgVzGYo2fVDYoZp+k5y2oNWsW32ZcMTyY3IY0dF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9888627"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="9888627"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 19:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831483704"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="831483704"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2023 19:26:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3pV6-0002Jz-0U;
	Fri, 17 Nov 2023 03:26:36 +0000
Date: Fri, 17 Nov 2023 11:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/accel/bmc150-accel-spi.c:54:36: warning:
 'bmc150_accel_acpi_match' defined but not used
Message-ID: <202311171116.47sUbZV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: f9ab96e212808123fbd9072d580a59194e5cd410 iio: bmc150: Add SPI driver
date:   8 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231117/202311171116.47sUbZV5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311171116.47sUbZV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311171116.47sUbZV5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from drivers/iio/accel/bmc150-accel-spi.c:19:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/iio/accel/bmc150-accel-spi.c: At top level:
   drivers/iio/accel/bmc150-accel-spi.c:55:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      55 |         {"BSBA0150",    bmc150},
         |         ^
   In file included from drivers/iio/accel/bmc150-accel-spi.c:20:
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:56:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      56 |         {"BMC150A",     bmc150},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:57:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      57 |         {"BMI055A",     bmi055},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:58:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      58 |         {"BMA0255",     bma255},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:59:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      59 |         {"BMA250E",     bma250e},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:60:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      60 |         {"BMA222E",     bma222e},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
   drivers/iio/accel/bmc150-accel-spi.c:61:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
      61 |         {"BMA0280",     bma280},
         |         ^
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
>> drivers/iio/accel/bmc150-accel-spi.c:54:36: warning: 'bmc150_accel_acpi_match' defined but not used [-Wunused-const-variable=]
      54 | static const struct acpi_device_id bmc150_accel_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bmc150_accel_acpi_match +54 drivers/iio/accel/bmc150-accel-spi.c

    53	
  > 54	static const struct acpi_device_id bmc150_accel_acpi_match[] = {
    55		{"BSBA0150",	bmc150},
    56		{"BMC150A",	bmc150},
    57		{"BMI055A",	bmi055},
    58		{"BMA0255",	bma255},
    59		{"BMA250E",	bma250e},
    60		{"BMA222E",	bma222e},
    61		{"BMA0280",	bma280},
    62		{ },
    63	};
    64	MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
