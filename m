Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A6A34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTLs5een"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585112; x=1733121112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkToBunISyj5JMG7HEqZU79bB4Zu9OidjjTuWFNXMNs=;
  b=BTLs5eenjs1+a7Jv6FpFYnPca4PymcLr2A2t1OtyVYnQystYKDBkYveW
   tlOqUCttrUrGrhTZjJU4iHVVFnT8vbQrLkexA5+bd34R7gDa8ri450gu+
   bKzF370B3p1nwQwTqSyUhsooJbKLkANyOwok5/5EwGmVpZmOqqXymmofQ
   l/zI2NXxfJDM6kLjQy8Vyo2qs84BtYhNVH4We0u2loXEO/O9DqbSlS14a
   JvEBEAjoKGWBKDJE/BhzKDOq4MhP5vGZ/Etvg9i6xQkRTCXR0UJSLYYdv
   e2u4hoTEAEJjtWbsg9MlFXkhrdqPYBAykpNKe9ofxQh8ezHQeaNYumBqV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180370"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180370"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556087"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556087"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g11-0006KZ-31;
	Sun, 03 Dec 2023 06:31:43 +0000
Date: Sun, 3 Dec 2023 14:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: drivers/mtd/maps/vmu-flash.c:722:24: error: 'struct mtd_info' has no
 member named 'usecount'
Message-ID: <202312022315.79twVRZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 19bfa9ebebb5ec0695def57eb1d80de7e9cab369 mtd: use refcount to prevent corruption
date:   5 months ago
config: sh-randconfig-c034-20221009 (https://download.01.org/0day-ci/archive/20231202/202312022315.79twVRZw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312022315.79twVRZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312022315.79twVRZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/maps/vmu-flash.c:12:
   include/linux/maple.h:81:23: error: field 'dev' has incomplete type
      81 |         struct device dev;
         |                       ^~~
   include/linux/maple.h:86:30: error: field 'drv' has incomplete type
      86 |         struct device_driver drv;
         |                              ^~~
   drivers/mtd/maps/vmu-flash.c: In function 'vmu_can_unload':
>> drivers/mtd/maps/vmu-flash.c:722:24: error: 'struct mtd_info' has no member named 'usecount'
     722 |                 if (mtd->usecount > 0)
         |                        ^~
   In file included from include/linux/init.h:5,
                    from drivers/mtd/maps/vmu-flash.c:8:
   drivers/mtd/maps/vmu-flash.c: In function 'probe_maple_vmu':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/maple.h:100:25: note: in expansion of macro 'container_of'
     100 | #define to_maple_dev(n) container_of(n, struct maple_device, dev)
         |                         ^~~~~~~~~~~~
   drivers/mtd/maps/vmu-flash.c:775:37: note: in expansion of macro 'to_maple_dev'
     775 |         struct maple_device *mdev = to_maple_dev(dev);
         |                                     ^~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/maple.h:101:28: note: in expansion of macro 'container_of'
     101 | #define to_maple_driver(n) container_of(n, struct maple_driver, drv)
         |                            ^~~~~~~~~~~~
   drivers/mtd/maps/vmu-flash.c:776:37: note: in expansion of macro 'to_maple_driver'
     776 |         struct maple_driver *mdrv = to_maple_driver(dev->driver);
         |                                     ^~~~~~~~~~~~~~~
   drivers/mtd/maps/vmu-flash.c: In function 'remove_maple_vmu':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/maple.h:100:25: note: in expansion of macro 'container_of'
     100 | #define to_maple_dev(n) container_of(n, struct maple_device, dev)
         |                         ^~~~~~~~~~~~
   drivers/mtd/maps/vmu-flash.c:787:37: note: in expansion of macro 'to_maple_dev'
     787 |         struct maple_device *mdev = to_maple_dev(dev);
         |                                     ^~~~~~~~~~~~


vim +722 drivers/mtd/maps/vmu-flash.c

47a72688fae729 Adrian McMenamin 2009-03-04  709  
47a72688fae729 Adrian McMenamin 2009-03-04  710  /* Callback to handle eccentricities of both mtd subsystem
47a72688fae729 Adrian McMenamin 2009-03-04  711   * and general flakyness of Dreamcast VMUs
47a72688fae729 Adrian McMenamin 2009-03-04  712   */
47a72688fae729 Adrian McMenamin 2009-03-04  713  static int vmu_can_unload(struct maple_device *mdev)
47a72688fae729 Adrian McMenamin 2009-03-04  714  {
47a72688fae729 Adrian McMenamin 2009-03-04  715  	struct memcard *card;
47a72688fae729 Adrian McMenamin 2009-03-04  716  	int x;
47a72688fae729 Adrian McMenamin 2009-03-04  717  	struct mtd_info *mtd;
47a72688fae729 Adrian McMenamin 2009-03-04  718  
47a72688fae729 Adrian McMenamin 2009-03-04  719  	card = maple_get_drvdata(mdev);
47a72688fae729 Adrian McMenamin 2009-03-04  720  	for (x = 0; x < card->partitions; x++) {
47a72688fae729 Adrian McMenamin 2009-03-04  721  		mtd = &((card->mtd)[x]);
47a72688fae729 Adrian McMenamin 2009-03-04 @722  		if (mtd->usecount > 0)
47a72688fae729 Adrian McMenamin 2009-03-04  723  			return 0;
47a72688fae729 Adrian McMenamin 2009-03-04  724  	}
47a72688fae729 Adrian McMenamin 2009-03-04  725  	return 1;
47a72688fae729 Adrian McMenamin 2009-03-04  726  }
47a72688fae729 Adrian McMenamin 2009-03-04  727  

:::::: The code at line 722 was first introduced by commit
:::::: 47a72688fae7298e1ad5fdc9bff7e04b6a549620 mtd: flash mapping support for Dreamcast VMU.

:::::: TO: Adrian McMenamin <adrian@newgolddream.dyndns.info>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
