Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFB17C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681179051; x=1712715051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0M521/lsaCWKJu6FPRdm9S37ruKmN/mPKe7uqd6gqxI=;
  b=B0zfd19asJ8TingLkiwx3AZ1WVtZN1xnWfrTrmg2El7xJu0tV03k2XtC
   G9wrNX9SjbivIiWx2JypBK7Utcz8QlPO8zRNpCAzEQCH00phxu4I61Gxf
   87VwZfHqw31VMX0H2ADagJCdwO1tTyx9CbmWQhRLCSvlyYIoJHj1s0w3w
   e2oU6mOlYZJ5xAA24hXEmry0xgc7G8XQENva604RxRGGoo9F4EFNAirPz
   p6+4Ars3G2Z+oV7ug/KIuZKqbaqnEMxOZtnDl3g0yswnL6Lyz3PjoKrXL
   BKiZ+Ml2ZCfsvOYjTuBzX4iNumSnKVLO30toJzzdR2Xm4nU/3qLtYprZm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="346175691"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="346175691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 19:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812392491"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="812392491"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Apr 2023 19:10:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm3T6-000VqD-1a;
	Tue, 11 Apr 2023 02:10:48 +0000
Date: Tue, 11 Apr 2023 10:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 27/36] include/linux/kern_levels.h:5:25:
 warning: format '%d' expects argument of type 'int', but argument 2 has type
 'long int'
Message-ID: <202304111028.xDU8gXH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   2334558ddfcc49430baece1143367805ca186f3b
commit: ce5c4feabae6eec713f26390b7de2e568ffe60b9 [27/36] CHROMIUM: dm-verity: use GPT try counter for integrity retries
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304111028.xDU8gXH8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout ce5c4feabae6eec713f26390b7de2e568ffe60b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash M=drivers/md

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111028.xDU8gXH8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bio.h:8,
                    from drivers/md/dm-verity-chromeos.c:19:
   drivers/md/dm-verity-chromeos.c: In function 'chromeos_handle_retries':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_ERR'
     343 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/device-mapper.h:568:25: note: in expansion of macro 'pr_err'
     568 | #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
         |                         ^~~~~~
   drivers/md/dm-verity-chromeos.c:380:17: note: in expansion of macro 'DMERR'
     380 |                 DMERR("update_tries: could not open device for reading: %d",
         |                 ^~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
