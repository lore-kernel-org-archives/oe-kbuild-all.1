Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298B17E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 00:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686615445; x=1718151445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xARPly7ay4a/Yqms0QSIWKJCzfKiIc4z4mUoT9wV/r4=;
  b=CKpraoeeDn8m8R1/TGTjF5m0u8FZoiK+MiL4Iv7u9g4q1zNz6gXfq7qI
   CJf1apwQ/qhswOttGIRAgQPLfMoyb+9OnmoWnho9rKt7+uGAaEdfBwnKD
   O1t0NdY7Ev2Gpz5+cyPeW1E8zd2+rrfVQVwJzZTBw3jwcvRyG8tezOQ1z
   Y3e+sdroWOFqnnHxfaHpLWb3LC4bhn0Xtr2vNnROt/eBWS22Dr1YEXZLp
   WqTq6fWUNhte3+GsOt/dqnQYR+dOHVZjnK08EG4zM8Ysbk2jpeF1441UI
   HR5dAWUTMJEFz6hBXLP5AquN1hRrfAgLjlycp2pyle8mCFdYQAUudCKEG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358190325"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="358190325"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 17:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958209056"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="958209056"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jun 2023 17:17:23 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8ris-0000ra-1v;
	Tue, 13 Jun 2023 00:17:22 +0000
Date: Tue, 13 Jun 2023 08:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next-fsa4480-ucsi-debug
 44/44] include/linux/kern_levels.h:5:25: warning: format '%d' expects
 argument of type 'int', but argument 5 has type 'long unsigned int'
Message-ID: <202306130855.Wo9RISSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next-fsa4480-ucsi-debug
head:   a72e8da380a21bf580aaf46377318c3703d4107f
commit: a72e8da380a21bf580aaf46377318c3703d4107f [44/44] DEBUGL ucsi
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130855.Wo9RISSS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/a72e8da380a21bf580aaf46377318c3703d4107f
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next-fsa4480-ucsi-debug
        git checkout a72e8da380a21bf580aaf46377318c3703d4107f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/usb/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130855.Wo9RISSS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/usb/typec/ucsi/ucsi.c:9:
   drivers/usb/typec/ucsi/ucsi.c: In function 'ucsi_register_partner':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/usb/typec/ucsi/ucsi.c:754:9: note: in expansion of macro 'pr_err'
     754 |         pr_err("%s:%d AAA register partner: 0x%x=%d\n",
         |         ^~~~~~
   drivers/usb/typec/ucsi/ucsi.c: In function 'ucsi_partner_change':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/usb/typec/ucsi/ucsi.c:801:9: note: in expansion of macro 'pr_err'
     801 |         pr_err("%s:%d AAA partner: 0x%x=%d\n",
         |         ^~~~~~


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
https://github.com/intel/lkp-tests/wiki
