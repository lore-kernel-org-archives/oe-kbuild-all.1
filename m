Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCA07B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 00:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678235370; x=1709771370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sFFJivOjnv9nooeXuImGa7czGbNqT/Y+i61Glp4lYA=;
  b=aijDw1guDtlNp97zYZ6O8GYvBFbS+ip7zDZ5hLjIGaONuEe3C5SkVFoZ
   63P7nhK/0Svu2Uaex95lnFIWtp5bR6GhcqRBqSoPgmNfRd2H9nVnM7vsD
   FLpEAhdAg/tR559WJU3bPW1/GuZLAsHB2XVZTWZkGHMne7Eox4/0vSIUW
   JdMXfkI76ttjh4Vko07PommV1zj6J07IXErJsz/BwWwTyc86UyqywwX2j
   8LJeddVmdEGc0tXtFwY7mCptGdVV5+lK+cwqPKMs0qWIrwzdpxImzPdui
   cLoMKF2JhXg369R4RdoMM9Z/WnXaSoGYGM+JmEoHabmxvEdL6iIJQmPeK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338338105"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="338338105"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 16:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676765653"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676765653"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 16:29:27 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZhgN-0001i3-0Z;
	Wed, 08 Mar 2023 00:29:27 +0000
Date: Wed, 8 Mar 2023 08:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 33/35]
 drivers/base/core.c:2530:26: warning: passing argument 1 of
 'of_device_uevent' discards 'const' qualifier from pointer target type
