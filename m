Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF7DF60
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 03:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727839370; cv=none; b=SrffgI/8nc7C/Gn0vG5vN1MxCE1TF3tGo7evb7Ky3LuOyTkGNwka6gFsygTp/xQuNKvoiohEmFp6mwtrXA1x4u3VKlMTocROqwmHMY+sm9KHtjvKT30G6XEe+SFppS+r/syAHt/u1VTlLr89bYmJfABXM7/XAzapTNLlBUdIPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727839370; c=relaxed/simple;
	bh=4SmJY190WUJnhwoZKOFhNV89FV1URm3Yw9EHPWRvg14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqmkcD5TB908p9mb5SbRMAURKVfk1orVDp3JhZBlORcuyOPLvzWDlZdKzd7zDmDmcSR5Ss8CI5IV29rHbxiT5AlcMmpVZiklg8aJhlgesfiDk9sLTcgllLXKa3MzKHUa/YleCSQ/mNIGy9g/OqQKUMhGBQD1x7nLQhKrnaulPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/dF3zQE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/dF3zQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727839369; x=1759375369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SmJY190WUJnhwoZKOFhNV89FV1URm3Yw9EHPWRvg14=;
  b=G/dF3zQEXiKOQl+uz4HYicsMe6cYp1V4a/gI7PhGa4jtBGFQ/gQ+NknX
   iJOQmOQq1w5Bg73jEI5/fEaap7UAm7zTOiqZB4cH8vp6FdHIlIfdkbCYM
   vQnbs96uqL37qwlVuknoo3Yy2KIyOspqG/0QMZ3cA3qBKImAy5scMcmDR
   xujUp4WlOg7QbAQRN89kinOCMJgXRPy920EuS19YZA8gMZY4PXxtVE9EP
   E/644yBto5xoSsE+F4HaEVI2xhz3FhfJfuCv8okV5uWw92uaf25XOoiD6
   6BAYbJf3GkDTyyaBuVXB3rJE0zQNDMoT3vPnqLR1T4/C3JSY3r4t2tIEM
   A==;
X-CSE-ConnectionGUID: 1Rd1U0JUSZeQpcx7AAMtpA==
X-CSE-MsgGUID: 2egSFfHNRyy7aRIHs1AwrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26464712"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26464712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:22:46 -0700
X-CSE-ConnectionGUID: jFWXfenDQDijk7pkx+/F0A==
X-CSE-MsgGUID: DXhdC6YbQHiiMdekiU27/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="97235801"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 20:22:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svpwo-000RUO-1Q;
	Wed, 02 Oct 2024 03:22:42 +0000
Date: Wed, 2 Oct 2024 11:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct
 regmap_bus' has no member named 'read'
Message-ID: <202410021111.LknEX9ne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: c922c634bd926d84967275efbb7275b8645aa343 iio: accel: adxl367: Constify struct regmap_bus
date:   9 weeks ago
config: x86_64-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021111.LknEX9ne-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:38,
                    from include/linux/percpu.h:12,
                    from arch/x86/include/asm/msr.h:15,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/iio/accel/adxl367_spi.c:8:
   include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
      19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2888:5: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
    2888 | #if USE_SPLIT_PTE_PTLOCKS
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
      19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types_task.h:20:34: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
      20 | #define USE_SPLIT_PMD_PTLOCKS   (USE_SPLIT_PTE_PTLOCKS && \
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:3010:5: note: in expansion of macro 'USE_SPLIT_PMD_PTLOCKS'
    3010 | #if USE_SPLIT_PMD_PTLOCKS
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:75:21: error: variable 'adxl367_spi_regmap_bus' has initializer but incomplete type
      75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
         |                     ^~~~~~~~~~
>> drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct regmap_bus' has no member named 'read'
      76 |         .read = adxl367_read,
         |          ^~~~
   drivers/iio/accel/adxl367_spi.c:76:17: warning: excess elements in struct initializer
      76 |         .read = adxl367_read,
         |                 ^~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:76:17: note: (near initialization for 'adxl367_spi_regmap_bus')
>> drivers/iio/accel/adxl367_spi.c:77:10: error: 'const struct regmap_bus' has no member named 'write'
      77 |         .write = adxl367_write,
         |          ^~~~~
   drivers/iio/accel/adxl367_spi.c:77:18: warning: excess elements in struct initializer
      77 |         .write = adxl367_write,
         |                  ^~~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:77:18: note: (near initialization for 'adxl367_spi_regmap_bus')
   drivers/iio/accel/adxl367_spi.c:80:21: error: variable 'adxl367_spi_regmap_config' has initializer but incomplete type
      80 | static const struct regmap_config adxl367_spi_regmap_config = {
         |                     ^~~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:81:10: error: 'const struct regmap_config' has no member named 'reg_bits'
      81 |         .reg_bits = 8,
         |          ^~~~~~~~
   drivers/iio/accel/adxl367_spi.c:81:21: warning: excess elements in struct initializer
      81 |         .reg_bits = 8,
         |                     ^
   drivers/iio/accel/adxl367_spi.c:81:21: note: (near initialization for 'adxl367_spi_regmap_config')
   drivers/iio/accel/adxl367_spi.c:82:10: error: 'const struct regmap_config' has no member named 'val_bits'
      82 |         .val_bits = 8,
         |          ^~~~~~~~
   drivers/iio/accel/adxl367_spi.c:82:21: warning: excess elements in struct initializer
      82 |         .val_bits = 8,
         |                     ^
   drivers/iio/accel/adxl367_spi.c:82:21: note: (near initialization for 'adxl367_spi_regmap_config')
   drivers/iio/accel/adxl367_spi.c: In function 'adxl367_spi_probe':
   drivers/iio/accel/adxl367_spi.c:132:18: error: implicit declaration of function 'devm_regmap_init' [-Werror=implicit-function-declaration]
     132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
         |                  ^~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:132:16: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
         |                ^
   drivers/iio/accel/adxl367_spi.c: At top level:
   drivers/iio/accel/adxl367_spi.c:75:32: error: storage size of 'adxl367_spi_regmap_bus' isn't known
      75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/adxl367_spi.c:80:35: error: storage size of 'adxl367_spi_regmap_config' isn't known
      80 | static const struct regmap_config adxl367_spi_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +76 drivers/iio/accel/adxl367_spi.c

cbab791c5e2a58 Cosmin Tanislav 2022-02-14  74  
c922c634bd926d Javier Carrasco 2024-07-03  75  static const struct regmap_bus adxl367_spi_regmap_bus = {
cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @76  	.read = adxl367_read,
cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @77  	.write = adxl367_write,
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  78  };
cbab791c5e2a58 Cosmin Tanislav 2022-02-14  79  

:::::: The code at line 76 was first introduced by commit
:::::: cbab791c5e2a58c123d84bd9202c054e5449bc96 iio: accel: add ADXL367 driver

:::::: TO: Cosmin Tanislav <demonsingur@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
