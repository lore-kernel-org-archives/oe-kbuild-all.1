Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D80200C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KA9+C/Yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700348686; x=1731884686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eviOJfow0gsTEN/AUjGDWE2zLVe3hi/poqG9bc8Bb6M=;
  b=KA9+C/YzzmGbCyUQgPNRiMvsMM4oiEmdkIVwCVbC9mqoH/cPNQWV6NJf
   wXr3PMzvO7iPiECoCE/gmj1XUtj6oA/c/tITftDEBlbsV7o7bOENxu4lf
   74g84I9DMcaDpT2mIPpPn6TOUy+z1bPj1IeiWRMNzE0dPqcb18n9cHqPW
   GZYK8uxDqZ/04slWVKxZDc1dVuf+eQS8M5gh3zuYCztdRSJKgKROSfEu2
   KmJey8Bc5gvfV1qMaLvYsBVqFkqYPu0YPqjiT5YUVh/78184/aFp3G3ZT
   yHxJtT+bI4Ux2DfF4uSC7SrCuPB2m43rLw69f1FajW5yGlJz7bgBj7lzV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="10120231"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="10120231"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 15:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1013248032"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="1013248032"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2023 15:04:42 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4UMi-0004Q5-1A;
	Sat, 18 Nov 2023 23:04:40 +0000
Date: Sun, 19 Nov 2023 07:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: Adriana Reus <adriana.reus@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: drivers/iio/light/us5182d.c:479:36: warning: 'us5182d_acpi_match'
 defined but not used
Message-ID: <202311190738.gldzuIXo-lkp@intel.com>
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
commit: c14f8abe5304ba46b898cd381a0857fd61f87200 iio: light: Add support for UPISEMI uS5182d als and proximity sensor
date:   8 years ago
config: x86_64-buildonly-randconfig-003-20230823 (https://download.01.org/0day-ci/archive/20231119/202311190738.gldzuIXo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190738.gldzuIXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190738.gldzuIXo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/iio/light/us5182d.c:19:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:424:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     424 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/iio/light/us5182d.c: At top level:
   drivers/iio/light/us5182d.c:480:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
     480 |         { "USD5182", 0},
         |         ^
   In file included from include/linux/i2c.h:29,
                    from drivers/iio/light/us5182d.c:22:
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
>> drivers/iio/light/us5182d.c:479:36: warning: 'us5182d_acpi_match' defined but not used [-Wunused-const-variable=]
     479 | static const struct acpi_device_id us5182d_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
   drivers/iio/light/us5182d.c:281: warning: Function parameter or member 'data' not described in 'us5182d_update_dark_th'
   drivers/iio/light/us5182d.c:281: warning: Function parameter or member 'index' not described in 'us5182d_update_dark_th'
   drivers/iio/light/us5182d.c:303: warning: Function parameter or member 'data' not described in 'us5182d_apply_scale'
   drivers/iio/light/us5182d.c:303: warning: Function parameter or member 'index' not described in 'us5182d_apply_scale'


vim +/us5182d_acpi_match +479 drivers/iio/light/us5182d.c

   478	
 > 479	static const struct acpi_device_id us5182d_acpi_match[] = {
   480		{ "USD5182", 0},
   481		{}
   482	};
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