Message-ID: <202303080806.bLIAHccu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: 576fd27b398772cd60c431ee26e40051d7bbbce0 [33/35] of: module: Mutate of_device_uevent() into two helpers
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230308/202303080806.bLIAHccu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/miquelraynal/linux-0day/commit/576fd27b398772cd60c431ee26e40051d7bbbce0
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 576fd27b398772cd60c431ee26e40051d7bbbce0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080806.bLIAHccu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpufreq.h:18,
                    from drivers/base/core.c:12:
   include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'; have 'int(struct device *, struct kobj_uevent_env *)'
     107 | static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
         |                   ^~~~~~~~~~~~~~~~
   include/linux/of_device.h:81:20: note: previous definition of 'of_device_uevent' with type 'void(const struct device *, struct kobj_uevent_env *)'
      81 | static inline void of_device_uevent(const struct device *dev,
         |                    ^~~~~~~~~~~~~~~~
   drivers/base/core.c: In function 'dev_uevent':
>> drivers/base/core.c:2530:26: warning: passing argument 1 of 'of_device_uevent' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2530 |         of_device_uevent(dev, env);
         |                          ^~~
   In file included from include/linux/cpufreq.h:18,
                    from drivers/base/core.c:12:
   include/linux/of_device.h:107:51: note: expected 'struct device *' but argument is of type 'const struct device *'
     107 | static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
         |                                    ~~~~~~~~~~~~~~~^~~


vim +2530 drivers/base/core.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  2494  
56d5f362ad0f8f6 Greg Kroah-Hartman 2023-01-11  2495  static int dev_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
^1da177e4c3f415 Linus Torvalds     2005-04-16  2496  {
56d5f362ad0f8f6 Greg Kroah-Hartman 2023-01-11  2497  	const struct device *dev = kobj_to_dev(kobj);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2498  	int retval = 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2499  
6fcf53acccf85b4 Kay Sievers        2009-04-30  2500  	/* add device node properties if present */
23681e479129854 Greg Kroah-Hartman 2006-06-14  2501  	if (MAJOR(dev->devt)) {
6fcf53acccf85b4 Kay Sievers        2009-04-30  2502  		const char *tmp;
6fcf53acccf85b4 Kay Sievers        2009-04-30  2503  		const char *name;
2c9ede55ecec580 Al Viro            2011-07-23  2504  		umode_t mode = 0;
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2505  		kuid_t uid = GLOBAL_ROOT_UID;
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2506  		kgid_t gid = GLOBAL_ROOT_GID;
6fcf53acccf85b4 Kay Sievers        2009-04-30  2507  
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2508  		add_uevent_var(env, "MAJOR=%u", MAJOR(dev->devt));
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2509  		add_uevent_var(env, "MINOR=%u", MINOR(dev->devt));
3c2670e6515cf58 Kay Sievers        2013-04-06  2510  		name = device_get_devnode(dev, &mode, &uid, &gid, &tmp);
6fcf53acccf85b4 Kay Sievers        2009-04-30  2511  		if (name) {
6fcf53acccf85b4 Kay Sievers        2009-04-30  2512  			add_uevent_var(env, "DEVNAME=%s", name);
e454cea20bdcff1 Kay Sievers        2009-09-18  2513  			if (mode)
e454cea20bdcff1 Kay Sievers        2009-09-18  2514  				add_uevent_var(env, "DEVMODE=%#o", mode & 0777);
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2515  			if (!uid_eq(uid, GLOBAL_ROOT_UID))
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2516  				add_uevent_var(env, "DEVUID=%u", from_kuid(&init_user_ns, uid));
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2517  			if (!gid_eq(gid, GLOBAL_ROOT_GID))
4e4098a3e08783c Greg Kroah-Hartman 2013-04-11  2518  				add_uevent_var(env, "DEVGID=%u", from_kgid(&init_user_ns, gid));
3c2670e6515cf58 Kay Sievers        2013-04-06  2519  			kfree(tmp);
6fcf53acccf85b4 Kay Sievers        2009-04-30  2520  		}
23681e479129854 Greg Kroah-Hartman 2006-06-14  2521  	}
23681e479129854 Greg Kroah-Hartman 2006-06-14  2522  
414264f959cf46f Kay Sievers        2007-03-12  2523  	if (dev->type && dev->type->name)
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2524  		add_uevent_var(env, "DEVTYPE=%s", dev->type->name);
414264f959cf46f Kay Sievers        2007-03-12  2525  
239378f16aa1ab5 Kay Sievers        2006-10-07  2526  	if (dev->driver)
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2527  		add_uevent_var(env, "DRIVER=%s", dev->driver->name);
239378f16aa1ab5 Kay Sievers        2006-10-07  2528  
07d57a32fb6eb2d Grant Likely       2012-02-01  2529  	/* Add common DT information about the device */
07d57a32fb6eb2d Grant Likely       2012-02-01 @2530  	of_device_uevent(dev, env);
07d57a32fb6eb2d Grant Likely       2012-02-01  2531  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2532  	/* have the bus specific function add its stuff */
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2533  	if (dev->bus && dev->bus->uevent) {
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2534  		retval = dev->bus->uevent(dev, env);
f9f852df2faf76a Kay Sievers        2006-10-07  2535  		if (retval)
7dc72b284238168 Greg Kroah-Hartman 2007-11-28  2536  			pr_debug("device: '%s': %s: bus uevent() returned %d\n",
1e0b2cf933ebf32 Kay Sievers        2008-10-30  2537  				 dev_name(dev), __func__, retval);
^1da177e4c3f415 Linus Torvalds     2005-04-16  2538  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  2539  
2620efef7029bb0 Greg Kroah-Hartman 2006-06-28  2540  	/* have the class specific function add its stuff */
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2541  	if (dev->class && dev->class->dev_uevent) {
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2542  		retval = dev->class->dev_uevent(dev, env);
f9f852df2faf76a Kay Sievers        2006-10-07  2543  		if (retval)
7dc72b284238168 Greg Kroah-Hartman 2007-11-28  2544  			pr_debug("device: '%s': %s: class uevent() "
1e0b2cf933ebf32 Kay Sievers        2008-10-30  2545  				 "returned %d\n", dev_name(dev),
2b3a302a0973527 Harvey Harrison    2008-03-04  2546  				 __func__, retval);
2620efef7029bb0 Greg Kroah-Hartman 2006-06-28  2547  	}
f9f852df2faf76a Kay Sievers        2006-10-07  2548  
eef35c2d41ddcc6 Stefan Weil        2010-08-06  2549  	/* have the device type specific function add its stuff */
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2550  	if (dev->type && dev->type->uevent) {
7eff2e7a8b65c25 Kay Sievers        2007-08-14  2551  		retval = dev->type->uevent(dev, env);
f9f852df2faf76a Kay Sievers        2006-10-07  2552  		if (retval)
7dc72b284238168 Greg Kroah-Hartman 2007-11-28  2553  			pr_debug("device: '%s': %s: dev_type uevent() "
1e0b2cf933ebf32 Kay Sievers        2008-10-30  2554  				 "returned %d\n", dev_name(dev),
2b3a302a0973527 Harvey Harrison    2008-03-04  2555  				 __func__, retval);
2620efef7029bb0 Greg Kroah-Hartman 2006-06-28  2556  	}
2620efef7029bb0 Greg Kroah-Hartman 2006-06-28  2557  
^1da177e4c3f415 Linus Torvalds     2005-04-16  2558  	return retval;
^1da177e4c3f415 Linus Torvalds     2005-04-16  2559  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  2560  

:::::: The code at line 2530 was first introduced by commit
:::::: 07d57a32fb6eb2da017796e038682f817a4f685e drivercore: Output common devicetree information in uevent

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
