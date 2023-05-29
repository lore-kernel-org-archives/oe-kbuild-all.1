Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD3C8DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685400706; x=1716936706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOLJBB8Q0VN63KHCLey9iFUGYdr2yGop+MSDQ8xYrkU=;
  b=b0fcM5JDRDq4wv9e8EuL7wEzEABi2VHYw65tREBnYC/7cK3XNXCDRc9c
   d2/Vlbd+Lh+5tlX4xQDGZFnZ8vz0B1EBpkEBsmgoVxpjPPplfK4/TvrF1
   2xNfhWwCkXezNRLVDDILgbXSOvmn0+HLcacfrCLteIur/GM3w5zZg0hbi
   ROC9d1HK8Rh2OzSpChk0L1k663QtBW5Zw2LAA0NDsciF7iGus6j8mPDu5
   WFWPNk+HuyIepjFtmkkZRdP0rLLLFrDcHUKhn/vLrJfjSwatSrQHnVrXz
   tXD6nEKlDeo65Y6p2GRl9P67Gm+iDYUIOjijsB6hywuuOVsRkz/Bm/JP3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335129234"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="335129234"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706193665"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706193665"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 15:51:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3liJ-000LAE-2E;
	Mon, 29 May 2023 22:51:43 +0000
Date: Tue, 30 May 2023 06:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 1/12] lib/test_firmware.c:1469:18: error: initialization of
 'const struct attribute **' from incompatible pointer type 'struct attribute
 **'
Message-ID: <202305300658.1ciyV5Qp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lukas,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux doe
head:   67efa89e18815a99a50013cbce4bebdddc63d53b
commit: 57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6 [1/12] sysfs: Constify attrs pointers in struct attribute_group
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305300658.1ciyV5Qp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300658.1ciyV5Qp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from lib/test_firmware.c:14:
>> lib/test_firmware.c:1469:18: error: initialization of 'const struct attribute **' from incompatible pointer type 'struct attribute **' [-Werror=incompatible-pointer-types]
    1469 | ATTRIBUTE_GROUPS(test_dev);
         |                  ^~~~~~~~
   include/linux/sysfs.h:161:18: note: in definition of macro 'ATTRIBUTE_GROUPS'
     161 |         .attrs = _name##_attrs,                                 \
         |                  ^~~~~
   lib/test_firmware.c:1469:18: note: (near initialization for 'test_dev_group.attrs')
    1469 | ATTRIBUTE_GROUPS(test_dev);
         |                  ^~~~~~~~
   include/linux/sysfs.h:161:18: note: in definition of macro 'ATTRIBUTE_GROUPS'
     161 |         .attrs = _name##_attrs,                                 \
         |                  ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from lib/test_kmod.c:18:
>> lib/test_kmod.c:1050:18: error: initialization of 'const struct attribute **' from incompatible pointer type 'struct attribute **' [-Werror=incompatible-pointer-types]
    1050 | ATTRIBUTE_GROUPS(test_dev);
         |                  ^~~~~~~~
   include/linux/sysfs.h:161:18: note: in definition of macro 'ATTRIBUTE_GROUPS'
     161 |         .attrs = _name##_attrs,                                 \
         |                  ^~~~~
   lib/test_kmod.c:1050:18: note: (near initialization for 'test_dev_group.attrs')
    1050 | ATTRIBUTE_GROUPS(test_dev);
         |                  ^~~~~~~~
   include/linux/sysfs.h:161:18: note: in definition of macro 'ATTRIBUTE_GROUPS'
     161 |         .attrs = _name##_attrs,                                 \
         |                  ^~~~~
   cc1: some warnings being treated as errors


vim +1469 lib/test_firmware.c

083a93b0c1f2eff Luis R. Rodriguez 2017-01-23  1468  
083a93b0c1f2eff Luis R. Rodriguez 2017-01-23 @1469  ATTRIBUTE_GROUPS(test_dev);
083a93b0c1f2eff Luis R. Rodriguez 2017-01-23  1470  

:::::: The code at line 1469 was first introduced by commit
:::::: 083a93b0c1f2eff2561305d0b95ac238fbfd100b test_firmware: use device attribute groups

:::::: TO: Luis R. Rodriguez <mcgrof@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
