Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C760762B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678246475; x=1709782475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ghcNwVVCnTagp+zqaAP8jGKLzjAPQfJNxtapLutEOI=;
  b=HU6r23AKKtv7sykwF6gId/0Umsg/30yZOgczPaBL+beS9ht+hckdyejE
   Kxu32+wVobKZfAU+ydVfB29lXSgTmYGm5makC/XGN3ZdWLWmzArrDWUmK
   58mQ6UN8O+xQvFh/DR6j+4fpDc0ltp85DpfBsL7b6/YFNSLU1QxVsuDkx
   q+OJW7BsjR0MobF8SLj0VJsHPw/7duHn4WCe7IbT4isn4tX7wZOb0tyHh
   6Rk3cDjK6DmkFRCv97lMg9EnNZb4XWPsLyHhcryVerRyl/qNIRIiONI94
   j/po3e/QPQuNqK4HiCapSjaAkA+qQqL8SsaVHqCDX3ROLf3DooaH+BlY0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422315421"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="422315421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 19:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740960385"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="740960385"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 19:34:34 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZkZV-0001qB-2C;
	Wed, 08 Mar 2023 03:34:33 +0000
Date: Wed, 8 Mar 2023 11:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 35/35]
 drivers/gpu/host1x/bus.c:349:33: error: passing argument 1 of
 'of_device_uevent' from incompatible pointer type
Message-ID: <202303081126.ihdgVBW9-lkp@intel.com>
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
commit: d8752324726fdde6bb205a5aa95ae8ff7d84eff7 [35/35] gpu: host1x: Stop open-coding of_device_uevent()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081126.ihdgVBW9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/d8752324726fdde6bb205a5aa95ae8ff7d84eff7
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout d8752324726fdde6bb205a5aa95ae8ff7d84eff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081126.ihdgVBW9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/host1x/bus.c: In function 'host1x_device_uevent':
>> drivers/gpu/host1x/bus.c:349:33: error: passing argument 1 of 'of_device_uevent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     349 |         return of_device_uevent(&dev->parent, env);
         |                                 ^~~~~~~~~~~~
         |                                 |
         |                                 struct device * const*
   In file included from drivers/gpu/host1x/bus.c:13:
   include/linux/of_device.h:44:57: note: expected 'const struct device *' but argument is of type 'struct device * const*'
      44 | static inline int of_device_uevent(const struct device *dev,
         |                                    ~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/of_device_uevent +349 drivers/gpu/host1x/bus.c

   340	
   341	/*
   342	 * Note that this is really only needed for backwards compatibility
   343	 * with libdrm, which parses this information from sysfs and will
   344	 * fail if it can't find the OF_FULLNAME, specifically.
   345	 */
   346	static int host1x_device_uevent(const struct device *dev,
   347					struct kobj_uevent_env *env)
   348	{
 > 349		return of_device_uevent(&dev->parent, env);
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
