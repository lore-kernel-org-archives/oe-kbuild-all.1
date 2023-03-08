Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCB7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678239154; x=1709775154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijWOljyudzck11OQhcHkEwHXr4D0KdkMrXlFR6975Ck=;
  b=W6utzPHBUU3EcYzP1eZFBvcfjMfQG9waO3k//311c9DcuH4+uB5la0Vu
   FRnsySXvCGdlRz/K9eXobK/SR21KwSK4WCLt0s/SOsmBZ3IT7UydFf8F3
   vJU30DhW/8CVKPKkU7YuWZOy1pZgZV3jmIBuNFElDv9TSsxKxjAtl7QyV
   Ev9VEfOoyQJCopBt7XYkN9m3HW/R00e530DuIc8XP2ZkfrOPddctzUqg+
   YAInPBx0aIwV43NbHvfd/Z84PJ/Sf1JwArpfbaplOoXdXqa4hsR7dMIBM
   GXWr5NWgRsGsUnlaYtjUYxZZZVe7E4SyGZByJyyxelgZ8oNlvReWKwOdE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334739194"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="334739194"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 17:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="679157951"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="679157951"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2023 17:32:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZifO-0001lf-1p;
	Wed, 08 Mar 2023 01:32:30 +0000
Date: Wed, 8 Mar 2023 09:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 33/35]
 include/linux/of_device.h:107:19: error: conflicting types for
 'of_device_uevent'; have 'int(struct device *, struct kobj_uevent_env *)'
Message-ID: <202303080902.bQK5UwtJ-lkp@intel.com>
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
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230308/202303080902.bQK5UwtJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/miquelraynal/linux-0day/commit/576fd27b398772cd60c431ee26e40051d7bbbce0
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 576fd27b398772cd60c431ee26e40051d7bbbce0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080902.bQK5UwtJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpufreq.h:18,
                    from drivers/base/core.c:12:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'; have 'int(struct device *, struct kobj_uevent_env *)'
     107 | static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
         |                   ^~~~~~~~~~~~~~~~
   include/linux/of_device.h:81:20: note: previous definition of 'of_device_uevent' with type 'void(const struct device *, struct kobj_uevent_env *)'
      81 | static inline void of_device_uevent(const struct device *dev,
         |                    ^~~~~~~~~~~~~~~~
   drivers/base/core.c: In function 'dev_uevent':
   drivers/base/core.c:2530:26: warning: passing argument 1 of 'of_device_uevent' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2530 |         of_device_uevent(dev, env);
         |                          ^~~
   In file included from include/linux/cpufreq.h:18,
                    from drivers/base/core.c:12:
   include/linux/of_device.h:107:51: note: expected 'struct device *' but argument is of type 'const struct device *'
     107 | static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
         |                                    ~~~~~~~~~~~~~~~^~~
--
   In file included from include/linux/cpufreq.h:18,
                    from include/trace/events/power.h:8,
                    from drivers/base/syscore.c:12:
>> include/linux/of_device.h:107:19: error: conflicting types for 'of_device_uevent'; have 'int(struct device *, struct kobj_uevent_env *)'
     107 | static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
         |                   ^~~~~~~~~~~~~~~~
   include/linux/of_device.h:81:20: note: previous definition of 'of_device_uevent' with type 'void(const struct device *, struct kobj_uevent_env *)'
      81 | static inline void of_device_uevent(const struct device *dev,
         |                    ^~~~~~~~~~~~~~~~


vim +107 include/linux/of_device.h

   106	
 > 107	static inline int of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
   108	{
   109		return -ENODEV;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
