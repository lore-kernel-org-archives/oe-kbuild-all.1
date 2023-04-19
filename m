Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462FC941
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681924439; x=1713460439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRE8jyeLWrKsQ01DBZ9FXLs5cGaf8uT4dAJf4TSPOJ8=;
  b=eVJfMAZYsOTuwaFh29oUmFucs89UmZFpXLVPT0jVjLWmWVtooE8eboc1
   IswLGkxMs3gOIVduGRr5LvYnCIU04IzOVDItq8GyZZQckEEh3UVrEJckW
   L6S36P/a+3DT/lkg9CYmvpI7wWpOtj7i4KQy0/BoMH/ShS4HdeSklswW8
   IDku7lD2UKoY2k0H5eVxCpptJNiE6nFsSwCwRmlczmbtEcGFY+od/kOGk
   XqxLd9wYCSftjkVtU932U7xd368zEkMOtan3dJCxRCqPiioLEsDPxGQx5
   S/heziO9wX3R7igNj4ZYl9Fp8V59jhCxgu371/YH6vVYBfZeVZUvgrEF9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344259982"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="344259982"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 10:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760814640"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="760814640"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 10:13:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppBNV-000f2i-1F;
	Wed, 19 Apr 2023 17:13:57 +0000
Date: Thu, 20 Apr 2023 01:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 5285/7898]
 drivers/hwtracing/coresight/coresight-etm4x-core.c:118:5: warning: no
 previous prototype for 'ete_sysreg_read'
Message-ID: <202304200148.ooyZezc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suzuki,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   599ad660291e9e6b440d7b25af31d48125b25e88
commit: 82ce4a8af88d25d3f75de6e8437de3d2f049cac3 [5285/7898] FROMLIST: coresight: ete: Add support for ETE sysreg access
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304200148.ooyZezc0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 82ce4a8af88d25d3f75de6e8437de3d2f049cac3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200148.ooyZezc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:118:5: warning: no previous prototype for 'ete_sysreg_read' [-Wmissing-prototypes]
     118 | u64 ete_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
         |     ^~~~~~~~~~~~~~~
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:135:6: warning: no previous prototype for 'ete_sysreg_write' [-Wmissing-prototypes]
     135 | void ete_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit)
         |      ^~~~~~~~~~~~~~~~


vim +/ete_sysreg_read +118 drivers/hwtracing/coresight/coresight-etm4x-core.c

   117	
 > 118	u64 ete_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
   119	{
   120		u64 res = 0;
   121	
   122		switch (offset) {
   123		ETE_READ_CASES(res)
   124		default :
   125			pr_warn_ratelimited("ete: trying to read unsupported register @%x\n",
   126					    offset);
   127		}
   128	
   129		if (!_relaxed)
   130			__iormb(res);	/* Imitate the !relaxed I/O helpers */
   131	
   132		return res;
   133	}
   134	
 > 135	void ete_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit)
   136	{
   137		if (!_relaxed)
   138			__iowmb();	/* Imitate the !relaxed I/O helpers */
   139		if (!_64bit)
   140			val &= GENMASK(31, 0);
   141	
   142		switch (offset) {
   143		ETE_WRITE_CASES(val)
   144		default :
   145			pr_warn_ratelimited("ete: trying to write to unsupported register @%x\n",
   146					    offset);
   147		}
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
